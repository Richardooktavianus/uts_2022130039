import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022130039/provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.red.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        'img/${cartItem.product.image}',
                        fit: BoxFit.cover,
                        width: 50,
                      ),
                      title: Text(cartItem.product.title),
                      subtitle: Text(
                          'Rp ${cartItem.product.price.toStringAsFixed(3)} x ${cartItem.quantity}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Tambahkan tombol hapus
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              cartProvider.removeFromCart(cartItem);
                            },
                          ),
                          Text(
                            'Rp ${(cartItem.product.price * cartItem.quantity).toStringAsFixed(3)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp ${cartProvider.totalPrice().toStringAsFixed(3)}',
                    style: TextStyle(fontSize: 22, color: Colors.red.shade400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
