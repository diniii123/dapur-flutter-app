import 'package:flutter/material.dart';

import 'Detail.dart';
import 'Notifikasi.dart';
import 'Upload.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(53, 67, 54, 1),
        elevation: 0.5,
        titleSpacing: 16,
        title: Row(
          children: [
            const DapurLogoWidget(height: 20),
            const SizedBox(width: 8),
            Text(
              'Beranda',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    Icons.notifications_none,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    size: 26,
                  ),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(244, 67, 54, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            _buildTopBar(context),
            const SizedBox(height: 16),
            const Text(
              'Inspirasi Dapur Rumahan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _sectionTitle('Rekomendasi untukmu'),
            const SizedBox(height: 12),
            ..._recommendations.map((r) => _RecommendationCard(data: r)),
            const SizedBox(height: 12),
            _sectionTitle('Resep populer hari ini', trailing: 'Lihat semua'),
            const SizedBox(height: 12),
            _buildPopularMiniList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecipeUploadPage()),
          );
        },
        backgroundColor: const Color.fromRGBO(53, 67, 54, 1),
        icon: const Icon(Icons.add, color: Color.fromRGBO(255, 255, 255, 1)),
        label: const Text(
          'Tambah Resep',
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // ---------------- Top Bar (greeting) ----------------
  Widget _buildTopBar(BuildContext context) {
    return const Text(
      'Hari Rabu 9/9, mau masak apa hari ini?',
      style: TextStyle(fontSize: 12, color: Colors.grey),
    );
  }

  // ---------------- Search Bar ----------------
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              enabled: false, // tampilan statis, non-fungsional
              decoration: InputDecoration(
                hintText: 'Cari resep, bahan, atau pengguna',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Popular mini list ----------------
  Widget _buildPopularMiniList() {
    return Row(
      children: _popularMini
          .map(
            (item) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: _recipeImage(item['image'], height: 90),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item['title']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      item['time']!,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _sectionTitle(String title, {String? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (trailing != null)
          Text(
            trailing,
            style: const TextStyle(fontSize: 12, color: Color.fromRGBO(53, 67, 54, 1)),
          ),
      ],
    );
  }
}

// DUMMY DATA
final List<Map<String, String>> _recommendations = [
  {
    'title': 'Nasi Goreng Kampung Spesial',
    'author': 'Rina Kitchen',
    'rating': '4.9',
    'saved': '342 disimpan',
    'tip': 'Resep warisan nenek dengan bumbu kunci telur dan ikan asin cabe pete yang bikin nagih, pas untuk sarapan.',
    'time': '20 menit',
    'portion': '2 porsi',
    'image': 'assets/image/NasiGorengKampung.jpg',
  },
  {
    'title': 'Sop Ayam Bening Gurih',
    'author': 'Bunda Sarah',
    'rating': '4.8',
    'saved': '160 disimpan',
    'tip': 'Tips: Tambahkan sedikit jahe untuk aroma sedap tanpa bikin badan cepat masuk angin.',
    'time': '30 menit',
    'portion': '4 porsi',
    'image': 'assets/image/SopAyamBening.jpg',
  },
];

final List<Map<String, String>> _popularMini = [
  {
    'title': 'Ayam Kecap Mentega',
    'time': '25 menit',
    'image': 'assets/image/AyamKecapMentega.jpg',
  },
  {
    'title': 'Bakwan Sayur Renyah',
    'time': '15 menit',
    'image': 'assets/image/BakwanSayur.jpg',
  },
];

// REUSABLE WIDGETS
class _RecommendationCard extends StatelessWidget {
  final Map<String, String> data;
  const _RecommendationCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RecipeDetailPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 112, 117, 111),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: _recipeImage(data['image'], height: 150),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.bookmark_border,
                      size: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: _badge('${data['time']} · ${data['portion']}'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        data['author']!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      Text(
                        ' ${data['rating']}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        data['saved']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 174, 183, 175),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      data['tip']!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(221, 49, 47, 47),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// GAMBAR RESEP
Widget _recipeImage(String? assetPath, {double height = 150}) {
  if (assetPath == null) {
    return _placeholderImage(height: height);
  }
  return Image.asset(
    assetPath,
    height: height,
    width: double.infinity,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      return _placeholderImage(height: height);
    },
  );
}

// Placeholder gambar (dipakai kalau asset belum ada / gagal dimuat)
Widget _placeholderImage({double height = 150}) {
  return Container(
    height: height,
    width: double.infinity,
    color: Colors.grey.shade300,
    child: Icon(Icons.image, color: Colors.grey.shade500, size: 36),
  );
}

Widget _badge(String text, {Color color = Colors.black87}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withOpacity(0.85),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 10),
    ),
  );
}
