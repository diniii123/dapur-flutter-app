import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  final Color primaryGreen = const Color.fromRGBO(53, 67, 54, 1);
  final Color unreadBgColor = const Color(0xFFF3F6F3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildFilterRow(),
          const Divider(height: 1, color: Colors.black12),
          Expanded(
            child: ListView(
              children: [
                _buildDateHeader('Hari ini'),
                _buildNotifTile(
                  avatarUrl: 'https://i.pravatar.cc/150?img=1',
                  content: 'Anisa mulai mengikuti kamu.',
                  time: '10 menit lalu',
                  isUnread: true,
                  showFollowBadge: true,
                ),
                _buildNotifTile(
                  avatarUrl: 'https://i.pravatar.cc/150?img=11',
                  content: 'Raka menyimpan resep Ayam Kecap Rumahan milikmu.',
                  time: '32 menit lalu',
                  trailingImageUrl: 'https://picsum.photos/100/100?random=1',
                ),
                _buildNotifTile(
                  avatarUrl: 'https://i.pravatar.cc/150?img=5',
                  content: 'Dewi membuat Cooksnap dari resep Nasi Goreng Kampung.',
                  time: '1 jam lalu',
                  isUnread: true,
                  trailingImageUrl: 'https://picsum.photos/100/100?random=2',
                ),
                _buildNotifTile(
                  avatarUrl: 'https://i.pravatar.cc/150?img=9',
                  content: 'Sari mengomentari resep Seblak Kuah Pedas milikmu:',
                  time: '2 jam lalu',
                  commentQuote: '"Bumbunya pas banget dan kencurnya wangi!"',
                  trailingImageUrl: 'https://picsum.photos/100/100?random=3',
                ),
                _buildDateHeader('Jumat, 12 September'),
                _buildNotifTile(
                  systemIcon: Icons.bookmark_border,
                  content: 'Resepmu mendapatkan 25 simpan minggu ini.',
                  time: '09.42',
                  showArrow: true,
                ),
                _buildNotifTile(
                  avatarUrl: 'https://i.pravatar.cc/150?img=20',
                  content: 'Ada resep baru dari Rina yang mungkin kamu suka: Bakwan Sayur Renyah.',
                  time: '08.15',
                  trailingImageUrl: 'https://picsum.photos/100/100?random=4',
                ),
                _buildNotifTile(
                  systemIcon: Icons.soup_kitchen_outlined,
                  content: 'Komunitas DapurKita membagikan resep baru: Soto Ayam Rumahan.',
                  time: '07.30',
                  trailingImageUrl: 'https://picsum.photos/100/100?random=5',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- KOMPONEN APP BAR ---
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Notifikasi',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Center(
            child: Text(
              'Tandai semua dibaca',
              style: TextStyle(color: primaryGreen, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  // --- KOMPONEN FILTER ROW ---
  Widget _buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Semua', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Belum Dibaca', style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }

  // --- KOMPONEN HEADER TANGGAL ---
  Widget _buildDateHeader(String title) {
    return Container(
      color: const Color(0xFFFAFAFA),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  // --- KOMPONEN TILE NOTIFIKASI KUSTOM ---
  Widget _buildNotifTile({
    String? avatarUrl,
    IconData? systemIcon,
    required String content,
    required String time,
    String? commentQuote,
    bool isUnread = false,
    String? trailingImageUrl,
    bool showFollowBadge = false,
    bool showArrow = false,
  }) {
    return Container(
      color: isUnread ? unreadBgColor : Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Bagian Avatar / Ikon Kiri
          Stack(
            children: [
              if (avatarUrl != null)
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(avatarUrl),
                )
              else if (systemIcon != null)
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color(0xFFE9EFE9),
                  child: Icon(systemIcon, color: primaryGreen),
                ),
              if (showFollowBadge)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF6B8767),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 14),
                  ),
                )
            ],
          ),
          const SizedBox(width: 12),

          // 2. Bagian Teks Tengah
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                if (commentQuote != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    commentQuote,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // 3. Bagian Trailing Kanan (Gambar / Titik / Panah)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  if (trailingImageUrl != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        trailingImageUrl,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (isUnread) ...[
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: primaryGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                  if (showArrow)
                    const Icon(Icons.chevron_right, color: Colors.black38),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}