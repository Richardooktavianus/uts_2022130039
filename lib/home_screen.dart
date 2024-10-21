import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022130039/model/produk.dart';
import 'package:uts_2022130039/produk_screen.dart';
import 'package:uts_2022130039/provider/cart_provider.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example product data
    final products = [
      Product(
        id: 1,
        title: 'Product A',
        description: 'This is a description for Product A.',
        price: 9999.999,
        image: 'product_0.png',
      ),
      Product(
        id: 2,
        title: 'Product B',
        description: 'This is a description for Product B.',
        price: 8999.999,
        image: 'product_1.png',
      ),
      Product(
        id: 3,
        title: 'Product C',
        description: 'This is a description for Product C.',
        price: 7999.999,
        image: 'product_2.png',
      ),
      // Add more products as needed
    ];

    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
        backgroundColor: Colors.red.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
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
                        'assets/images/${product.image}', // Local product image
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
