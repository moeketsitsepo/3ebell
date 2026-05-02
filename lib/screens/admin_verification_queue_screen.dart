import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminVerificationQueueScreen extends StatelessWidget {
  const AdminVerificationQueueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: Row(
        children: [
          // Side Navigation (Desktop/Large Screen version simplified for Mobile-first)
          if (MediaQuery.of(context).size.width > 900)
            _buildSideNav(context),
          
          Expanded(
            child: Column(
              children: [
                _buildTopAppBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(context),
                        const SizedBox(height: 32),
                        _buildQueueGrid(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideNav(BuildContext context) {
    return Container(
      width: 260,
      color: const Color(0xff0b1120),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: const [
                Icon(Icons.directions_bus, color: Color(0xfff97316), size: 32),
                SizedBox(width: 12),
                Text('EBell', style: TextStyle(color: Color(0xfff97316), fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Divider(color: Color(0xff1e293b)),
          _buildSideNavItem(Icons.dashboard, 'Dashboard'),
          _buildSideNavItem(Icons.group, 'Users'),
          _buildSideNavItem(Icons.verified_user, 'Verifications', isSelected: true),
          _buildSideNavItem(Icons.assessment, 'Reports'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Driver'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfff97316),
                foregroundColor: const Color(0xff0b1120),
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideNavItem(IconData icon, String label, {bool isSelected = false}) {
    return Container(
      color: isSelected ? const Color(0xff111827) : null,
      child: ListTile(
        leading: Icon(icon, color: isSelected ? const Color(0xfff97316) : const Color(0xff94a3b8)),
        title: Text(label, style: TextStyle(color: isSelected ? Colors.white : const Color(0xff94a3b8))),
        onTap: () {},
      ),
    );
  }

  Widget _buildTopAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff0b1120).withOpacity(0.8),
        border: const Border(bottom: BorderSide(color: Color(0xff1e293b))),
      ),
      child: Row(
        children: [
          if (MediaQuery.of(context).size.width <= 900)
            IconButton(icon: const Icon(Icons.menu, color: Color(0xfff97316)), onPressed: () {}),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff111827),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xff1e293b)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Color(0xff94a3b8), size: 20),
                  SizedBox(width: 8),
                  Text('Search applications...', style: TextStyle(color: Color(0xff94a3b8))),
                ],
              ),
            ),
          ),
          const SizedBox(width: 24),
          const Icon(Icons.notifications, color: Color(0xff94a3b8)),
          const SizedBox(width: 16),
          const Icon(Icons.account_circle, color: Color(0xff94a3b8)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Verification Queue', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text(
          'Review and approve pending driver applications to authorize network access. Verify vehicle documentation and identity records.',
          style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildQueueGrid(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        _buildVerificationCard(
          context,
          name: 'Sipho Ndlovu',
          vehicle: 'Toyota Quantum',
          date: 'Oct 24, 2023',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDRsUBBPxgYXLiE0SzwUrdXcUf1SxLXTwTqS-6JfLoynMdbweFhznREmdbbWO26o0okRfRGTaNYjlTQ75m4t-WwMB64UzLNZvDbKMC6_Kn5_LSbBMGEOuTjH5f7duWwqaibNPGu5p6DYdbOXikSHgUZVj4cgghKyUuB3UfsZl5uj578edAiQMyJkMrOkoZ_0ZCOyE69my9p_FB8cbiQ9ZU6aMml21xwgL9_T2sgdd49-RRf0YRjr5usKqqC10mQ56JOXDK4j1nNT7E',
        ),
        _buildVerificationCard(
          context,
          name: 'Lerato Mokoena',
          vehicle: 'Nissan NV350',
          date: 'Oct 25, 2023',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB80oTIcFpgWKDSjs5XCVbcXNB5lsPm_x-veqUbL_h_bEb_AwbVWKaezLFi38UYr-5JB_P4vHDTPqrzgQ_nfUdhVoTdS3axwoYytgdkp1jUyt64reqewfeu4QR0gwm1wQU3ZUZS4MkJpT87HFCeue2ZvlklU6KDukfY8Ggq1hmYo_7CmJYAZkNKLWhCN2QBQ_2j2GA-lBIx0hzWRVxFrSNYuqXbaZs853YE7QvlE4Xq0Qkmp7i4mGajxdDUzLFxn0p96AQZ4-52IV4',
        ),
        _buildVerificationCard(
          context,
          name: 'Jabulani K.',
          vehicle: 'VW Crafter',
          date: 'Oct 26, 2023',
          imageUrl: null,
        ),
      ],
    );
  }

  Widget _buildVerificationCard(BuildContext context, {required String name, required String vehicle, required String date, String? imageUrl}) {
    return Container(
      width: 380,
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x33584237)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                imageUrl != null
                    ? CircleAvatar(radius: 28, backgroundImage: NetworkImage(imageUrl))
                    : const CircleAvatar(radius: 28, backgroundColor: Color(0xff273647), child: Icon(Icons.person, color: Color(0xffe0c0b1))),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xff929ab2).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xff929ab2).withOpacity(0.2)),
                        ),
                        child: const Text('PENDING REVIEW', style: TextStyle(color: Color(0xff929ab2), fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(child: _buildMiniStat(Icons.airport_shuttle, 'Vehicle', vehicle)),
                const SizedBox(width: 12),
                Expanded(child: _buildMiniStat(Icons.calendar_today, 'Submitted', date)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: Color(0x33584237)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('4 Documents', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                ElevatedButton.icon(
                  onPressed: () => context.push('/admin/driver-review/1'),
                  icon: const Icon(Icons.arrow_forward, size: 16),
                  label: const Text('Review'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff97316),
                    foregroundColor: const Color(0xff582200),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff010f1f).withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: const Color(0xffe0c0b1)),
              const SizedBox(width: 4),
              Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}
