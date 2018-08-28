import 'package:flutter/material.dart';

// LOCAL IMPORTS
import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductList() {
    Widget productCards;

    if (products.isNotEmpty) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }

    return productCards;
  }

  @override
    Widget build(BuildContext context) {
      return _buildProductList();
    }
}