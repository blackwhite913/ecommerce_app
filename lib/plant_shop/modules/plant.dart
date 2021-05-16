import 'package:flutter/material.dart';

class Plant extends ChangeNotifier{
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  bool  isFavorite;

  void changeMen(){
    this.isFavorite=!this.isFavorite;
    notifyListeners();
  }

  Plant({this.id,this.price,this.isFavorite=false,this.imageUrl,this.description,this.name});
}

///this is a model of our product object Plant ,each plant will be selling
///will have an id,name,description,image url,price,and option to make a wishlist(Favorites)