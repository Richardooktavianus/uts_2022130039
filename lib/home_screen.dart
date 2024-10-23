import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022130039/cart_screen.dart';
import 'package:uts_2022130039/model/produk.dart';
import 'package:uts_2022130039/produk_screen.dart';
import 'package:uts_2022130039/provider/cart_provider.dart';
import 'package:uts_2022130039/provider/search_provider.dart';
import 'package:uts_2022130039/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        id: 1,
        title: 'Iphone 13',
        description:
            'The iPhone 13’s brighter display, longer battery life and powerful cameras make it the best iPhone for those on a budget. We wish it had faster charging and the iPhone 13 Pro’s adaptive 120Hz display, but you are not missing that much versus the iPhone 14.',
        price: 10000.000,
        image: 'iphone.png',
      ),
      Product(
        id: 2,
        title: 'Samsung S24 Ultra',
        description:
            'The Samsung Galaxy S24 Ultra comes with 6.8-inch Dynamic AMOLED display with 120Hz refresh rate and Qualcomm Snapdragon 8 Gen 3 processor. Specs also include 5000mAh battery and Quad camera setup on the back.',
        price: 20000.000,
        image: 'samsung.jpeg',
      ),
      Product(
        id: 3,
        title: 'Xiaomi 14T',
        description:
            'The Xiaomi 14 may very well be the kind of phone most should experience, in part because it brings the Leica camera hardware and software to the fore. Previously, Xiaomi only included all Leica features in its Pro or Ultra models, but has now done it for this, the smallest of the bunch. This time, the 14 Pro is a Chinese market exclusive, leaving the 14 and 14 Ultra as the two global options.A phone with a 6.3-inch OLED display doesnt sound “small,” yet the Xiaomi 14 feels like it belongs in a newer class of what can be considered more compact devices. Think of the Samsung Galaxy S24, Google Pixel 8, or iPhone 15 in the same vein. The difference is Xiaomi wants this phone to stand out as the best in its class for mobile photography and beyond.',
        price: 7000.000,
        image: 'xiaomi.jpeg',
      ),
      Product(
        id: 4,
        title: 'IPhone 14',
        description:
            'iPhone 14 and 14 Plus are available in three internal storage configurations: 128, 256, and 512 GB. Both models have 6 GB of RAM, an increase over the previous iPhone 13 and 13 mini models 4 GB of RAM. The iPhone 14 and 14 Plus have the same IP68 rating for dust and water resistance as their predecessors.',
        price: 20000.000,
        image: 'iphone14.jpeg',
      ),
      Product(
        id: 5,
        title: 'Realme 14 Pro 5G',
        description:
            'The Realme 14 Pro 5G will come with the latest Android 14, ensuring enhanced functionality and smooth multitasking. It features a huge 6.74-inches Crystal-clear Full HD+ display, perfect for both work and entertainment. Enjoy an ultra-smooth experience, perfect for gaming and high-performance tasks. With a All-day 5500 mAh battery life, you can stay powered throughout the day without frequent charging.',
        price: 5000.000,
        image: 'realm14.jpeg',
      ),
      Product(
        id: 6,
        title: 'Infinix NOTE 40 PRO 5G',
        description:
            'Hadirnya Infinix Note 40 Pro 5G dan Note 40 Pro+ 5G memberikan lebih banyak pilihan bagi konsumen Infinix sesuai preferensi spesifikasi dengan pengalaman performance dengan baterai dan fast charging untuk bermain game, dan keseluruhan entertainment, yang pastinya tetap paling kompetitif di segmennya secara harga',
        price: 3500.000,
        image: 'infinix.jpeg',
      ),
    ];

    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Products'),
        backgroundColor: Colors.red.shade400,
        actions: [
          // Tambah ikon pencarian di AppBar
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(products),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red.shade400,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'img/${product.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Rp ${product.price.toStringAsFixed(3)}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
        backgroundColor: Colors.red.shade400,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
