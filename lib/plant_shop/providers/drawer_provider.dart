import 'package:flutter/material.dart';
import 'package:plantshop/widgets/profile_drawer.dart';
import 'package:google_fonts/google_fonts.dart';



class DrawerProvide with ChangeNotifier{
  DrawerMenu drawerMenu=DrawerMenu.userProducts;

  void changeMenu(DrawerMenu menu){
    drawerMenu=menu;
    notifyListeners();
  }

  Text titleSetter(){
    if(drawerMenu==DrawerMenu.userProducts){
      return Text("Manage Your Products",style:GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65),
          fontSize: 22,
          fontWeight: FontWeight.bold)),);
    }else if(drawerMenu==DrawerMenu.orders){
      return Text("Orders",style:GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65),
          fontSize: 22,
          fontWeight: FontWeight.bold)),);
    }
    return Text("Contact",style:GoogleFonts.varelaRound(textStyle: TextStyle(color: Color(0xFF384a65),
        fontSize: 22,
        fontWeight: FontWeight.bold)),);
  }

}