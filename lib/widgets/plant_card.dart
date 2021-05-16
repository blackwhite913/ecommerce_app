import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/modules/plant.dart';
import 'package:plantshop/screens/plant_detail.dart';
import 'package:provider/provider.dart';



class PlantCard extends StatefulWidget {
  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  @override
  Widget build(BuildContext context) {
    var plantData=Provider.of<Plant>(context);
    final Size size=MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(PlantDetail.routeName,arguments: plantData.id);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            height: size.height*0.37,
            width: size.width*0.5,
            decoration: BoxDecoration(
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Theme.of(context).accentColor)
                      ),
                      child: Image.network(plantData.imageUrl,fit: BoxFit.fill,),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: CircleAvatar(
                        maxRadius: 15,
                        minRadius: 15,
                        backgroundColor: Theme.of(context).accentColor.withOpacity(0.5),
                        child: IconButton(
                          padding: const EdgeInsets.only(bottom: 1,right: 1),
                          onPressed: plantData.changeMen,
                          icon: Icon(
                            plantData.isFavorite?Icons.favorite:Icons.favorite_border,
                            color: Colors.pink,
                          ),
                          iconSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Indoor",style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 12, color: Color(0xFF384a65),)),),
                    Text(plantData.name,style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65),fontWeight: FontWeight.bold,fontSize: 15)),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price",style: GoogleFonts.nunito(textStyle: TextStyle( color: Color(0xFF384a65),fontSize: 12)),),
                        Text("\$${plantData.price}",style: GoogleFonts.varelaRound(textStyle: TextStyle( color: Color(0xFF384a65),fontWeight: FontWeight.bold,fontSize: 15)),)
                      ],
                    ),
                    CircleAvatar(
                      maxRadius: 15,
                      minRadius: 15,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: IconButton(
                        padding: const EdgeInsets.only(bottom: 1,right: 1),
                        onPressed: (){},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        iconSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
