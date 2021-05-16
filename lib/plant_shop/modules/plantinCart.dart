import 'package:flutter/material.dart';

class PlantInCart{
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String imageUrl;
  PlantInCart({@required this.name,@required this.id,@required this.price,@required this.quantity,this.imageUrl});

}

///the plant in cart is made as different object as the list of plant is managed by universal list <plants>
///thus we have a class for a plant in a cart list,it will have ,id,name,quantity,price
///this object class will be used to create another provider class to manage the operations of the cart list