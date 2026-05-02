import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff020617), // slate-950
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xfff97316)),
          onPressed: () {},
        ),
        title: const Text('Wallet', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xff1c2b3c),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xff584237)),
              ),
              child: const Icon(Icons.person, color: Color(0xffffb690), size: 18),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xff1c2b3c),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff584237)),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('CURRENT BALANCE', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.1)),
                  const SizedBox(height: 8),
                  const Text('R 250.00', style: TextStyle(color: Color(0xffffb690), fontWeight: FontWeight.bold, fontSize: 32)),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text('Top Up'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff97316),
                            foregroundColor: const Color(0xff582200),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_downward),
                          label: const Text('Withdraw'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xffd4e4fa),
                            backgroundColor: const Color(0xff2c3a4c),
                            side: const BorderSide(color: Color(0xff584237)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Payment Methods
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payment Methods', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: const Text('Add New', style: TextStyle(color: Color(0xffffb690), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildPaymentMethod(icon: Icons.credit_card, title: 'Visa', subtitle: 'ending in 4242'),
            const SizedBox(height: 8),
            _buildPaymentMethod(icon: Icons.smartphone, title: 'MTN MoMo', subtitle: 'Mobile Money'),
            const SizedBox(height: 24),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All', style: TextStyle(color: Color(0xffffb690), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff122131),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff584237)),
              ),
              child: Column(
                children: [
                  _buildTransactionItem(icon: Icons.directions_car, title: 'Ride to Sandton', date: 'Today, 08:30 AM', amount: '- R 45.00', isPositive: false),
                  const Divider(color: Color(0xff273647), height: 1),
                  _buildTransactionItem(icon: Icons.add, title: 'Wallet Top Up', date: 'Yesterday, 14:15 PM', amount: '+ R 100.00', isPositive: true),
                  const Divider(color: Color(0xff273647), height: 1),
                  _buildTransactionItem(icon: Icons.directions_car, title: 'Ride to OR Tambo', date: '12 Oct, 16:45 PM', amount: '- R 120.00', isPositive: false),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff020617), // slate-950
          border: Border(top: BorderSide(color: Color(0xff1e293b))), // slate-800
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.map, label: 'MAP'),
                _buildNavItem(icon: Icons.account_balance_wallet, label: 'WALLET', isSelected: true),
                _buildNavItem(icon: Icons.receipt_long, label: 'HISTORY'),
                _buildNavItem(icon: Icons.person, label: 'PROFILE'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod({required IconData icon, required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xff2c3a4c),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: const Color(0xffd4e4fa)),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                ],
              ),
            ],
          ),
          const Icon(Icons.chevron_right, color: Color(0xffe0c0b1)),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({required IconData icon, required String title, required String date, required String amount, required bool isPositive}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isPositive ? const Color(0x33f97316) : const Color(0xff2c3a4c),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: isPositive ? const Color(0xffffb690) : const Color(0xffd4e4fa)),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(date, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                ],
              ),
            ],
          ),
          Text(amount, style: TextStyle(color: isPositive ? const Color(0xffffb690) : Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: isSelected
              ? BoxDecoration(
                  color: const Color(0x1Af97316),
                  borderRadius: BorderRadius.circular(12),
                )
              : null,
          child: Icon(
            icon,
            color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b),
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b),
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }
}
