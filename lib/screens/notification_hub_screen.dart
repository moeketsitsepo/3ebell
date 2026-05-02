import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationHubScreen extends StatelessWidget {
  const NotificationHubScreen({Key? key}) : super(key: key);

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
        title: const Text('Notifications', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(icon: const Icon(Icons.done_all, color: Color(0xfff97316)), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Today'),
          _buildNotificationItem(
            icon: Icons.account_balance_wallet,
            title: 'Payment Received',
            body: 'You received R 150.00 for your last trip.',
            time: '2m ago',
            color: Colors.green,
            isUnread: true,
          ),
          _buildNotificationItem(
            icon: Icons.warning,
            title: 'Safety Alert',
            body: 'Unusual traffic reported on N1 Midrand. Expect delays.',
            time: '45m ago',
            color: Colors.orange,
            isUnread: true,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Yesterday'),
          _buildNotificationItem(
            icon: Icons.star,
            title: 'New Rating',
            body: 'A commuter gave you a 5-star rating!',
            time: 'Yesterday, 18:24',
            color: const Color(0xfff97316),
          ),
          _buildNotificationItem(
            icon: Icons.security,
            title: 'Login from New Device',
            body: 'Your account was accessed from a MacBook Pro.',
            time: 'Yesterday, 10:15',
            color: Colors.blue,
          ),
          _buildNotificationItem(
            icon: Icons.card_giftcard,
            title: 'Referral Bonus',
            body: 'Your friend Sipho joined EBell! You earned 50 points.',
            time: 'Yesterday, 08:30',
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 4),
      child: Text(title, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildNotificationItem({required IconData icon, required String title, required String body, required String time, required Color color, bool isUnread = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? const Color(0xff122131) : const Color(0xff0b1120),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isUnread ? const Color(0xfff97316).withOpacity(0.3) : const Color(0xff273647)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(time, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(body, style: const TextStyle(color: Color(0xffbcc7de), fontSize: 13, height: 1.4)),
              ],
            ),
          ),
          if (isUnread) ...[
            const SizedBox(width: 8),
            Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xfff97316), shape: BoxShape.circle)),
          ],
        ],
      ),
    );
  }
}
