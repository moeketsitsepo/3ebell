import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TripRatingFlowScreen extends StatelessWidget {
  const TripRatingFlowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: () => context.go('/dashboard'), child: const Text('Skip', style: TextStyle(color: Color(0xffe0c0b1)))),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAWP4expDXgyKaHlpoMOcO165te47yHpTIYELllDnmBNfShxM8BN9Wid0dxzPu-m6DeZ0nSPuCAn992Ag4nmF_MjB4rLp8SxA9IjwIAjFmFq9FAEKAHbRFw5Ju7AcBCquZuUI0wsY7MJ3jwIoNUq3iQmAObLGlSaPHK2ZYeRCfBcbdIgLXzYg--BIBRc1hIY3l-d6AO4o882cQaaeA7oLVQECCtJWHm7bPEj6IznGVJ7CkDJs1QZ7HXt6N-nwq9rf44xTXW7vuTZaw')),
            const SizedBox(height: 16),
            const Text('How was your trip with Tsepo?', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => Icon(Icons.star, color: index < 4 ? const Color(0xfff97316) : const Color(0xff273647), size: 40)),
            ),
            const SizedBox(height: 40),
            const Align(alignment: Alignment.centerLeft, child: Text('What went well?', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
            _buildTagsWrap(),
            const SizedBox(height: 32),
            _buildCommentBox(),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Submit Feedback', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff97316),
                  foregroundColor: const Color(0xff582200),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsWrap() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _buildTag('Safe Driving', true),
        _buildTag('Clean Vehicle', true),
        _buildTag('On Time', false),
        _buildTag('Professional', true),
        _buildTag('Great Music', false),
        _buildTag('Helpful', false),
      ],
    );
  }

  Widget _buildTag(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xfff97316).withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? const Color(0xfff97316) : const Color(0xff273647)),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xffe0c0b1), fontSize: 12, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
    );
  }

  Widget _buildCommentBox() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Additional comments (optional)',
        hintStyle: const TextStyle(color: Color(0x80e0c0b1)),
        filled: true,
        fillColor: const Color(0xff122131),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
