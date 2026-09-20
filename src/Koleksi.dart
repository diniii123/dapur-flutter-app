import 'package:flutter/material.dart';
import 'Detail.dart'; 
import 'Notifikasi.dart';
import 'Upload.dart';

class KoleksiPage extends StatefulWidget {
  const KoleksiPage({super.key});

  @override
  State<KoleksiPage> createState() => _KoleksiPageState();
}

class _KoleksiPageState extends State<KoleksiPage> {
  String _selectedTab = 'Tersimpan';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _savedRecipes = [
    {
      'id': '1',
      'title': 'Rawon Daging Sapi Khas Surabaya',
      'author': 'Dapur Pak Dapur',
      'city': 'Surabaya',
      'time': '45 mnt',
      'portion': '4 porsi',
      'rating': '4.9',
      'reviews': '136',
      'image': 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=800',
      'isSaved': true,
    },
    {
      'id': '2',
      'title': 'Tempe Mendoan Purwokerto + Sambal Kecap',
      'author': 'Mba Sri',
      'city': 'Purwokerto',
      'time': '15 mnt',
      'portion': '10 potong',
      'rating': '4.8',
      'reviews': '82',
      'image': 'https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?q=80&w=800',
      'isSaved': true,
    },
    {
      'id': '3',
      'title': 'Sayur Asem Segar Rumahan',
      'author': 'Dapur Oma',
      'city': 'Jakarta',
      'time': '25 mnt',
      'portion': '4 porsi',
      'rating': '5.0',
      'reviews': '214',
      'image': 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?q=80&w=800',
      'isSaved': true,
    },
    {
      'id': '4',
      'title': 'Ayam Bakar Taliwang Pedas Manis',
      'author': 'Lombok Kitchen',
      'city': 'Mataram',
      'time': '40 mnt',
      'portion': '2 porsi',
      'rating': '4.7',
      'reviews': '98',
      'image': 'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?q=80&w=800',
      'isSaved': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const primaryOlive = Color.fromRGBO(53, 67, 54, 1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(53, 67, 54, 1),
        elevation: 0.5,
        titleSpacing: 16,
        title: Row(
          children: [
            const DapurLogoWidget(height: 20),
            const SizedBox(width: 8),
            Text(
              'Koleksi',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 16)),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded, color: Color.fromARGB(221, 255, 255, 255)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationScreen()),
                  );
                },
              ),
              Positioned(
                top: 3,
                right: 3,
                child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 67, 54, 1),
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
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecipeUploadPage()),
          );
        },
        backgroundColor: primaryOlive,
        elevation: 3,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Tambah Resep',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F4F1),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari di Koleksi Resep...',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[500], size: 20),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildFilterChip('Tersimpan'),
                  _buildFilterChip('Resepku'),
                  _buildFilterChip('Diimpor'),
                  _buildFilterChip('Cooksnap Saya'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Resep terakhir dilihat
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.history_rounded, size: 18, color: Colors.grey[700]),
                      const SizedBox(width: 6),
                      const Text(
                        'Resep terakhir dilihat',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Lihat semua',
                    style: TextStyle(
                      fontSize: 12,
                      color: primaryOlive,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Horizontal List
            SizedBox(
              height: 175,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildRecentlyViewedCard(
                    context,
                    title: 'Pancake Selai Buah Pala',
                    author: 'Liania Adi',
                    timeAgo: '1 jam lalu',
                    imageUrl:
                        'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?q=80&w=600',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecipeDetailPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  _buildRecentlyViewedCard(
                    context,
                    title: 'Sop Iga Sapi Buntut',
                    author: 'Dapur Ibu',
                    timeAgo: '3 jam lalu',
                    imageUrl:
                        'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecipeDetailPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Header Section Tersimpan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Tersimpan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2EBE0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${_savedRecipes.where((r) => r['isSaved'] == true).length} resep',
                          style: const TextStyle(
                            fontSize: 11,
                            color: primaryOlive,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.swap_vert, size: 14, color: Colors.black87),
                        SizedBox(width: 4),
                        Text(
                          'Terbaru',
                          style: TextStyle(fontSize: 11, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Vertical List Resep
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _savedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = _savedRecipes[index];
                return _buildSavedRecipeCard(context, recipe);
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedTab == label;
    const primaryOlive = Color.fromRGBO(53, 67, 54, 1);

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[800],
            fontSize: 12.5,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        onSelected: (selected) {
          if (selected) setState(() => _selectedTab = label);
        },
        selectedColor: primaryOlive,
        backgroundColor: Colors.white,
        side: BorderSide(
          color: isSelected ? primaryOlive : Colors.grey.shade300,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        showCheckmark: false,
      ),
    );
  }

  Widget _buildRecentlyViewedCard(
    BuildContext context, {
    required String title,
    required String author,
    required String timeAgo,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    imageUrl,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.65),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.access_time, size: 10, color: Colors.white),
                        const SizedBox(width: 3),
                        Text(
                          timeAgo,
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.soup_kitchen_outlined, size: 12, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        author,
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
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

  Widget _buildSavedRecipeCard(BuildContext context, Map<String, dynamic> recipe) {
    const primaryOlive = Color(0xFF7B946F);

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RecipeDetailPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                  child: Image.network(
                    recipe['image'],
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        recipe['isSaved'] ? Icons.bookmark : Icons.bookmark_border,
                        color: recipe['isSaved'] ? primaryOlive : Colors.black87,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          recipe['isSaved'] = !recipe['isSaved'];
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.check_circle_outline, size: 14, color: primaryOlive),
                          const SizedBox(width: 4),
                          Text(
                            recipe['author'],
                            style: TextStyle(
                              fontSize: 11.5,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        recipe['city'],
                        style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    recipe['title'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 13, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(recipe['time'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(width: 8),
                      const Text('•', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(width: 8),
                      const Icon(Icons.restaurant, size: 13, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(recipe['portion'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(width: 8),
                      const Text('•', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(width: 8),
                      const Icon(Icons.star, size: 14, color: Color(0xFFD96B27)),
                      const SizedBox(width: 2),
                      Text(
                        '${recipe['rating']} (${recipe['reviews']})',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
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