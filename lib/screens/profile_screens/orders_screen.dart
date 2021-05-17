import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/modules/plantinCart.dart';
import 'package:plantshop/plant_shop/providers/drawer_provider.dart';
import 'package:plantshop/plant_shop/providers/orders_provider.dart';
import 'package:plantshop/widgets/profile_drawer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/-orders';
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final orderObj=Provider.of<PlantOrders>(context);
    final profileProvider=Provider.of<DrawerProvide>(context);
    return Scaffold(
      backgroundColor: Color(0xfff4f7fe),
      appBar: AppBar(
        title: profileProvider.titleSetter(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xfff4f7fe),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: orderObj.transactions.length,
                  itemBuilder: (context, index) {
                    var order = orderObj.transactions[index];
                    return OrderCard(
                      cartItems: order.orders,
                      total: order.totalPrice,
                      imageUrl: order.orders[0].imageUrl,
                      quantity: order.orders.length,
                      date: order.date,
                      orderNumber: index + 1,
                    );
                  }),
            ),
          ],
        ),
      ),
      drawer: ProfileDrawer(),
    );
  }
}

class OrderCard extends StatefulWidget {
  const OrderCard({
    this.imageUrl,
    this.orderNumber,
    this.cartItems,
    this.total,
    this.quantity,
    this.date,
    Key key,
  }) : super(key: key);
  final int orderNumber;
  final String imageUrl;
  final double total;
  final int quantity;
  final List<PlantInCart> cartItems;
  final DateTime date;

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool _expanded=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: _expanded?BorderRadius.only(topLeft:Radius.circular(8),topRight:Radius.circular(8)):BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(2,2),
              ),
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         boxShadow: [
                           BoxShadow(
                             offset: Offset(2,2),
                             color: Colors.grey,
                           ),
                         ]
                       ),
                      child: CircleAvatar(backgroundImage: NetworkImage(widget.imageUrl),minRadius: 25,)),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order No ${widget.orderNumber}",style: GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65),
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),),
                      SizedBox(height: 5,),
                      Text("Items: ${widget.quantity}",style: GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65).withOpacity(0.7),
                        fontSize: 12,)),),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date: ${DateFormat("yMMMd").format(widget.date)}",style:GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),),
                  SizedBox(height: 5,),
                  Text("Status",style: GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65).withOpacity(0.7),
                      fontSize: 12,)),),
                ],
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _expanded=!_expanded;
                  });
                },
                child: Container(
                  height: 40,width: 40,
                  child: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,

                  ),
                ),
              ),
            ],
          ),
        ),
        if(_expanded) Container(
            margin: const EdgeInsets.only(top:1,left: 10,right: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(2,2),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(8),bottomRight:Radius.circular(8)),
            ),
            child: Column(
              children: [
                Container(
                  height: min(widget.cartItems.length*20.0+100,100),
                  child:ListView.builder(
                      itemCount: widget.cartItems.length,
                      itemBuilder: (context,index){
                        return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1)),
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.cartItems[index].name,style:GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),),
                                Text("${widget.cartItems[index].quantity} X ${widget.cartItems[index].price}",
                                  style: GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65).withOpacity(0.7),
                                    fontSize: 12,)),
                                )
                              ],
                            )
                        );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total: ${widget.total}",style:GoogleFonts.varelaRound(textStyle: TextStyle(color: Theme.of(context).primaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),)
                    ],
                  ),
                ),
              ],
            ),
    ),
    ]
    );
  }
}
