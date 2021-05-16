import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/modules/plant.dart';
import 'package:plantshop/plant_shop/providers/plants_provider.dart';
import 'package:provider/provider.dart';


class WishListPlantCard extends StatefulWidget {
  final Function setMe;
  WishListPlantCard({this.setMe});
  @override
  _WishListPlantCardState createState() => _WishListPlantCardState();
}

class _WishListPlantCardState extends State<WishListPlantCard> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    var favoriteData=Provider.of<Plant>(context,listen: false);
    return Container(
      height: size.height*0.22,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 40),
      child:Stack(
        children: [
        Container(
         height: size.height*0.18,
         margin: const EdgeInsets.only(top: 40),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
             boxShadow: [
               BoxShadow(
                   color: Colors.transparent,
                   offset: Offset(-5.0, -5.0),
                   blurRadius: 5.0,
                   spreadRadius: -4.0),
               BoxShadow(
                   color: Colors.grey,
                   offset: Offset(5.0, 5.0),
                   blurRadius: 5.0,
                   spreadRadius: 1.0),
             ],
          color: Colors.white
         ),
        ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              height: 170,width: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                      color: Colors.transparent,
                      offset: Offset(-3.0, -3.0),
                      blurRadius: 5.0,
                      spreadRadius: -2.0),
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0),
                ],
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(favoriteData.imageUrl,
                fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    favoriteData.name,
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF384a65),
                    )),
                  ),
                Text("Florida USA",style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 13, color: Color(0xFF384a65).withOpacity(0.5),)),),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star,size: 12,color:Colors.amber ,),
                        Icon(Icons.star,size: 12,color:Colors.amber ,),
                        Icon(Icons.star,size: 12,color:Colors.amber ,),
                        Icon(Icons.star,size: 12,color:Colors.amber ,),
                        Icon(Icons.star,size: 12,color:Color(0xFF384a65),),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Text("4.5",style: TextStyle(fontSize:12,color:Color(0xFF384a65) ),)
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price",style: GoogleFonts.nunito(textStyle: TextStyle( color: Color(0xFF384a65),fontSize: 12)),),
                        Text("\$${favoriteData.price}",style: GoogleFonts.varelaRound(textStyle: TextStyle( color: Color(0xFF384a65),fontWeight: FontWeight.bold,fontSize: 15)),)
                      ],
                    ),
                    SizedBox(width: 20,),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      onPressed: (){},
                      child:Text("Visit",style:GoogleFonts.nunito(
                        textStyle:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      )),

                    ),
                  ],
                )
              ],
            )
          ),
          Positioned(
            right: 10,
            top: 5,
            child:CircleAvatar(
            maxRadius: 15,
            minRadius: 15,
            backgroundColor: Theme.of(context).accentColor,
            child: IconButton(
              padding: const EdgeInsets.only(bottom: 1,right: 1),
              onPressed: (){
                favoriteData.changeMen();
                widget.setMe();
              },
              icon: Icon(
                Icons.delete,
                color: Colors.deepOrange,
              ),
              iconSize: 15,
            ),
          ),)
        ],
      ),
    );
  }
}

