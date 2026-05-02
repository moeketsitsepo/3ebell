import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportIssueFormScreen extends StatelessWidget {
  const ReportIssueFormScreen({Key? key}) : super(key: key);

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
        title: const Text('Report Issue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff122131),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff1c2b3c)),
              ),
              child: const Text(
                'Your feedback is critical for maintaining safety and quality across the network. All reports are confidential.',
                style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14),
              ),
            ),
            const SizedBox(height: 24),
            _buildFieldLabel('Issue Category'),
            _buildCategoryDropdown(),
            const SizedBox(height: 20),
            _buildFieldLabel('Detailed Description'),
            _buildDescriptionField(),
            const SizedBox(height: 20),
            _buildFieldLabel('Attach Photos (Optional)'),
            _buildPhotoUpload(),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/support/status'),
                icon: const Icon(Icons.send),
                label: const Text('Submit Report', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff97316),
                  foregroundColor: const Color(0xff582200),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 8,
                  shadowColor: const Color(0xfff97316).withOpacity(0.3),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xff1c2b3c),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: const Color(0xff1c2b3c),
          hint: const Text('Select a category', style: TextStyle(color: Color(0xffe0c0b1))),
          icon: const Icon(Icons.expand_more, color: Color(0xffe0c0b1)),
          items: ['Driver Behavior', 'Vehicle Condition', 'Safety Concern', 'Payment Issue', 'Technical Problem', 'Other']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return TextField(
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'Please describe what happened... Include relevant details like time, location, and vehicle number.',
        hintStyle: const TextStyle(color: Color(0x80e0c0b1)),
        filled: true,
        fillColor: const Color(0xff1c2b3c),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xff273647))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xff273647))),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 14),
    );
  }

  Widget _buildPhotoUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildPhotoSlot(isButton: true),
            const SizedBox(width: 12),
            _buildPhotoSlot(),
          ],
        ),
        const SizedBox(height: 8),
        const Text('Upload up to 3 clear photos to support your report.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
      ],
    );
  }

  Widget _buildPhotoSlot({bool isButton = false}) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: isButton ? const Color(0xff122131) : const Color(0xff010f1f),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff273647), style: isButton ? BorderStyle.solid : BorderStyle.solid),
      ),
      child: isButton
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add_a_photo, color: Color(0xfff97316), size: 32),
                SizedBox(height: 4),
                Text('Add Photo', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
              ],
            )
          : const Icon(Icons.image, color: Color(0x33e0c0b1), size: 32),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xff0b1120),
        border: Border(top: BorderSide(color: Color(0xff1e293b))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home'),
          _buildNavItem(Icons.directions_bus, 'Routes'),
          _buildNavItem(Icons.report, 'Report', isSelected: true),
          _buildNavItem(Icons.person, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
