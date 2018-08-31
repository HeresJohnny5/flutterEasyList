import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final int productIndex;
  final Map<String, dynamic> product;

  ProductEditPage({this.addProduct, this.productIndex, this.updateProduct, this.product});

  @override
    State<StatefulWidget> createState() {
      return _ProductEditPageState();
    }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Title',
      ),
      initialValue: widget.product == null ? '' : widget.product['title'],
      validator: (String value) {
        if (value.isEmpty || value.length <= 5) {
          return 'Title is required and must be 5+ characters.';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Description',
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      initialValue: widget.product == null ? '' : widget.product['description'],
      validator: (String value) {
        if (value.isEmpty || value.length <= 10) {
          return 'Description is required and must be 10+ characters.';
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Price',
      ),
      keyboardType: TextInputType.numberWithOptions(),
      initialValue: widget.product == null ? '' : widget.product['price'].toString(),
      validator: (String value) {
        if (value.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number.';
        }
      },
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  Widget _buildPageContent() {
    final double deviceWidth = MediaQuery.of(context).size.width;
    // print(deviceWidth);
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    // print(targetWidth);
    final double targetPadding = deviceWidth - targetWidth;
    // print(targetPadding);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(height: 10.0,),
              RaisedButton(
                padding: EdgeInsets.all(20.0),
                textColor: Colors.white,
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(widget.productIndex, _formData);
    }


    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
    Widget build(BuildContext context) {
      final Widget pageContent = _buildPageContent();

      return widget.product == null ? pageContent : Scaffold(
        appBar: AppBar(
          title: Text('Edit Product'),
        ),
        body: pageContent,
      );
    }
}