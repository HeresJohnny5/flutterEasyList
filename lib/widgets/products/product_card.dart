import 'package:flutter/material.dart';

// LOCAL IMPORTS
import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  // PRIVATE METHOD
  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product['title']),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product['price'].toString()),
        ],
      )
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
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
    );
  }

  @override
    Widget build(BuildContext context) {
      return Card(
        child: Column(
          children: <Widget>[
            Image.asset(product['image']),
            _buildTitlePriceRow(),
            AddressTag('Bakery Square, Pittsburgh',),
            _buildActionButtons(context),
          ],
        ),
      );
    }
}