import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// LOCAL IMPORTS
import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  // PRIVATE METHOD
  Widget _buildTitlePriceRow() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(product.title),
            SizedBox(
              width: 8.0,
            ),
            PriceTag(product.price.toString()),
          ],
        ));
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.info),
            onPressed: () => Navigator.pushNamed<bool>(
                  context,
                  '/product/' + productIndex.toString(),
                )),
        ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              color: Colors.red,
              icon: Icon(model.allProducts[productIndex].isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                model.selectProduct(productIndex);
                model.toggleProductFavoriteStatus();
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitlePriceRow(),
          AddressTag(
            'Bakery Square, Pittsburgh',
          ),
          Text(product.userEmail),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
