import 'package:flutter/material.dart';

// LOCAL IMPORTS
import './price_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
    Widget build(BuildContext context) {
      return Card(
        child: Column(
          children: <Widget>[
            Image.asset(product['image']),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    product['title'],
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  PriceTag(product['price'].toString()),
                ],
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text('Bakery Square, Pittsburgh',),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.info),
                  onPressed: () {
                    return Navigator.pushNamed<bool>(
                      context,
                      '/product/' + productIndex.toString(),                          
                    );
                  }
                ),
                IconButton(
                  color: Colors.red,
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    return Navigator.pushNamed<bool>(
                      context,
                      '/product/' + productIndex.toString(),                          
                    );
                  },
                )
              ],
            ),
          ],
        ),
      );
    }
}