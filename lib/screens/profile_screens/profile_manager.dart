import 'package:flutter/material.dart';
import 'package:plantshop/plant_shop/providers/drawer_provider.dart';
import 'package:plantshop/screens/profile_screens/orders_screen.dart';
import 'package:plantshop/screens/profile_screens/user_products_screen.dart';
import 'package:plantshop/widgets/profile_drawer.dart';
import 'package:provider/provider.dart';



class ProfileManager extends StatefulWidget {
  static const routeName = '/-ProfileManager';
  @override
  _ProfileManagerState createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  @override
  Widget build(BuildContext context) {
    final profileProvider=Provider.of<DrawerProvide>(context).drawerMenu;
    if(profileProvider==DrawerMenu.userProducts){
      return UserProductScreen();
    }else if(profileProvider==DrawerMenu.orders){
      return OrdersScreen();
    }
    return Container(color: Colors.purple,);
  }
}





