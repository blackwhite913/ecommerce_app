import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/providers/plantInCart_provider.dart';
import 'package:plantshop/plant_shop/providers/plants_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class  PlantDetail extends StatelessWidget {
  static const routeName="/-plant-detail";
  @override
  Widget build(BuildContext context) {
    final plantId=ModalRoute.of(context).settings.arguments;
    final plant=Provider.of<Plants>(context).findById(plantId);
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
            ),
//            Positioned(
//              bottom: 0,
//              left: 70,
//              child: Container(
//                height: 150,
//                width: 250,
//                decoration: BoxDecoration(
////                  image: DecorationImage(
////                    image: NetworkImage("https://cdn.dribbble.com/users/1792288/screenshots/4761850/image_still.gif?compress=1&resize=400x300"),
////                    fit: BoxFit.fill
////                  )
//                ),
//              ),
//            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))
              ),
              height: 650,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon:Icon(Icons.chevron_left,size: 34,color:Color(0xFF384a65),)),
                      IconButton(icon:Icon(Icons.shopping_cart,size: 28,color:Colors.teal),),
                    ],
                  ),
                  SizedBox(height:size.height*0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(plant.name,style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65) ,
                                fontSize: 20,fontWeight: FontWeight.bold
                            ))),
                            Text("Florida USA",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65).withOpacity(0.5) ,
                                fontSize: 15,fontWeight: FontWeight.bold
                            ))),
                          ],
                        ),
                        CircleAvatar(
                          maxRadius: 27,
                          minRadius: 27,
                          backgroundColor: Theme.of(context).accentColor,
                          child: Text("\$${plant.price}",style: GoogleFonts.roboto(textStyle: TextStyle(color:Colors.teal,
                              fontSize: 15,fontWeight: FontWeight.bold
                          ))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:size.height*0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Row(
                      children: [
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        Icon(Icons.star,color:Theme.of(context).accentColor,size: 15,),
                        SizedBox(width:size.width*0.02),
                        Text("10",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Theme.of(context).primaryColor,
                            fontSize: 15,fontWeight: FontWeight.bold
                        ))),
                        SizedBox(width:size.width*0.02),
                        Text("Reviews",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Theme.of(context).primaryColor ,
                            fontSize: 15,fontWeight: FontWeight.bold
                        ))),
                      ],
                    ),
                  ),
                  SizedBox(height:size.height*0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Row(
                      children: [
                        Text("Description",style: GoogleFonts.poppins(textStyle: TextStyle(color:Color(0xFF384a65) ,
                            fontSize: 18,fontWeight: FontWeight.bold
                        ))),
                      ],
                    ),
                  ),
                  SizedBox(height:size.height*0.01),
                  Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    child: RichText(
                      text: TextSpan(
                          text: plant.description,
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF384a65).withOpacity(0.7),
                                fontWeight: FontWeight.w600,
                              )
                          )
                      ),
                    ),
                  ),
                  SizedBox(height:size.height*0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Row(
                      children: [
                        Text("Overview",style: GoogleFonts.poppins(textStyle: TextStyle(color:Color(0xFF384a65) ,
                            fontSize: 18,fontWeight: FontWeight.bold
                        ))),
                      ],
                    ),
                  ),
                  SizedBox(height:size.height*0.02),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width:size.width*0.03),
                        boxes(heading: "2 week",fontAwesomeIcons: FontAwesomeIcons.water,),
                        SizedBox(width:size.width*0.03),
                        boxes(heading: "diffused",fontAwesomeIcons: FontAwesomeIcons.sun,),
                        SizedBox(width:size.width*0.03),
                        boxes(heading: "18-20 C",fontAwesomeIcons: FontAwesomeIcons.thermometerEmpty,),
                        SizedBox(width:size.width*0.1),
                        Container(
                          height: 170,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.amberAccent,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0),
                            ],
                            image:DecorationImage(image: NetworkImage(plant.imageUrl),fit: BoxFit.fill),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height:size.height*0.04),
                  Consumer<PlantsInCart>(
                    builder: (context,data,child){
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,),
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        color: Colors.transparent,
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              GestureDetector(
                                onTap:(){
                                  data.addItem(plantId, plant.price, plant.name,plant.imageUrl);
                                  print(data.itemCount);
                                  SnackBar snackBar=SnackBar(
                                    content: Text("Item Added",style:GoogleFonts.poppins(
                                        textStyle: TextStyle(color:Colors.white ,
                                            fontSize: 15,fontWeight: FontWeight.bold))),
                                    duration: Duration(milliseconds: 1000),
                                    backgroundColor: Theme.of(context).primaryColor,
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                },
                                child: Container(
                                  width: 160,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Theme.of(context).primaryColor,
                                      border: Border.all(color:Theme.of(context).primaryColor,width: 2)
                                  ),
                                  child: Center(child:Text("ADD TO CART",style: GoogleFonts.poppins(textStyle: TextStyle(color:Colors.white ,
                                      fontSize: 15,fontWeight: FontWeight.bold
                                  ))),),
                                ),
                              ),
                              Container(
                                width: 160,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context).primaryColor,
                                    border: Border.all(color:Theme.of(context).primaryColor,width: 2)
                                ),
                                child: Center(child:Text("BUY NOW",style: GoogleFonts.poppins(textStyle: TextStyle(color:Colors.white ,
                                    fontSize: 15,fontWeight: FontWeight.bold
                                ))),),
                              ),
                            ]
                        ),
                      );
                    },
                  ),
//                  SizedBox(height: size.height*0.02,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class boxes extends StatelessWidget {
  final String heading;
  final IconData fontAwesomeIcons;
  const boxes({
    this.fontAwesomeIcons,
    this.heading,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              offset: Offset(-5.0, -5.0),
              blurRadius: 5.0,
              spreadRadius: -1.0),
          BoxShadow(
              color: Colors.grey,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
              spreadRadius: -4.0),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:6.0,horizontal: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FaIcon(fontAwesomeIcons,color: Theme.of(context).primaryColor,size: 18,),
              Text(heading,style: GoogleFonts.nunito(textStyle: TextStyle(color:Color(0xFF384a65),fontWeight: FontWeight.bold,fontSize: 12),)),
            ],
          ),
        ),
      ),
    );
  }
}
