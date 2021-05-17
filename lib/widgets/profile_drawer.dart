import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/providers/drawer_provider.dart';
import 'package:plantshop/screens/profile_screens/orders_screen.dart';
import 'package:plantshop/screens/profile_screens/profile_manager.dart';
import 'package:plantshop/screens/profile_screens/user_products_screen.dart';
import 'package:provider/provider.dart';


enum DrawerMenu{
  userProducts,orders,contact
}

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color:Theme.of(context).accentColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      minRadius: 20,
                      backgroundColor: Colors.lightBlue,
                      maxRadius: 20,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text("Hello Ayaan!",style: GoogleFonts.varelaRound(),),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Color(0xFF384a65),width: 1))
                ),
                child: Column(
                  children: [
                    DrawerCard(title: "Manage Your Products",icon:FontAwesomeIcons.listAlt,drawerEnum: DrawerMenu.userProducts,
                    routeName: UserProductScreen.routeName,
                    ),
                    DrawerCard(title: "Orders",icon: FontAwesomeIcons.moneyBill,drawerEnum: DrawerMenu.orders,
                    routeName: OrdersScreen.routeName,
                    ),
                    DrawerCard(title: "Contact",icon: FontAwesomeIcons.phone,drawerEnum: DrawerMenu.contact,
                    routeName: ProfileManager.routeName,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}

class DrawerCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final DrawerMenu drawerEnum;
  final String routeName;
  const DrawerCard({
    this.routeName,
    this.drawerEnum,
    this.icon,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dp=Provider.of<DrawerProvide>(context);
    return InkWell(
      onTap: (){
       /* Navigator.of(context).pushNamed(routeName);*/
        dp.changeMenu(drawerEnum);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.5),width: 2)),
        ),
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 15),
          child: Row(
            children: [
              FaIcon(icon,color:Theme.of(context).primaryColor,),
              SizedBox(width: 40,),
              Text(title,style: GoogleFonts.varelaRound(textStyle: TextStyle(color: dp.drawerMenu==drawerEnum?Colors.amber:Colors.black)),),
            ],
          ),
        ),
      ),
    );
  }
}
