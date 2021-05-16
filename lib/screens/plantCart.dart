import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/providers/plantInCart_provider.dart';
import 'package:plantshop/screens/home_screen.dart';
import 'package:plantshop/screens/review.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/-CartPage';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProduct = Provider.of<PlantsInCart>(context);
    return WillPopScope(
      onWillPop: () async{
        Navigator.pushReplacementNamed(context, HomePage.routeName);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xfff4f7fe),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only( top: 30),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(
                      Icons.chevron_left,
                      size: 34,
                      color: Color(0xFF384a65),),
                      onPressed: (){},
                    ),
                    GestureDetector(
                      onTap: (){
                        showFlexibleBottomSheet(
                            minHeight: 0,
                            initHeight: 0.3,
                            maxHeight: 1,
                            context: context,
                            builder: (
                                BuildContext context,
                                ScrollController scrollController,
                                double bottomSheetOffset,
                                ) {
                              return ReviewBottomSheet();
                            });
                      },
                      child: Row(
                        children: [
                          Text("My Cart",
                              style: GoogleFonts.varelaRound(
                                  textStyle: TextStyle(
                                      color: Color(0xFF384a65),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              maxRadius: 18,
                              child: IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.shoppingCart,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
           cartProduct.items.length==0? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 150),
                      child: Column(
                        children: [
                          Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://cdn.dribbble.com/users/1578200/screenshots/10786591/toilet-paper-tree-drib_4x.gif?compress=1&resize=400x300")
                                  ),
                                  color: Colors.orange, shape: BoxShape.circle)),
                          SizedBox(height: 20,),
                          Text("You Have No Items In The Cart !",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65),
                              fontSize: 18,fontWeight: FontWeight.bold
                          )))
                        ],
                      ),
                    ),
                  ):Expanded(
              child:ListView.builder(
                  itemCount: cartProduct.items.length,
                  itemBuilder: (context, index) {
                    final cartObject = cartProduct.items.values.toList()[index];
                    ///we access only the list of pure CartItems object not their keys///
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric( horizontal: 30),
                          height: 120,
                          color: Colors.transparent,
                        ),
                        Container(
                          height: 120,
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-5.0, -5.0),
                                  blurRadius: 5.0,
                                  spreadRadius: -4.0),
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0),
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration:BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                  color: Theme.of(context).primaryColor,
                                ),
                                height: 40,
                              ),
                              Positioned(
                                left: 120,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 220,
                                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(cartObject.name,style: GoogleFonts.nunito(textStyle: TextStyle(color:Colors.white,
                                              fontSize: 18,fontWeight: FontWeight.bold
                                          ))),
                                          CircleAvatar(
                                            maxRadius: 15,
                                            minRadius: 15,
                                            backgroundColor:Theme.of(context).accentColor,
                                            child: IconButton(
                                              padding: const EdgeInsets.only(bottom: 1,right: 1),
                                              onPressed: (){
                                                cartProduct.deleteItem(cartObject.id);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.brown,
                                              ),
                                              iconSize: 15,
                                            ),
                                          ),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      ),
                                    ),
                                    Container(
                                      width: 220,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cartProduct.incrementQuantity(cartObject.id);
                                            },
                                            child: Container(
                                              height: 30,width:30,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white,
                                                    spreadRadius: -2,
                                                    offset: Offset(-2, -2),
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    spreadRadius: -0.5,
                                                    offset: Offset(2, 2),
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    image: NetworkImage("https://img.freepik.com/free-photo/old-grunge-dark-textured-wooden-background-surface-old-brown-wood-texture_7182-333.jpg?size=626&ext=jpg"),
                                                    fit: BoxFit.cover
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(child: Text("+",style: TextStyle(fontSize: 15,color:Colors.yellow,fontWeight: FontWeight.bold ),)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Text(cartObject.quantity.toString(),style: TextStyle(
                                            color:Color(0xFF384a65),
                                            fontSize: 18, fontWeight: FontWeight.bold,),),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              cartProduct.decrementQuantity(cartObject.id);
                                            },
                                            child: Container(
                                                height: 30,width:30,
                                                decoration: BoxDecoration(
                                                    color: Colors.brown,
                                                    image: DecorationImage(
                                                      image: NetworkImage("https://img.freepik.com/free-photo/old-grunge-dark-textured-wooden-background-surface-old-brown-wood-texture_7182-333.jpg?size=626&ext=jpg"),
                                                      fit: BoxFit.cover
                                                    ),
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white,
                                                        spreadRadius: -2,
                                                        offset: Offset(-2,-2),
                                                      ),
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        spreadRadius: -0.5,
                                                        offset: Offset(2,2),
                                                      ),
                                                    ]
                                                ),
                                                child:Center(
                                                  child: FaIcon(FontAwesomeIcons.minus,size: 12,color:Colors.yellow,),
                                                )
                                            ),
                                          ),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 30,),
                                                Column(
                                                  children: [
                                                    Text("Price",style: GoogleFonts.poppins(textStyle: TextStyle(color:Color(0xFF2a5b20) ,
                                                        fontSize: 16,
                                                    ))),
                                                    Text("\$${cartObject.price}",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65) ,
                                                        fontSize: 12,fontWeight: FontWeight.bold
                                                    ))),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left:40,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: -2,
                                          offset: Offset(-2, -2),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: -1,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                      image: DecorationImage(
                                    image:
                                    NetworkImage(cartObject.imageUrl),
                                    fit: BoxFit.cover)),
                            height: 100,
                            width: 90,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


