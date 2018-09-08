import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image; 
  final userEmail;
  final userId;
  final bool isFavorite;
 
  Product({
    @required this.id,
    @required this.title, 
    @required this.description, 
    @required this.price, 
    @required this.image,
    @required this.userEmail,
    @required this.userId,
    this.isFavorite = false
  });
}
