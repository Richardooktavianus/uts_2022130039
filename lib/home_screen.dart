import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Our products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Aksi untuk pencarian
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Aksi untuk membuka keranjang
            },
          ),
        ],
        backgroundColor: Colors.red.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom grid
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1, // Rasio tinggi dan lebar grid
          ),
          itemCount: 6, // Jumlah produk (ganti sesuai kebutuhan)
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/product_$index.png', // Gambar lokal produk
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Title', // Nama produk
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi ketika tombol keranjang ditekan
        },
        backgroundColor: Colors.red.shade400,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}