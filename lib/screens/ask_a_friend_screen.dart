import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AskAFriendScreen extends StatelessWidget {
  const AskAFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xfff97316)),
          onPressed: () {},
        ),
        title: const Text('EBell', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.w900, fontSize: 24)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDnMosuHG4b7uJ6OIQpYBEF6on_wl9o5DeNxhGZXuI9s7RIM4_pUH7HR1QXK_elnM10RQhjAnUdSbeSXms7fztIaIxvnGu5dl148xtqdvIx_ncOCZ5TH-mpSDjSAO_neawkRO-8c9WySYyb_WRlMaPkKkl-88ivGcJPbmoQSNCPOOzS8KtWYm8zRHCIcH7UTaq672M0bcbZnq7UeKJmxDtvT_Hlo_7JLDXkSJG-6UkyjImYz6ui5PIFzHWH5oQnfPKSD7u5pxvelA4'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Request a Ride', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const Text('Find a trusted connection to share your commute.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
            const SizedBox(height: 24),
            _buildSearchBox(),
            const SizedBox(height: 32),
            _buildPendingRequests(),
            const SizedBox(height: 32),
            const Text('Trusted Connections', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildConnectionsGrid(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xff1c2b3c),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Color(0xff584237)),
          SizedBox(width: 12),
          Text('Search friends by name or route...', style: TextStyle(color: Color(0xff584237))),
        ],
      ),
    );
  }

  Widget _buildPendingRequests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.schedule, color: Color(0xfff97316), size: 20),
            SizedBox(width: 8),
            Text('Pending Requests', style: TextStyle(color: Color(0xfff97316), fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildPendingCard('Sarah J.', 'To: Cape Town CBD', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBzTdDG3CGCf_Gr8Fx43aOwwyIcqn1uw473_1E7Xu0_uqJTqFJO-Q6tL8EtTg6ThAjCrJ2ijogsTyjinyvAL6VQ72xBdFjJh3Pbz4HBXleq8eRGCzsa-PcRntkVtbDoQTfFMqaRwi7J6eYpEF3VNCza2LgdeUqk9FZ2Ta_PwFjlid1m5JEkzVM3qxbrOKTfnmryEpTb5lVPaMDBxaW_HBOFKxZZSfGwAeQeSTiak4LN6gr19K57wEMIgzGJ4iSMi3WBkQyEPt3ZXuA'),
              const SizedBox(width: 12),
              _buildPendingCard('Michael T.', 'To: Sandton Station', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBSursrGXZF14FSxB-YzA7iqU4-CHEKSta_sM8a8WpCpNiXuhB3Uz78w12TBuT3vLCGKreV5rldCDRC4ApekPPsMX8u-VnKMQrvRStKdsnLkMo4fQfkiYdPsTU03zofZ1BswlgfX8LrOu3ZCzlydYggiuoUXI48C_U6-1WeGGOqDKGMSVtqSwjAyHUjjBl5dh7g_tP1x0UfqK2pFL94JGsXq8W16Xk-v6tm3203LnJ7vguhTY4xg9KoV549QBJLvPgtdeLuaKhdHCI'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPendingCard(String name, String route, String imageUrl) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20, backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(route, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(color: const Color(0xff051424), borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Awaiting Reply...', style: TextStyle(color: Color(0xfff97316), fontSize: 12)),
                Text('Cancel', style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.8,
      children: [
        _buildConnectionCard('Elena R.', 'Drives a Corolla', 'https://lh3.googleusercontent.com/aida-public/AB6AXuA0EK-ISry47PbTey-c79XJ3o5duQmULshOW358IjvZgZTpa04raX0FuLamzlut60b8S0i-Y21Mb4X-8R77i6LgjiZQOnLDOU-gdu84yfQBz0bpkB06lrdIGXI-fnGahMtupM4MgKWgEFQZ8BgXBExLXmo2rTbq-FekuPuYI89yeDboaFdWaaaWnQh_GydzUgQLS5cFLVUzZURiP4DVPp5JQWfSzDmfU-IK4w_USqvC5RVF6DGhOdz5TzPeWZ4JLpDpVpm60c1T3uQ'),
        _buildConnectionCard('David M.', 'Walks to Station', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBYc5p318u16S-7L-wUathcwtKlw-3GxRNGQfi7XVloIktVGfwoezOe180-xjopMC7yoCcik5V7dfy_87WDoEDpgZf5CePDl9QKKszYJ26EUVmnLj_Y8GLNpM95KU0IHE9KcZamcC6n-GQ2LweNxVkZoEo9AYh_uS8Bud9uadGLG-OueymGHpgsPPqqWKXHLkMqjV2DJmbNUj_q0qRLJXVuSXF8WbN5XpWxDBFH759_ri00hNMeHm_A8Gd9mg9CpU4Nq_N60JlIVmA'),
        _buildConnectionCard('Aisha K.', 'Takes the Bus', 'https://lh3.googleusercontent.com/aida-public/AB6AXuB6KYaDn4o0ClHBguNSEcAw4lggwp9ZgMqdjdpyuelhdVd4hZkFhVeiLSAOMLukTDPI2S3gREuxsU6KBhtfCq00qHY9qh2z287tShsvHIeS2eucxasUd4OHqGAoV45356V1ZWWr0cf7MldQEvNxLzvMBnA0In3eBnc6kYv-pIcg3O68ygmNevTDSGhPmVjo2qZimsL4pZhqdt6s8-__Oyg4II2UecJsEi63mOePH_DOCMKyjb_DzI2BjfT9EeZSRbAGgAA75MKzU0Q'),
        _buildConnectionCard('John B.', 'Rides a Bike', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBR0DGNAhpSsLNpiLpYIYqqkR63ExP5E2n1EM3aSpgyxK6x2Cur3kqHMOaKXF3dj98D1Xq11TrPxc1uvrUBkjPyoP3jR4LEsE_dZopHK0oKwYv7rNDnqqv9HKH7oCYOr4tQf6IqOqE8dls9o2zDJG2FhTHxJg3PGiJP6jHOb3nkwTeaNNLFLhF6q6-E3DPp1ujI0I3T8lgVTeP4mQWEdn9F9AJUaEugCQAFGTTiCfl-rJG6mKF4SCGusRN0JLQUDJvDSS-3uu7JGdo'),
      ],
    );
  }

  Widget _buildConnectionCard(String name, String status, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 32, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(height: 12),
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          Text(status, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Request', style: TextStyle(fontWeight: FontWeight.bold)),
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
          _buildNavItem(Icons.map, 'Map'),
          _buildNavItem(Icons.directions_car, 'Hikes'),
          _buildNavItem(Icons.group, 'Friends', isSelected: true),
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
