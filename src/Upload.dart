import 'package:flutter/material.dart';

class RecipeUploadPage extends StatefulWidget {
  const RecipeUploadPage({super.key});

  @override
  State<RecipeUploadPage> createState() => _RecipeUploadPageState();
}

class _RecipeUploadPageState extends State<RecipeUploadPage> {
  // Controller Form Utama
  final _titleController = TextEditingController(
    text: 'Ayam Kecap Manis Rumahan',
  );
  final _storyController = TextEditingController(
    text: 'Resep warisan ibu yang selalu jadi favorit keluarga saat santap malam. Kuncinya ada pada karamelisasi bawang bombay dan...',
  );
  final _timeController = TextEditingController(text: '30 menit');
  final _portionController = TextEditingController(text: '4 orang');
  String _selectedCategory = 'Lauk Pauk & Masakan Ayam';

  // Dynamic Item List
  final List<Map<String, TextEditingController>> _ingredients = [
    {
      'name': TextEditingController(text: 'Daging ayam filet, potong'),
      'qty': TextEditingController(text: '500 gr'),
    },
    {
      'name': TextEditingController(text: 'Kecap manis kental'),
      'qty': TextEditingController(text: '3 sdm'),
    },
    {
      'name': TextEditingController(text: 'Bawang bombay, iris tipis'),
      'qty': TextEditingController(text: '1 buah'),
    },
  ];

  final List<TextEditingController> _steps = [
    TextEditingController(
      text: 'Tumis bawang putih cincang dan bawang bombay dengan sedikit minyak hingga layu dan mengeluarkan aroma harum.',
    ),
    TextEditingController(
      text: 'Masukkan potongan ayam filet, aduk hingga daging berubah warna keputihan. Tuangkan kecap manis, saus tiram, dan...',
    ),
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _storyController.dispose();
    _timeController.dispose();
    _portionController.dispose();
    for (var item in _ingredients) {
      item['name']?.dispose();
      item['qty']?.dispose();
    }
    for (var controller in _steps) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addIngredient() {
    setState(() {
      _ingredients.add({
        'name': TextEditingController(),
        'qty': TextEditingController(),
      });
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredients[index]['name']?.dispose();
      _ingredients[index]['qty']?.dispose();
      _ingredients.removeAt(index);
    });
  }

  void _addStep() {
    setState(() {
      _steps.add(TextEditingController());
    });
  }

  void _removeStep(int index) {
    setState(() {
      _steps[index].dispose();
      _steps.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(53, 67, 54, 1);
    const lightGreenColor = Color(0xFFEFF5EE);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(53, 67, 54, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const Text(
              'Upload Resep',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.edit_note, color: primaryColor, size: 20),
                    SizedBox(width: 4),
                    Text(
                      'Mode Penulisan Resep',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    side: const BorderSide(color: Color(0xFFC2D6C0)),
                    backgroundColor: lightGreenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Simpan draf',
                    style: TextStyle(color: primaryColor, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Foto Masakan Utama Area
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FCF9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFCCE0CB)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: lightGreenColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Tambahkan foto masakan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Foto menggugah selera membuat kreasi\nAnda dicoba ribuan teman Dapur',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Section 1: Informasi Dasar Resep
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFieldLabel('Judul Resep', isRequired: true),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _titleController,
                      decoration: _inputDecoration(
                        'Contoh: Ayam Goreng Mentega',
                      ),
                    ),
                    const SizedBox(height: 14),

                    _buildTextFieldLabel('Cerita Resep', isOptional: true),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _storyController,
                      maxLines: 3,
                      decoration: _inputDecoration(
                        'Ceritakan latar belakang atau keunikan resep ini',
                      ),
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildIconLabel(
                                Icons.access_time,
                                'Waktu Memasak',
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                controller: _timeController,
                                decoration: _inputDecoration('30 menit'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildIconLabel(
                                Icons.people_outline,
                                'Porsi Saji',
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                controller: _portionController,
                                decoration: _inputDecoration('4 orang'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    _buildIconLabel(
                      Icons.label_outlined,
                      'Kategori Hidangan',
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: _inputDecoration('Pilih kategori'),
                      items:
                          [
                                'Lauk Pauk & Masakan Ayam',
                                'Makanan Penutup',
                                'Minuman',
                                'Cemilan',
                              ]
                              .map(
                                (val) => DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    val,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (val) {
                        if (val != null)
                          setState(() => _selectedCategory = val);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Section 2: Bahan-Bahan
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              color: primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Bahan-Bahan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${_ingredients.length} Bahan',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Tulis takaran jelas agar memudahkan pemasak pemula.',
                      style: TextStyle(fontSize: 11, color: Colors.black45),
                    ),
                    const SizedBox(height: 12),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _ingredients.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  controller: _ingredients[index]['name'],
                                  decoration: _inputDecoration('Nama Bahan'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: _ingredients[index]['qty'],
                                  decoration: _inputDecoration(
                                    'Jumlah/Takaran',
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.black45,
                                  size: 20,
                                ),
                                onPressed: () => _removeIngredient(index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        onPressed: _addIngredient,
                        style: TextButton.styleFrom(
                          backgroundColor: lightGreenColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: primaryColor,
                          size: 18,
                        ),
                        label: const Text(
                          '+ Tambah Bahan Lain',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Section 3: Langkah Memasak
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.format_list_numbered,
                              color: primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Langkah Memasak',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${_steps.length} Langkah',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Tulis secara urut dan jelas dari permulaan hingga penyajian.',
                      style: TextStyle(fontSize: 11, color: Colors.black45),
                    ),
                    const SizedBox(height: 12),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _steps.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: primaryColor,
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => _removeStep(index),
                                    child: const Icon(
                                      Icons.close,
                                      size: 18,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _steps[index],
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  hintText: 'Jelaskan instruksi langkah ini...',
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black38,
                                  ),
                                ),
                                style: const TextStyle(fontSize: 13),
                              ),
                              const Divider(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.add_photo_alternate_outlined,
                                          size: 16,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Foto/Langkah Opsional',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'Maks 5MB',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        onPressed: _addStep,
                        style: TextButton.styleFrom(
                          backgroundColor: lightGreenColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: primaryColor,
                          size: 18,
                        ),
                        label: const Text(
                          '+ Tambah Langkah Berikutnya',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Section 4: Tips Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F7F2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFD6E4D4)),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lightbulb_outline, color: primaryColor, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tips Komunitas Dapur',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Resep dengan foto langkah berurutan 3x lebih sering disimpan dalam daftar masak para pemasak lain!',
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Section 5: Bottom Button & Terms
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Resep berhasil diupload!')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.auto_fix_high,
                  color: Colors.white,
                  size: 18,
                ),
                label: const Text(
                  'Upload Resep Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Dengan ini Anda menyetujui ketentuan publikasi.',
              style: TextStyle(fontSize: 10, color: Colors.black45),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper Widgets & Input Styles
  Widget _buildTextFieldLabel(
    String title, {
    bool isRequired = false,
    bool isOptional = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            if (isRequired)
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        if (isOptional)
          const Text(
            'Opsional',
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
      ],
    );
  }

  Widget _buildIconLabel(
    IconData icon,
    String title, {
    Color color = Colors.black,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 12, color: Colors.black38),
      filled: true,
      fillColor: const Color(0xFFF7F8FA),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color.fromRGBO(53, 67, 54, 1),
          width: 1,
        ),
      ),
    );
  }
}
