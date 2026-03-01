import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // Data de ejemplo
  final List<Map<String, dynamic>> _favorites = [
    {
      'name': 'Manzana Roja',
      'price': 25.00,
      'unit': 'kg',
      'image': 'assets/apple.png',
      'qty': 1,
    },
    {
      'name': 'Leche Entera',
      'price': 18.50,
      'unit': 'litro',
      'image': 'assets/milk.png',
      'qty': 1,
    },
    {
      'name': 'Huevos',
      'price': 45.00,
      'unit': 'docena',
      'image': 'assets/eggs.png',
      'qty': 1,
    },
  ];

  void _increment(int index) {
    setState(() => _favorites[index]['qty']++);
  }

  void _decrement(int index) {
    if (_favorites[index]['qty'] > 1) {
      setState(() => _favorites[index]['qty']--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: const Text('Favorites'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 240, 240, 240),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: _favorites.length,
          itemBuilder: (context, index) {
            final item = _favorites[index];
            return Card(
              color: Colors.white,
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    // Imagen
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Info del producto
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${item['price'].toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(209, 9, 203, 102),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item['unit'],
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Controlador de cantidad
                    Column(
                      children: [
                        _qtyButton(Icons.add, () => _increment(index)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            '${item['qty']}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _qtyButton(Icons.remove, () => _decrement(index)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color.fromARGB(209, 9, 203, 102),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }
}
