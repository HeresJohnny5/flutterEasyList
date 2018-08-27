import 'package:flutter/material.dart';

// LOCAL IMPORTS
import './price_tag.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  // PRIVATE METHOD
  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
            child: Column(
              children: <Widget>[
                Image.asset(products[index]['image']),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        products[index]['title'],
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      PriceTag(products[index]['price'].toString()),
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
                          '/product/' + index.toString(),                          
                        );
                      }
                    ),
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        
                      },
                    )
                  ],
                ),
              ],
            ),
          );
  }

  Widget _buildProductList() {
    Widget productCards;

    if (products.isNotEmpty) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
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