

import 'package:plantshop/plant_shop/modules/plantinCart.dart';

class Orders{
  final String id;
  final List<PlantInCart> orders;///here instead of a single name,there is whole list of PlantInCart objects,(cart items)which will be
  ///stored in this Instance of the object///
  final double totalPrice;
  final DateTime date;
  Orders({this.id,this.orders,this.totalPrice,this.date});
}