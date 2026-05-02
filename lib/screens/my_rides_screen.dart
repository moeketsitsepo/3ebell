import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MyRidesScreen extends StatelessWidget {
  const MyRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff020617), // slate-950
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.deepOrange),
          onPressed: () {},
        ),
        title: const Text('My Rides', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBObHpIEnQx0qfKo_OWbkYxK_ZR1lIm-yb-Bml6HtU-EUiRIiO2t2sMA_LPfEbQ_AOoNQaLIq765DnJK9swzeNz1Ucvi6FkQQx4xgM_h6ZGzncnrtfRVKw8xZmBHW55MY1Aa_bJhxKaMPaT1fKNKCAMKdYcy8LFCMdsYbqExT-JsnRzXUjm_DlwEYvm0BJAvb1PUOEL9N2DZV6UMHEGyLnX8S2WqXuPAYIAstf3yEeV_5yGNmDlljmGulvilMyzEILHfoexixHK_Jw'),
              backgroundColor: const Color(0xff273647),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff1c2b3c), // surface-container-high
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total this month', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                      const Text('12 Rides', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, color: Colors.white, size: 18),
                    label: const Text('Filter', style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xff584237)), // outline-variant
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            const Text('RECENT ACTIVITY', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
            const SizedBox(height: 16),
            
            // Ride Cards
            _buildRideCard(
              context,
              date: 'Today, 14:30',
              status: 'Completed',
              pickup: '144 Oxford Rd, Rosebank',
              destination: 'Sandton City',
              driverName: 'Nelson',
              driverImg: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCiJZkEDozwf6ZZrMvkkSsR_bejZ1wXennplvqUr-o3CC09K5CH0fept1YlOZ9TsoM2i4QSuuOS5Lnz5fWXaC0J2VhHHci7dkDU7Xt9xJ6rCl5hF77qCfhqv7-H-cwRpvsqOPaGBXVhyDIm-KDNe-Co_9pVD5OylczNeAzWyjeB_aetwSkEG0rILTSFDFImr1SF2Lt5Fjnbo9MFHATNsIqCgbnwopVzUvLhG3Bn5XCIOsTZdVECS4Cjc2WnAviuyskeDFmfI3j1wek',
              price: 'R 145.00',
            ),
            const SizedBox(height: 16),
            _buildRideCard(
              context,
              date: 'Yesterday, 08:15',
              status: 'Completed',
              pickup: 'Melrose Arch',
              destination: 'OR Tambo Int.',
              driverName: 'Sipho',
              driverImg: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBknMeDGAZD7NwhFHdq7durLAlv3h3wfh9eBGvehvfZIvHuilaL3ZunNp3Ix-23xMrhVPZjF1QjOvI1m7qZVHj_CXo-5wfxAdUJyb-R96J6unYotalR_SKFkUdwcvVrSg15VNp9oVJ0gs4E_GHBsqMa0M2-dtNofhRKb_QqOfIIkqxYaYWeuAa-2x60vEBQ5-FTgMkGkt6dGWzqccEb5jXlHqx-tVRveq3hzaFCkfmayA7Ajfgfipx0Aol7l0I2_QBVsVh9_jpHqaA',
              price: 'R 420.00',
            ),
            const SizedBox(height: 16),
            _buildRideCard(
              context,
              date: 'Yesterday, 08:15',
              status: 'Completed', // Note: original HTML says Completed for Card 3 as well, though comment said Canceled
              pickup: 'Melrose Arch',
              destination: 'OR Tambo Int.',
              driverName: 'Sipho',
              driverImg: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBknMeDGAZD7NwhFHdq7durLAlv3h3wfh9eBGvehvfZIvHuilaL3ZunNp3Ix-23xMrhVPZjF1QjOvI1m7qZVHj_CXo-5wfxAdUJyb-R96J6unYotalR_SKFkUdwcvVrSg15VNp9oVJ0gs4E_GHBsqMa0M2-dtNofhRKb_QqOfIIkqxYaYWeuAa-2x60vEBQ5-FTgMkGkt6dGWzqccEb5jXlHqx-tVRveq3hzaFCkfmayA7Ajfgfipx0Aol7l0I2_QBVsVh9_jpHqaA',
              price: 'R 420.00',
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
                _buildNavItem(icon: Icons.home, label: 'HOME'),
                _buildNavItem(icon: Icons.directions_car, label: 'MY RIDES', isSelected: true),
                _buildNavItem(icon: Icons.payments, label: 'PAYMENTS'),
                _buildNavItem(icon: Icons.person, label: 'ACCOUNT'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRideCard(BuildContext context, {required String date, required String status, required String pickup, required String destination, required String driverName, required String driverImg, required String price}) {
    return InkWell(
      onTap: () => context.push('/ride-details/1'),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff122131),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0x33584237)), // outline-variant/20
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 4,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xfff97316),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 18, color: Color(0xffe0c0b1)),
                          const SizedBox(width: 8),
                          Text(date, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0x1Affb690),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(status.toUpperCase(), style: const TextStyle(color: Color(0xfff97316), fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(width: 10, height: 10, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xff584237), width: 2))),
                          Container(width: 2, height: 40, color: const Color(0x66584237)),
                          Container(width: 10, height: 10, decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xfff97316))),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pickup', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                            Text(pickup, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 12),
                            Text('To', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                            Text(destination, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Color(0x33584237)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(radius: 20, backgroundImage: NetworkImage(driverImg)),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Driver', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                              Text(driverName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      Text(price, style: const TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
                  color: const Color(0x1Af97316), // orange-500/10
                  borderRadius: BorderRadius.circular(12),
                )
              : null,
          child: Icon(
            icon,
            color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), // orange-500 or slate-500
            size: 28,
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
