import 'package:flutter/material.dart';

import 'Detail.dart';

class Populer extends StatelessWidget {
  const Populer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(53, 67, 54, 1),
        elevation: 0.5,
        titleSpacing: 16,
        title: Row(
          children: [
            const DapurLogoWidget(height: 20),
            const SizedBox(width: 8),
            Text(
              'Resep Paling Populer',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSearchBar(),
            const SizedBox(height: 16),
          _buildTrendBanner(),
          const SizedBox(height: 16),
          ..._popularRecipes.map((r) => _RankedRecipeCard(data: r)),
          const SizedBox(height: 16),
          _buildWriteRecipeBanner(),
          const SizedBox(height: 80),
        ],
      ),
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
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Cari resep pupuler',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Banner Tren Mingguan ----------------
  Widget _buildTrendBanner() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: const [
          Icon(Icons.local_fire_department, color: Colors.orange, size: 30),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tren Dapur Minggu Ini',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 2),
                Text(
                  'Menu gurih simpel bawang & goreng renyah',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Banner Tulis Resep ----------------
  Widget _buildWriteRecipeBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          const Text(
            'Punya Resep Andalan Keluarga?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          const Text(
            'Bagikan racikan bumbu rahasia dan raih ratusan disimpan dari komunitas Dapurkita.',
            style: TextStyle(fontSize: 12, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(53, 67, 54, 1),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Tulis Resep Sekarang',
                style: TextStyle(color :Color.fromRGBO(238, 238, 238, 1)),
                ),
            ),
          ),
        ],
      ),
    );
  }
}

// DUMMY DATA
final List<Map<String, String>> _popularRecipes = [
  {
    'rank': '#1 Juara',
    'trending': 'Trending #1',
    'title': 'Ayam Goreng Bawang Putih Renyah Khas Batam',
    'author': 'Chef Chandra',
    'location': 'Jakarta Selatan',
    'time': '30 menit',
    'portion': '4 porsi',
    'saved': '2,4 rb disimpan',
    'cooked': '1,5 rb Cookpad',
    'image' : 'assets/image/AyamGorengBawangPutih.jpg',
  },
  {
    'rank': '#2',
    'trending': 'Sering Tahan Lama',
    'title': 'Bala-Bala Haneut Khas Sunda Renyah Tahan Lama',
    'author': 'Teh Erin Bandung',
    'location': 'Bandung',
    'time': '20 menit',
    'portion': '8 porsi',
    'saved': '1,9 rb disimpan',
    'cooked': '920 Cookpad',
    'image' : 'assets/image/BalaBala.jpg',
  },
  {
    'rank': '#3',
    'trending': 'Pesaing Baru',
    'title': 'Nasi Daun Jeruk Rice Cooker Wangi Gurih Anti Gagal',
    'author': 'Dapur Mama Alif',
    'location': 'Surabaya',
    'time': '25 menit',
    'portion': '3 porsi',
    'saved': '1,3 rb disimpan',
    'cooked': '640 Cookpad',
    'image' : 'assets/image/NasiDaunJeruk.jpg'
  },
  {
    'rank': '#4 Populer',
    'trending': 'Update Terbaru',
    'title': 'Seblak Ceker Pedas Nampol Kencur Melimpah',
    'author': 'Bam Kitchen',
    'location': 'Garut',
    'time': '35 menit',
    'portion': '2 porsi',
    'saved': '1,1 rb disimpan',
    'cooked': '480 Cookpad',
    'image' : 'assets/image/SeblakCeker.jpg'
  },
];

// REUSABLE WIDGETS
class _RankedRecipeCard extends StatelessWidget {
  final Map<String, String> data;
  const _RankedRecipeCard({required this.data});

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
              color: Colors.black.withOpacity(0.05),
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
                  child: _recipeImage(data['image'],height: 160),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: _badge(data['rank']!, color: Colors.amber.shade800),
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
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: _badge(data['trending']!, color: Colors.deepOrange),
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
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        data['author']!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        data['location']!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.bookmark, size: 14, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(
                        data['saved']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.restaurant,
                        size: 14,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        data['cooked']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
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
