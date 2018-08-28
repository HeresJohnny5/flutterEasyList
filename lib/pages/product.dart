import 'package:flutter/material.dart';
import 'dart:async';

// LOCAL IMPORTS
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String description;

  ProductPage(this.imageUrl, this.title, this.price, this.description);

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

  @override
    Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TitleDefault(title),
              ),
              Row(
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
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ),                   
            ],
          ),
        ),
      );
    }
}