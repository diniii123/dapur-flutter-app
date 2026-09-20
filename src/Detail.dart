import 'package:flutter/material.dart';

class DapurLogoWidget extends StatelessWidget {
  final double height;
  const DapurLogoWidget({super.key, this.height = 24});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/image/logo.jpeg',
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}

// Halaman Detail Resep (Gambar 1)
class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final Set<String> _checkedIngredients = {};
  bool _isFollowing = false;
  bool _isSaved = true;
  final int _totalIngredients = 10;

  final List<String> _steps = [
    'Kocok pisang matang hingga halus, lalu campurkan dengan telur ayam dan susu UHT full cream. Aduk rata.',
    'Masukkan tepung terigu, gula pasir, dan baking powder ke dalam adonan. Aduk perlahan hingga tidak ada gumpalan.',
    'Tuangkan margarin cair ke dalam adonan, aduk kembali hingga tercampur rata dan adonan siap dimasak.',
    'Panaskan wajan anti lengket dengan api kecil, tuang satu sendok sayur adonan, masak hingga muncul gelembung kecil.',
    'Balik pancake, masak sisi lainnya hingga matang dan berwarna keemasan. Angkat dan sisihkan.',
    'Sajikan pancake hangat dengan olesan selai buah pala, taburan kayu manis bubuk, dan irisan kacang mede panggang.',
  ];

  void _toggleIngredient(String item) {
    setState(() {
      if (_checkedIngredients.contains(item)) {
        _checkedIngredients.remove(item);
      } else {
        _checkedIngredients.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryOlive = Color.fromRGBO(53, 67, 54, 1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(53, 67, 54, 1),
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(221, 254, 254, 254)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const DapurLogoWidget(height: 20),
            const SizedBox(width: 8),
            Text(
              'Detail Resep',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Utama Resep
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?q=80&w=1000',
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.85),
                        radius: 18,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            _isSaved ? Icons.bookmark : Icons.bookmark_border,
                            size: 20,
                            color: _isSaved ? primaryOlive : Colors.black87,
                          ),
                          onPressed: () {
                            setState(() => _isSaved = !_isSaved);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.85),
                        radius: 18,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.share_outlined, size: 20, color: Colors.black87),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.access_time, size: 14, color: Colors.white),
                        SizedBox(width: 4),
                        Text('25 menit • 4 porsi',
                            style: TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pancake, selai buah pala',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Info Author
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=200',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Liania Adi',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text('@Liania1005 · Jakarta',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () => setState(() => _isFollowing = !_isFollowing),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFF1F6EF),
                          side: const BorderSide(color: Colors.transparent),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                          _isFollowing ? 'Mengikuti' : '+ Ikuti',
                          style: const TextStyle(
                              fontSize: 12,
                              color: primaryOlive,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Terinspirasi ketika wisata ke Banda Neira. Pancake dengan cita rasa manis dan harum pala khas kepulauan rempah.',
                    style: TextStyle(fontSize: 13.5, color: Color(0xFF555555)),
                  ),
                  const SizedBox(height: 16),

                  // Banner Checklist
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F6EF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFD4E3D1)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.edit_note, color: primaryOlive, size: 20),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Ketuk bahan untuk menandai yang siap',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4A5844),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: primaryOlive,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${_checkedIngredients.length}/$_totalIngredients',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bahan-bahan List
                  const Text('Bahan-bahan',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...[
                    '2 buah pisang matang',
                    '1 buah telur ayam',
                    '250 ml susu UHT full cream',
                    '2 sdm margarin / mentega, cairkan',
                    '200 gr tepung terigu serba guna',
                    '1 sdm gula pasir',
                    '1 sdt baking powder',
                    'Selai buah pala asli khas Banda',
                    'Kayu manis bubuk',
                    'Irisan kacang mede panggang'
                  ].map((item) {
                    final isChecked = _checkedIngredients.contains(item);
                    return CheckboxListTile(
                      value: isChecked,
                      onChanged: (_) => _toggleIngredient(item),
                      title: Text(
                        item,
                        style: TextStyle(
                          fontSize: 13.5,
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: isChecked ? Colors.grey : Colors.black87,
                        ),
                      ),
                      activeColor: primaryOlive,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }),
                  const SizedBox(height: 24),

                  // Cara Membuat
                  const Text('Cara Membuat',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ..._steps.asMap().entries.map((entry) {
                    final index = entry.key;
                    final step = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: primaryOlive,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              step,
                              style: const TextStyle(
                                fontSize: 13.5,
                                color: Color(0xFF444444),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}