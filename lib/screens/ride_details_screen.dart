import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RideDetailsScreen extends StatelessWidget {
  final String rideId;
  const RideDetailsScreen({Key? key, required this.rideId}) : super(key: key);

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
        title: const Text('Ride Details', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xff94a3b8)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Map Header
            Stack(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuD9C7v28kh3aY99NLKIaPOQGWs96pPj9xJg594L-SSdgKLQokw-YGxmPose8NutX1liTaLr_CLC3jiZe4JSSsEYpdwSIRwjIBFw45cBXzrD2927glyad0oEWmfZzGZGTsjiKowUVQxP29m0PflVlPvNHwLxXoIp5P4DdPJAZJ62GF1THkcohg3jCIKvjxwWTHIsoLdliB7UXpyhqbZG_rcvEhWIAFFVz8oCtu9Z0f4hQ2wHBI_UFginXQHBL_hrlf6zs98LCU1de2Y'),
                      fit: BoxFit.cover,
                      opacity: 0.5,
                    ),
                  ),
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xff051424),
                        const Color(0xff051424).withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Transform.translate(
                offset: const Offset(0, -64),
                child: Column(
                  children: [
                    // Fare Card
                    _buildHeroCard(),
                    const SizedBox(height: 12),
                    // Route Card
                    _buildRouteCard(),
                    const SizedBox(height: 12),
                    // Driver Card
                    _buildDriverCard(),
                    const SizedBox(height: 16),
                    // Actions
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Total Fare', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
                  Text('R 145.00', style: TextStyle(color: Color(0xffffb690), fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xff273647),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xff584237)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.check_circle, color: Color(0xffbec6e0), size: 14),
                    SizedBox(width: 6),
                    Text('Completed', style: TextStyle(color: Color(0xffbec6e0), fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Color(0xff273647), thickness: 1, height: 24),
          ),
          Row(
            children: const [
              Icon(Icons.calendar_today, color: Color(0xfff97316), size: 18),
              SizedBox(width: 12),
              Text('12 Oct 2023, 18:45 PM', style: TextStyle(color: Color(0xffd4e4fa), fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRouteCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 24,
            bottom: 24,
            child: Container(
              width: 2,
              color: const Color(0xff273647).withOpacity(0.5),
            ),
          ),
          Column(
            children: [
              _buildRoutePoint(
                icon: Icons.circle,
                iconColor: const Color(0xfff97316),
                title: '14 Long Street, CBD',
                subtitle: 'Pickup • 18:45 PM',
                isStart: true,
              ),
              const SizedBox(height: 16),
              _buildRoutePoint(
                icon: Icons.location_on,
                iconColor: const Color(0xffe0c0b1),
                title: 'Camps Bay Beach Front',
                subtitle: 'Destination • 19:12 PM',
                isStart: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoutePoint({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required bool isStart,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xff273647),
            shape: BoxShape.circle,
            border: Border.all(color: isStart ? const Color(0xfff97316) : const Color(0xff273647)),
          ),
          child: Icon(icon, color: iconColor, size: isStart ? 10 : 16),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDriverCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBvPmMMVfunCrgL5mdEIJwsSbKMczE43oMLkhdHLclXuIqk7DuYfIYMdQ4vyY7mTkQMU1LouJNtDPtRr3H2Ow8WS5Bo4skENYu1I8ibjJERFWSln3MD-miug5RDT9PVhXFruEhhqCQW8_ziZh0WbxBVSGTDNN-sZ7XHtRdVDwJq5dadQQ1qbeNQql3va_lsu33IiEf6A6iGpjiHf2Uhzb1IOTUwaZskNqjyinO1Kl8WrTQ_7q0VMXUMgo7A6wejqnHOnG1K3zyMiww'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: const Color(0xff273647), width: 2),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Sipho M.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Toyota Corolla • CA 123-456', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xff1c2b3c),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xff273647)),
            ),
            child: Row(
              children: const [
                Text('4.9', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                SizedBox(width: 4),
                Icon(Icons.star, color: Color(0xffffb690), size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        _buildActionButton(Icons.receipt_long, 'Download Receipt'),
        const SizedBox(height: 12),
        _buildActionButton(Icons.help_outline, 'Help & Support', isPrimary: false),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, {bool isPrimary = true}) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white, size: 20),
        label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        style: OutlinedButton.styleFrom(
          backgroundColor: isPrimary ? const Color(0xff273647) : Colors.transparent,
          side: const BorderSide(color: Color(0xff273647)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
