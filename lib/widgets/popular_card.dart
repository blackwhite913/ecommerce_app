import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
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
        padding: const EdgeInsets.only(top: 12,right: 12,bottom: 12),
        height: size.height*0.1,
        width: size.width*0.6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("https://www.ugaoo.com/media/wysiwyg/aglaonemared_dyk.jpg",fit: BoxFit.fill,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Indoor",style: GoogleFonts.nunito(textStyle: TextStyle( color: Color(0xFF384a65),fontSize: 12)),),
                    Text("Red Aglonema",style: GoogleFonts.varelaRound(textStyle: TextStyle( color: Color(0xFF384a65),fontWeight: FontWeight.bold,fontSize: 15)))
                  ],
                ),
               Text("\$75.00",style: GoogleFonts.varelaRound(textStyle: TextStyle( color: Color(0xFF384a65),fontWeight: FontWeight.bold,fontSize: 12))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
