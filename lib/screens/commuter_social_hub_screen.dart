import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommuterSocialHubScreen extends StatelessWidget {
  const CommuterSocialHubScreen({Key? key}) : super(key: key);

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
        title: const Text('Social Hub', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(icon: const Icon(Icons.add_comment, color: Color(0xfff97316)), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildFilterTabs(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSocialPost(
                  user: 'Sarah M.',
                  time: '5m ago',
                  content: 'Anyone heading to Sandton from Soweto today? Looking to ride-share! 🚗',
                  tags: ['RideShare', 'Soweto'],
                  likes: 12,
                ),
                _buildSocialPost(
                  user: 'Jacob T.',
                  time: '15m ago',
                  content: 'Found a set of keys at Park Station platform 2. Handed them to security! 🔑',
                  tags: ['LostAndFound', 'ParkStation'],
                  likes: 45,
                ),
                _buildSocialPost(
                  user: 'EBell Official',
                  time: '1h ago',
                  content: 'Maintenance on the N1 Northbound. Expect 15 min delays. 🚧',
                  tags: ['TrafficUpdate'],
                  likes: 120,
                  isOfficial: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      height: 60,
      color: const Color(0xff0b1120),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildTab('All Posts', true),
          _buildTab('Ride Sharing', false),
          _buildTab('Lost & Found', false),
          _buildTab('Updates', false),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xfff97316).withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? const Color(0xfff97316) : const Color(0xff273647)),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xff94a3b8), fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }

  Widget _buildSocialPost({required String user, required String time, required String content, required List<String> tags, required int likes, bool isOfficial = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isOfficial ? const Color(0xfff97316).withOpacity(0.3) : const Color(0xff273647)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 16, backgroundColor: const Color(0xfff97316).withOpacity(0.2), child: Text(user[0], style: const TextStyle(color: Color(0xfff97316)))),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(time, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
                    ],
                  ),
                ],
              ),
              if (isOfficial) Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: const Color(0xfff97316), borderRadius: BorderRadius.circular(4)), child: const Text('OFFICIAL', style: TextStyle(color: Color(0xff582200), fontSize: 9, fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 16),
          Text(content, style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.5)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: tags.map((tag) => Text('#$tag', style: const TextStyle(color: Color(0xfff97316), fontSize: 12, fontWeight: FontWeight.bold))).toList(),
          ),
          const Divider(color: Color(0xff273647), height: 32),
          Row(
            children: [
              Icon(Icons.favorite_border, color: const Color(0xff94a3b8), size: 18),
              const SizedBox(width: 8),
              Text(likes.toString(), style: const TextStyle(color: Color(0xff94a3b8), fontSize: 12)),
              const SizedBox(width: 24),
              const Icon(Icons.mode_comment_outlined, color: Color(0xff94a3b8), size: 18),
              const SizedBox(width: 8),
              const Text('8', style: TextStyle(color: Color(0xff94a3b8), fontSize: 12)),
              const Spacer(),
              const Icon(Icons.share_outlined, color: Color(0xff94a3b8), size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
