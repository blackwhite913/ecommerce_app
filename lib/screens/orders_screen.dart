import 'package:flutter/material.dart';
import 'package:plantshop/plant_shop/providers/orders_provider.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final orderObj=Provider.of<PlantOrders>(context);
    return Container(
      height: 500,
      width: double.infinity,
      color: Colors.purple.withOpacity(0.4),
      child: ListView.builder(
          itemCount: orderObj.transactions.length,
          itemBuilder: (context,index){
        return Container(
          color: Colors.amber,
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: ListTile(
            trailing: Text(orderObj.transactions[index].date.toString()),
            title: Text(orderObj.transactions[index].totalPrice.toString()),
          ),
        );
      }),
    );
  }
}
