import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EarningsBreakdownScreen extends StatelessWidget {
  const EarningsBreakdownScreen({Key? key}) : super(key: key);

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
        title: const Text('Earnings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuC_54Kuh5EiD37sBtoc2GpW9pjtosFdmKAIJHpfN-RTnHpZA0tTb1PE7rZ9OoV3pYv9fDJnBM_jCq56PQlL7SmkkfSZCU2rwxKl_6z7kPvQetPWqXygYj72bFgLKDnHr7-NRppoEnarXRX_2nFpe2ZF9868BN4TyLXIRqt_2NmOXwBiGz3eknKlEXkz8r-Tv62bEvr77ExLvi0uydtfVRReHo4xbpseNC39rVsXIte4CkA61PP5--HJ9Yx2nt0ntoMWNvKAY2Hj-uA'),
              backgroundColor: const Color(0xff273647),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Balance Card
            _buildBalanceCard(),
            const SizedBox(height: 24),
            // Filters
            _buildTimeFilters(),
            const SizedBox(height: 24),
            // Summary Grid
            _buildSummaryGrid(),
            const SizedBox(height: 24),
            // Recent Trips
            _buildRecentTrips(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Column(
        children: [
          const Text('Total Balance', style: TextStyle(color: Color(0xffbcc7de), fontSize: 14)),
          const SizedBox(height: 8),
          const Text('R 4,850.00', style: TextStyle(color: Color(0xfff97316), fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_wallet, size: 20),
              label: const Text('Withdraw', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfff97316),
                foregroundColor: const Color(0xff582200),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeFilters() {
    return Row(
      children: [
        Expanded(child: _buildFilterChip('Daily', isSelected: false)),
        const SizedBox(width: 8),
        Expanded(child: _buildFilterChip('Weekly', isSelected: true)),
        const SizedBox(width: 8),
        Expanded(child: _buildFilterChip('Monthly', isSelected: false)),
      ],
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xfff97316).withOpacity(0.2) : const Color(0xff1c2b3c),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isSelected ? const Color(0xfff97316) : const Color(0xff273647)),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? const Color(0xfff97316) : const Color(0xffe0c0b1),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildSummaryGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildSummaryItem(Icons.today, 'Today', 'R 420')),
            const SizedBox(width: 12),
            Expanded(child: _buildSummaryItem(Icons.calendar_view_week, 'Weekly', 'R 3,100')),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xff122131),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xff273647)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.volunteer_activism, color: Color(0xfff97316), size: 20),
                  SizedBox(width: 8),
                  Text('Total Tips', style: TextStyle(color: Color(0xffbcc7de), fontSize: 14)),
                ],
              ),
              const Text('R 280', style: TextStyle(color: Color(0xfff97316), fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryItem(IconData icon, String label, String value) {
    return Container(
      height: 96,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xffbcc7de), size: 16),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Color(0xffbcc7de), fontSize: 14)),
            ],
          ),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRecentTrips() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Recent Trips', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: const Text('View All', style: TextStyle(color: Color(0xffbcc7de))),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildTripItem('Sandton City Mall', 'Oct 24, 14:30', 'R 120'),
        const SizedBox(height: 8),
        _buildTripItem('OR Tambo Airport', 'Oct 24, 09:15', 'R 350'),
        const SizedBox(height: 8),
        _buildTripItem('Rosebank Mall', 'Oct 23, 17:45', 'R 85'),
      ],
    );
  }

  Widget _buildTripItem(String title, String subtitle, String price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(color: Color(0xff1c2b3c), shape: BoxShape.circle),
                child: const Icon(Icons.directions_car, color: Color(0xfff97316), size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(color: Color(0xffbcc7de), fontSize: 12)),
                ],
              ),
            ],
          ),
          Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
          _buildNavItem(Icons.local_taxi, 'Map'),
          _buildNavItem(Icons.payments, 'Earnings', isSelected: true),
          _buildNavItem(Icons.calendar_month, 'Schedule'),
          _buildNavItem(Icons.person, 'Account'),
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
