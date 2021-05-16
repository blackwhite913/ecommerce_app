import 'package:flutter/material.dart';
import 'package:plantshop/plant_shop/modules/orders.dart';
import 'package:plantshop/plant_shop/modules/plantinCart.dart';




class PlantOrders with ChangeNotifier{
  List<Orders> transactions=[];

  void addTransaction(List<PlantInCart> cartItems,double amount){
    transactions.insert(0,Orders(
      id: DateTime.now().toString(),
      date: DateTime.now(),
      orders: cartItems,
      totalPrice: amount,
    ));
    notifyListeners();
  }

}