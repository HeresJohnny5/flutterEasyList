import 'package:flutter/material.dart';
import 'dart:async';

// LOCAL IMPORTS
import '../widgets/ui_elements/title_default.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);

  // PRIVATE METHODS
  // _showWarningDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Are you sure?'),
  //         content: Text('This action cannot be undone!'),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('DISCARD'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //           FlatButton(
  //             child: Text('CONTINUE'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //               Navigator.pop(context, true);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // PRIVATE METHODS
  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Bakery Square, Pittsburgh',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.grey,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          '\$${price.toString()}',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(product.image),
              height: 300.0,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/food.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(product.title),
            ),
            _buildAddressPriceRow(product.price),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                product.description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
