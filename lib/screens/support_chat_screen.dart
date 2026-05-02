import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupportChatScreen extends StatelessWidget {
  const SupportChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xfff97316)),
          onPressed: () => context.pop(),
        ),
        title: const Text('Messages', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert, color: Color(0xfff97316)), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildChatHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildDateDivider('Today, 08:14 AM'),
                _buildIncomingMessage(
                  'Good morning. I have arrived at the pickup point. I\'m parked near the main entrance.',
                  '08:14 AM',
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAWP4expDXgyKaHlpoMOcO165te47yHpTIYELllDnmBNfShxM8BN9Wid0dxzPu-m6DeZ0nSPuCAn992Ag4nmF_MjB4rLp8SxA9IjwIAjFmFq9FAEKAHbRFw5Ju7AcBCquZuUI0wsY7MJ3jwIoNUq3iQmAObLGlSaPHK2ZYeRCfBcbdIgLXzYg--BIBRc1hIY3l-d6AO4o882cQaaeA7oLVQECCtJWHm7bPEj6IznGVJ7CkDJs1QZ7HXt6N-nwq9rf44xTXW7vuTZaw',
                ),
                _buildOutgoingMessage('Morning Tsepo! I see you. I am walking down now.', '08:16 AM'),
                _buildIncomingMessage(
                  'No problem, take your time.',
                  '08:16 AM',
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAWP4expDXgyKaHlpoMOcO165te47yHpTIYELllDnmBNfShxM8BN9Wid0dxzPu-m6DeZ0nSPuCAn992Ag4nmF_MjB4rLp8SxA9IjwIAjFmFq9FAEKAHbRFw5Ju7AcBCquZuUI0wsY7MJ3jwIoNUq3iQmAObLGlSaPHK2ZYeRCfBcbdIgLXzYg--BIBRc1hIY3l-d6AO4o882cQaaeA7oLVQECCtJWHm7bPEj6IznGVJ7CkDJs1QZ7HXt6N-nwq9rf44xTXW7vuTZaw',
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xff1c2b3c),
        border: Border(bottom: BorderSide(color: Color(0xff273647))),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAWP4expDXgyKaHlpoMOcO165te47yHpTIYELllDnmBNfShxM8BN9Wid0dxzPu-m6DeZ0nSPuCAn992Ag4nmF_MjB4rLp8SxA9IjwIAjFmFq9FAEKAHbRFw5Ju7AcBCquZuUI0wsY7MJ3jwIoNUq3iQmAObLGlSaPHK2ZYeRCfBcbdIgLXzYg--BIBRc1hIY3l-d6AO4o882cQaaeA7oLVQECCtJWHm7bPEj6IznGVJ7CkDJs1QZ7HXt6N-nwq9rf44xTXW7vuTZaw'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, border: Border.all(color: const Color(0xff1c2b3c), width: 2)),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Tsepo - Driver', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Online', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.call, color: Color(0xfff97316)), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildDateDivider(String text) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(color: const Color(0xff0d1c2d), borderRadius: BorderRadius.circular(20)),
        child: Text(text, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
      ),
    );
  }

  Widget _buildIncomingMessage(String text, String time, String avatarUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(radius: 16, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xff1c2b3c),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomRight: Radius.circular(16), bottomLeft: Radius.circular(4)),
                  ),
                  child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
                ),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 10)),
              ],
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildOutgoingMessage(String text, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 40),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xfff97316),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(4)),
                  ),
                  child: Text(text, style: const TextStyle(color: Color(0xff582200), fontSize: 14)),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(time, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 10)),
                    const SizedBox(width: 4),
                    const Icon(Icons.done_all, color: Color(0xfff97316), size: 14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xff122131),
        border: Border(top: BorderSide(color: Color(0xff273647))),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(icon: const Icon(Icons.attach_file, color: Color(0xffe0c0b1)), onPressed: () {}),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff273647),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xff584237)),
                ),
                child: const TextField(
                  decoration: InputDecoration(hintText: 'Type a message...', hintStyle: TextStyle(color: Color(0x80e0c0b1)), border: InputBorder.none),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(color: Color(0xfff97316), shape: BoxShape.circle),
              child: const Icon(Icons.send, color: Color(0xff582200)),
            ),
          ],
        ),
      ),
    );
  }
}
