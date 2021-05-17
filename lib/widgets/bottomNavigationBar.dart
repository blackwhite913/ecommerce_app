import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plantshop/screens/home_screen.dart';
import 'package:plantshop/screens/plantCart.dart';
import 'file:///C:/Users/feroz/Desktop/android_studio/plant_shop/lib/screens/profile_screens/profile_manager.dart';
import 'package:plantshop/screens/whislist_screen.dart';

class PlantNavigationBar extends StatefulWidget {
  final int indexNumber;
  PlantNavigationBar({this.indexNumber});
  @override
  _PlantNavigationBarState createState() => _PlantNavigationBarState();
}

class _PlantNavigationBarState extends State<PlantNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor:Colors.amber,
        backgroundColor:  Colors.transparent,
        height: 60,
        index:widget.indexNumber==null?2:widget.indexNumber,
        items: [
          Icon(Icons.settings,color:Colors.white,),
          Icon(Icons.favorite,color: Colors.white,),
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.shopping_bag,color: Colors.white,),
          Icon(Icons.account_circle,color: Colors.white,)
        ],
        onTap: (index){
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.of(context).pushNamed(WishListScreen.routeName);
              break;
            case 2:
              Navigator.of(context).pushNamed(HomePage.routeName);
              break;
            case 3:
              Navigator.of(context).pushNamed(CartPage.routeName);
              break;
            case 4:
              Navigator.of(context).pushNamed(ProfileManager.routeName);
              break;
          }
        }
    );
  }
}