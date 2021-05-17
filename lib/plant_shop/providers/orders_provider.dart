import 'package:flutter/material.dart';
import 'package:plantshop/plant_shop/modules/orders.dart';
import 'package:plantshop/plant_shop/modules/plantinCart.dart';




class PlantOrders with ChangeNotifier{
  List<Orders> transactions=[];
  int _orderNumber=0;

  void addTransaction(List<PlantInCart> cartItems,double amount){
    transactions.add(Orders(
      id: DateTime.now().toString(),
      date: DateTime.now(),
      orders: cartItems,
      totalPrice: amount,
    ));
    notifyListeners();
  }
}