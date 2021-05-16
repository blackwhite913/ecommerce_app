import 'package:flutter/material.dart';
import 'package:plantshop/plant_shop/providers/drawer_provider.dart';
import 'package:plantshop/widgets/profile_drawer.dart';
import 'package:provider/provider.dart';

import 'orders_screen.dart';


class ProfileManager extends StatefulWidget {
  static const routeName = '/-ProfileManager';
  @override
  _ProfileManagerState createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  @override
  Widget build(BuildContext context) {
    final profileProvider=Provider.of<DrawerProvide>(context);
    return Scaffold(
      backgroundColor: Color(0xfff4f7fe),
      appBar: AppBar(
        title: profileProvider.titleSetter(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<DrawerProvide>(
        builder: (context,data,child){
          if(data.drawerMenu==DrawerMenu.userProducts){
            return Container(
              color: Colors.yellow,
            );
          }else if(data.drawerMenu==DrawerMenu.orders){
            return OrdersScreen();
          }
          return Container(
            color: Colors.purple,
          );
        },
      ),
      drawer: ProfileDrawer()
    );
  }
}
