import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xff94a3b8)),
          onPressed: () {},
        ),
        title: const Text(
          'Vehicle Management',
          style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color(0xff94a3b8)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Register New Vehicle',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add a new transport asset to your active fleet to start receiving assignments.',
              style: TextStyle(color: Color(0xffaeb9d0), fontSize: 16),
            ),
            const SizedBox(height: 32),
            
            // Vehicle Details Form
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xff122131),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xff273647)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.directions_car, color: Color(0xfff97316)),
                      SizedBox(width: 8),
                      Text('Vehicle Details', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildDropdownField('Vehicle Type', 'Select category...'),
                  const SizedBox(height: 16),
                  _buildTextField('Make & Model', 'e.g. Toyota Quantum'),
                  const SizedBox(height: 16),
                  _buildTextField('License Plate', 'ABC 123 GP', isMono: true),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Verification Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xff122131),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xff273647)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.photo_camera, color: Color(0xfff97316)),
                      SizedBox(width: 8),
                      Text('Vehicle Verification', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Upload clear photos of the vehicle\'s exterior (front and side) and interior cabin to expedite verification.',
                    style: TextStyle(color: Color(0xffaeb9d0), fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  _buildUploadPlaceholder(),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Actions
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.how_to_reg),
                label: const Text('Register Vehicle', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff97316),
                  foregroundColor: const Color(0xff582200),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff1c2b3c),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isMono = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          style: TextStyle(
            color: Colors.white,
            fontFamily: isMono ? 'monospace' : null,
            letterSpacing: isMono ? 2 : null,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xff273647)),
            filled: true,
            fillColor: const Color(0xff0d1c2d),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xff273647))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xfff97316))),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xff0d1c2d),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xff273647)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(hint, style: const TextStyle(color: Color(0xff273647))),
              dropdownColor: const Color(0xff0d1c2d),
              icon: const Icon(Icons.expand_more, color: Color(0xffaeb9d0)),
              isExpanded: true,
              items: const [],
              onChanged: (val) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadPlaceholder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xff0d1c2d).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff273647), style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(color: Color(0xff273647), shape: BoxShape.circle),
            child: const Icon(Icons.add_a_photo, color: Color(0xffe0c0b1), size: 32),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Upload Vehicle Photos', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xfff97316),
              foregroundColor: const Color(0xff582200),
            ),
          ),
          const SizedBox(height: 8),
          const Text('JPG, PNG up to 10MB each', style: TextStyle(color: Color(0xffaeb9d0), fontSize: 12)),
        ],
      ),
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
          _buildNavItem(Icons.directions_car, 'Fleet'),
          _buildNavItem(Icons.add_circle, 'Add', isSelected: true),
          _buildNavItem(Icons.analytics, 'Activity'),
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
        Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), fontSize: 10)),
      ],
    );
  }
}
