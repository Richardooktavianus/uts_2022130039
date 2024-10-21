import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022130039/model/produk.dart';
import 'package:uts_2022130039/provider/cart_provider.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({required this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        backgroundColor: Colors.red.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset('assets/images/${widget.product.image}', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              widget.product.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Rp ${widget.product.price.toStringAsFixed(3)}',
              style: TextStyle(fontSize: 22, color: Colors.red.shade400),
            ),
            SizedBox(height: 20),
            Text(
              widget.product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text('$quantity', style: TextStyle(fontSize: 20)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartProvider.addToCart(widget.product, quantity);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}
