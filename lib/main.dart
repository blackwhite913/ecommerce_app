import 'package:flutter/material.dart';
import 'package:plantshop/plant_shop/modules/plant.dart';
import 'package:plantshop/plant_shop/providers/plantInCart_provider.dart';
import 'package:plantshop/plant_shop/providers/plants_provider.dart';
import 'package:plantshop/screens/plantCart.dart';
import 'package:plantshop/screens/plant_detail.dart';
import 'package:plantshop/screens/review.dart';
import 'package:plantshop/screens/whislist_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MultiProvider( ///all your data management classes or aka providers must be established
      ///prior always before the materialApp for data collection and use////
       providers:[
         ChangeNotifierProvider(
             create: (ctx)=>Plants()
         ),
         ChangeNotifierProvider(
             create: (ctx)=>Plant()
         ),
         ChangeNotifierProvider(
             create: (ctx)=>PlantsInCart()
         ),
       ],
      child: MaterialApp(
        home:HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff62c050),///green we want///
          //accentColor:Color(0xffe4e9f4),/////tile backdrop color//
          accentColor: Colors.blue,
        ),
        routes: {
          PlantDetail.routeName:(ctx)=>PlantDetail(),
          HomePage.routeName:(ctx)=>HomePage(),
          WishListScreen.routeName:(ctx)=> WishListScreen(),
          ReviewBottomSheet.routeName:(ctx)=>ReviewBottomSheet(),
          CartPage.routeName:(ctx)=>CartPage(),
        },
      ),
    );
  }
}