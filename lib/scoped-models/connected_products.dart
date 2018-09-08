import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

// LOCAL IMPORTS
import '../models/product.dart';
import '../models/user.dart';

class ConnectedProductsModel extends Model {
  List<Product> _products = [];
  User _authenticatedUser;
  int _selProductIndex;

  void addProduct(String title, String description, double price, String image) {
    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image': 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=86c8c1fd5e9e5b384696472a095c42ac&auto=format&fit=crop&w=1350&q=80',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id,
    };

    http.post('https://flutter-easy-list.firebaseio.com/products.json', body: json.encode(productData))
      .then((http.Response response) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        print("Response status: ${response.statusCode}");
        print("Response body: $responseData");

        final Product newProduct = Product(
          id: responseData['name'],
          title: title, 
          description: description, 
          price: price, 
          image: image, 
          userEmail: _authenticatedUser.email, 
          userId: _authenticatedUser.id
        );

        _products.add(newProduct);
        notifyListeners();
      }
    );
  }
}

class ProductsModel extends ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }

    return _products[selectedProductIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  // PRIVATE METHOD
  void updateProduct(String title, String description, double price, String image) {
    final Product updatedProduct = Product(
      title: title, 
      description: description, 
      price: price, 
      image: image, 
      userEmail: selectedProduct.userEmail, 
      userId: selectedProduct.userId,
    );

    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();    
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);  
    notifyListeners();
  }

  void fetchProducts() {
    http.get('https://flutter-easy-list.firebaseio.com/products.json')
      .then((http.Response response) {
        final List<Product> fetechedProductList = [];
        final Map<String, dynamic> productListData = json.decode(response.body);

        productListData
          .forEach((String productId, dynamic productData) {
            final Product product = Product(
              id: productId,
              title: productData['title'],
              description: productData['description'],
              price: productData['price'],
              image: productData['image'],
              userEmail: productData['userEmail'],
              userId: productData['userId'],
            );

            fetechedProductList.add(product);
          });

        _products = fetechedProductList;
        notifyListeners();
    });
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = _products[selectedProductIndex].isFavorite;

    final bool newFavoriteStatus = !isCurrentlyFavorite;

    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
      isFavorite: newFavoriteStatus,
    );

    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

class UserModel extends ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser = User(id: 'hardcode1', email: email, password: password);
  }
}