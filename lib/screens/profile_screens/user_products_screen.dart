import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:plantshop/plant_shop/providers/drawer_provider.dart';
import 'package:plantshop/widgets/product_bottom_sheet.dart';
import 'package:plantshop/widgets/profile_drawer.dart';
import 'package:provider/provider.dart';


class UserProductScreen extends StatefulWidget {
  static const routeName = '/-UserProducts';

  @override
  _UserProductScreenState createState() => _UserProductScreenState();
}

class _UserProductScreenState extends State<UserProductScreen> {
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
        body: Container(
          child: Column(
            children: [

            ],
          ),
        ),
        drawer: ProfileDrawer(),
            floatingActionButton:Padding(
          padding: const EdgeInsets.only(bottom:20.0),
          child: Builder(
            builder:(context)=> FloatingActionButton(
              onPressed: (){
              showBottomSheet(
                elevation: 5,
                backgroundColor: Colors.white,
                ///rounding must be specified over here
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(64))
                  ),
                  context: context, builder:(bContext){
                return ProductBottomSheet();
              });
              },
              child: Icon(Icons.add,color: Colors.white,size: 30,),
              backgroundColor: Theme.of(context).primaryColor,
              ),
          ),
        ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
