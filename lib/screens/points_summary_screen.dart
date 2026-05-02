import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PointsSummaryScreen extends StatelessWidget {
  const PointsSummaryScreen({Key? key}) : super(key: key);

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
        title: const Text('EBell', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.w900, fontSize: 24)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCsVHyqlAHZjkDIvBJOHUuRrlzC9bQMrqT3-5Nu7XcL_nAGvFERdIM5Xsl7JyNuOsVbTmHotKgpzZTTqI5-2dT9ONq91HhWnVDHPLOHXbgB2EaARENOkvyjLDqZ1pghxWseyoj_XXnbJncDO1fvrTaiFH-uZPgCEvbpL6Segb7HfSJLtbC-O_w5rryjPumHjlHhNslW4vtVKxU3BfZJ7Sj1SIb92wG7kkXgaNYEiwhKvB5io2YgTFJ4B3kFl-pjtdIn-xojVjbez0I'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Subscription & Referrals', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTabs(),
            const SizedBox(height: 24),
            _buildTotalPointsCard(),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildHowItWorksCard()),
                const SizedBox(width: 12),
                Expanded(child: _buildReferralCard()),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xff0d1c2d),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTab('My Plan', isSelected: false),
          _buildTab('Points', isSelected: true),
          _buildTab('Referrals', isSelected: false),
        ],
      ),
    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xfff97316) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xff582200) : const Color(0xffe0c0b1),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildTotalPointsCard() {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff122131), Color(0xff1c2b3c)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xfff97316).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('YOUR TOTAL POINTS', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12, letterSpacing: 1.2, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('2,450', style: TextStyle(color: Color(0xffffb690), fontSize: 48, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff0b1120).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xff584237)),
                ),
                child: const Icon(Icons.emoji_events, color: Color(0xffffb690), size: 48),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.help, color: Color(0xffbcc7de), size: 20),
              SizedBox(width: 8),
              Text('How Points Work', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          _buildStep(Icons.add_circle, 'Earn 10 points for every standard commute booked.'),
          const SizedBox(height: 12),
          _buildStep(Icons.star, 'Receive 50 bonus points when you leave a detailed review.'),
          const SizedBox(height: 12),
          _buildStep(Icons.redeem, 'Redeem points for ride discounts or exclusive offers.'),
        ],
      ),
    );
  }

  Widget _buildStep(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xffffb690), size: 16),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12))),
      ],
    );
  }

  Widget _buildReferralCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.group_add, color: Color(0xffbcc7de), size: 20),
              SizedBox(width: 8),
              Text('Referral Code', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Share this code with friends. When they complete their first ride, you both receive 100 points.',
            style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xff0b1120),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xff584237)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('EBELL-X79K', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 2)),
                Icon(Icons.content_copy, color: Color(0xfff97316), size: 16),
              ],
            ),
          ),
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
          _buildNavItem(Icons.grid_view, 'Hub'),
          _buildNavItem(Icons.explore, 'Live Map'),
          _buildNavItem(Icons.stars, 'Plan', isSelected: true),
          _buildNavItem(Icons.admin_panel_settings, 'Admin'),
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
