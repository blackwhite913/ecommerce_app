import 'package:flutter/material.dart';
import 'package:plantshop/widgets/profile_drawer.dart';



class DrawerProvide with ChangeNotifier{
  DrawerMenu drawerMenu=DrawerMenu.userProducts;

  void changeMenu(DrawerMenu menu){
    drawerMenu=menu;
    notifyListeners();
  }

  Text titleSetter(){
    if(drawerMenu==DrawerMenu.userProducts){
      return Text("Manage Your Products");
    }else if(drawerMenu==DrawerMenu.orders){
      return Text("Orders");
    }
    return Text("Contact");
  }

}