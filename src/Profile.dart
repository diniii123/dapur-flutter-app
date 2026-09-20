import 'package:flutter/material.dart';

import 'Detail.dart';
import 'Notifikasi.dart';
import 'Upload.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> recipes = [
    {
      'title': 'Seblak Kuah Pedas Jeletot',
      'time': '15 mnt',
      'likes': '128',
      'image':
          'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    },
    {
      'title': 'Ayam Kecap Manis Gurih',
      'time': '30 mnt',
      'likes': '245',
      'image':
          'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=600',
    },
    {
      'title': 'Brownies Kukus Cokelat Legit',
      'time': '45 mnt',
      'likes': '312',
      'image':
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600',
    },
    {
      'title': 'Es Kopi Susu Gula Aren',
      'time': '5 mnt',
      'likes': '89',
      'image':
          'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 28,
        title: Row(
          children: [
            const Text(
              'Profil',
              style: TextStyle(
                color: Color.fromRGBO(53, 67, 54, 1),
                fontSize: 17,
                fontWeight: FontWeight.w600,
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
                    color: Color.fromRGBO(53, 67, 54, 1),
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

      // BODY
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProfileHeader(),
                    _buildStats(),
                    _buildEditButton(),
                    const SizedBox(height: 20),
                    _buildTabs(),
                    _buildRecipeGrid(context),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecipeUploadPage()),
          );
        },
        backgroundColor: const Color.fromRGBO(53, 67, 54, 1),
        elevation: 4,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Tambah Resep',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13,),
        ),
      ),
    );
  }

  // PROFILE HEADER
  Widget _buildProfileHeader() {
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          const SizedBox(height: 8),
 
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  'Profil',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share_outlined,
                          size: 22,
                          color: Color.fromRGBO(53, 67, 54, 1),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings_outlined,
                          size: 23,
                          color: Color.fromRGBO(53, 67, 54, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // FOTO PROFIL
          Stack(
            children: [
              Container(
                width: 94,
                height: 94,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromRGBO(53, 67, 54, 1),
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
                  ),
                ),
              ),

              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(53, 67, 54, 1),
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Text(
            'PAB Kelompok 4',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 2),

          const Text(
            '@kelompok4nihh_',
            style: TextStyle(fontSize: 13, color: Color(0xFF705F56)),
          ),

          const SizedBox(height: 10),

          // LOKASI + STATUS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F5EF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFD6E1D4)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 15,
                  color: Color.fromRGBO(53, 67, 54, 1),
                ),
                SizedBox(width: 4),
                Text(
                  'Bandung',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6C806B)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Suka masakan rumahan dan berbagi resep sederhana.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, height: 1.5),
          ),

          const Text(
            'Resep praktis anak kos & keluarga kecil 🍳',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  // STATS
  Widget _buildStats() {
    return Container(
      margin: const EdgeInsets.fromLTRB(28, 22, 28, 0),
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(53, 67, 54, 1)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          _StatItem(number: '24', label: 'Resep'),
          _StatDivider(),
          _StatItem(number: '156', label: 'Pengikut'),
          _StatDivider(),
          _StatItem(number: '89', label: 'Mengikuti'),
        ],
      ),
    );
  }

  // EDIT BUTTON
  Widget _buildEditButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(28, 8, 28, 0),
      width: double.infinity,
      height: 43,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.edit_outlined, size: 18),
        label: const Text(
          'Edit profil',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color.fromRGBO(53, 67, 54, 1),
          side: const BorderSide(color: Color.fromRGBO(53, 67, 54, 1)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // TABS
  Widget _buildTabs() {
    final tabs = ['Resep (24)', 'Tersimpan (38)', 'Cooksnap (12)'];

    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEAE6E2))),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final selected = selectedTab == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(top: 12, bottom: 11),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: selected
                          ? const Color.fromRGBO(53, 67, 54, 1)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                    color: selected
                        ? const Color.fromRGBO(53, 67, 54, 1)
                        : const Color(0xFF624F45),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // RECIPE GRID
  Widget _buildRecipeGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 12, 28, 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.67,
        ),
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return _RecipeCard(
            title: recipe['title'],
            time: recipe['time'],
            likes: recipe['likes'],
            image: recipe['image'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecipeDetailPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// STAT ITEM
class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF705F56)),
          ),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(height: 32, width: 1, color: const Color(0xFFE8E2DE));
  }
}

// RECIPE CARD
class _RecipeCard extends StatelessWidget {
  final String title;
  final String time;
  final String likes;
  final String image;
  final VoidCallback? onTap;

  const _RecipeCard({
    required this.title,
    required this.time,
    required this.likes,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(13),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: const Color(0xFFE8E3DF)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.25,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        color: const Color(0xFFEAE5E0),
                        child: const Icon(
                          Icons.restaurant,
                          size: 40,
                          color: Color(0xFFB9A99F),
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                  right: 7,
                  top: 7,
                  child: Container(
                    width: 29,
                    height: 29,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),

            // CONTENT
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 8, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        size: 13,
                        color: Color(0xFF6D5B51),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF604F46),
                        ),
                      ),

                      const Spacer(),

                      const Icon(
                        Icons.favorite,
                        size: 14,
                        color: Color(0xFFAA5C12),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        likes,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9A5A17),
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
