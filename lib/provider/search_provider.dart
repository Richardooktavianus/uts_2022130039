import 'package:flutter/material.dart';
import 'package:uts_2022130039/model/produk.dart';
import 'package:uts_2022130039/produk_screen.dart';

class ProductSearchDelegate extends SearchDelegate {
  final List<Product> products;

  ProductSearchDelegate(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products.where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: results.map((product) => ListTile(
        title: Text(product.title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(product: product),
            ),
          );
        },
      )).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products.where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: suggestions.map((product) => ListTile(
        title: Text(product.title),
        onTap: () {
          query = product.title;
          showResults(context);
        },
      )).toList(),
    );
  }
}
