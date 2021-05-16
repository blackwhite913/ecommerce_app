import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/providers/plantInCart_provider.dart';
import 'package:provider/provider.dart';

class ReviewBottomSheet extends StatefulWidget {
  static const routeName='\-Review_Screen';

  @override
  _ReviewBottomSheetState createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final totalObj= Provider.of<PlantsInCart>(context);
    return Container(
      padding: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
      ),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          width: double.infinity,
          color:Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Total",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65) ,
              fontSize: 15,fontWeight: FontWeight.bold))),
                  Text("\$${totalObj.totalAmount}",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65) ,
                      fontSize: 15,fontWeight: FontWeight.bold),)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping Cost",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65) ,
                      fontSize: 15,fontWeight: FontWeight.bold))),
                  Text("\$10.00",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65) ,
                      fontSize: 15,fontWeight: FontWeight.bold),)),
                ],
              ),
              SizedBox(height: 20,),
              Divider(color: Theme.of(context).accentColor,thickness: 2,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65) ,
                      fontSize: 28,))),
                  Text("\$${totalObj.totalAmount+10}",style: GoogleFonts.varelaRound(textStyle: TextStyle(color:Color(0xFF384a65),
                      fontSize: 28,),)),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width:150,
                      child: Center(child: Text("Edit",style: TextStyle(color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      ),)),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: Theme.of(context).primaryColor)
                      ),
                    ),
                    Container(
                      width:150,
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text("Checkout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: Theme.of(context).primaryColor)
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewTile extends StatefulWidget {
  final String rate;
  final double width;
  final String reviewCount;

  ReviewTile({
    this.width,
    this.rate,
    this.reviewCount,
    Key key,
  }) : super(key: key);

  @override
  _ReviewTileState createState() => _ReviewTileState();
}

class _ReviewTileState extends State<ReviewTile> {

  Color barColor(){
    Color color;
    if(widget.width>200&&widget.width<=250){
      color=Colors.lightGreen;
    }else if(widget.width>100&&widget.width<=200){
      color=Colors.amber.shade300;
    }else{
      color=Colors.red;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(widget.rate,style: GoogleFonts.nunito(textStyle:TextStyle(fontSize: 18,color:Color(0xFF384a65),fontWeight: FontWeight.bold)),),
            SizedBox(width: 2,),
            Icon(Icons.star,size: 18,color:Color(0xFF384a65),),
            SizedBox(width: 2,),
            Container(
              height: 9,
              decoration: BoxDecoration(
                  color: barColor(),
                  borderRadius: BorderRadius.circular(24)
              ),
              width: widget.width,
            ),
          ],
        ),
        Row(
          children: [
            Text(widget.reviewCount,style: TextStyle(fontSize: 14,color:Color(0xFF384a65),fontWeight: FontWeight.bold),),
          ],
        )
      ],
    );
  }
}
