import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoyaltyRewardsScreen extends StatelessWidget {
  const LoyaltyRewardsScreen({Key? key}) : super(key: key);

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
        title: const Text('EBell Rewards', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildPointsHeader(),
            const SizedBox(height: 32),
            _buildRedeemSection(),
            const SizedBox(height: 32),
            _buildChallengesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsHeader() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xfff97316), Color(0xffea580c)]),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: const Color(0xfff97316).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        children: [
          const Text('AVAILABLE POINTS', style: TextStyle(color: Color(0xff582200), fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.5)),
          const SizedBox(height: 8),
          const Text('2,450', style: TextStyle(color: Color(0xff582200), fontSize: 48, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          const Text('Equivalent to R 24.50', style: TextStyle(color: Color(0xff582200), fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
            child: const Text('Gold Member', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildRedeemSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Redeem Points', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildRewardItem('10% Trip Discount', '500 Points', Icons.local_offer, Colors.purple),
        _buildRewardItem('R 20.00 Wallet Top-up', '2000 Points', Icons.account_balance_wallet, Colors.green),
        _buildRewardItem('Free Mini-Bus Ride', '1500 Points', Icons.directions_bus, const Color(0xfff97316)),
      ],
    );
  }

  Widget _buildRewardItem(String title, String points, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: color)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text(points, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Redeem'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1c2b3c),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Current Challenges', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('The Early Bird', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('+100 pts', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              const Text('Take 3 trips before 08:00 AM this week.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              const SizedBox(height: 16),
              LinearProgressIndicator(value: 0.66, backgroundColor: const Color(0xff051424), valueColor: const AlwaysStoppedAnimation(Color(0xfff97316))),
              const SizedBox(height: 8),
              const Text('2/3 trips completed', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 10)),
            ],
          ),
        ),
      ],
    );
  }
}
