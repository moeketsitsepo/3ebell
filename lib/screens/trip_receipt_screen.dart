import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TripReceiptScreen extends StatelessWidget {
  const TripReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120).withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xfff97316)),
          onPressed: () => context.pop(),
        ),
        title: const Text('Transaction Receipt', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(icon: const Icon(Icons.share, color: Color(0xfff97316)), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xfff97316).withOpacity(0.2), shape: BoxShape.circle),
                child: const Icon(Icons.check_circle, color: Color(0xfff97316), size: 48),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Payment Successful', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Your transaction has been processed.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('R', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1.5)),
                Text('150.00', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 32),
            _buildReceiptCard(),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(icon: Icons.download, label: 'Download PDF', isPrimary: false),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildActionButton(icon: Icons.share, label: 'Share Receipt', isPrimary: true),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/trip/rate'),
                icon: const Icon(Icons.star_border),
                label: const Text('Rate Your Trip', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff122131),
                  foregroundColor: const Color(0xfff97316),
                  side: const BorderSide(color: Color(0xfff97316)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildReceiptRow('Transaction ID', 'TXN-9928374'),
                const SizedBox(height: 12),
                _buildReceiptRow('Date & Time', '24 Oct, 15:45'),
                const SizedBox(height: 12),
                _buildReceiptRow('Payment Method', 'Visa **** 4242', icon: Icons.credit_card),
                const SizedBox(height: 12),
                _buildReceiptRow('Type', 'Ride Payment'),
              ],
            ),
          ),
          _buildDashedLine(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildReceiptRow('Base Fare', 'R 130.00', isDetail: true),
                const SizedBox(height: 8),
                _buildReceiptRow('Tip', 'R 20.00', isDetail: true),
                const SizedBox(height: 16),
                const Divider(color: Color(0xff584237)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('R 150.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value, {IconData? icon, bool isDetail = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: const Color(0xffe0c0b1), fontSize: isDetail ? 12 : 14)),
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color(0xffe0c0b1), size: 14),
              const SizedBox(width: 8),
            ],
            Text(value, style: TextStyle(color: Colors.white, fontWeight: isDetail ? FontWeight.normal : FontWeight.bold, fontSize: isDetail ? 12 : 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildDashedLine() {
    return Row(
      children: [
        Container(width: 6, height: 12, decoration: const BoxDecoration(color: Color(0xff051424), borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6)))),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  (constraints.constrainWidth() / 10).floor(),
                  (index) => Container(width: 5, height: 1, color: const Color(0xff584237)),
                ),
              );
            },
          ),
        ),
        Container(width: 6, height: 12, decoration: const BoxDecoration(color: Color(0xff051424), borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)))),
      ],
    );
  }

  Widget _buildActionButton({required IconData icon, required String label, required bool isPrimary}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xfff97316) : const Color(0xff1c2b3c),
        borderRadius: BorderRadius.circular(8),
        border: isPrimary ? null : Border.all(color: const Color(0xff584237)),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isPrimary ? const Color(0xff582200) : Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: isPrimary ? const Color(0xff582200) : Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
