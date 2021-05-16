import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/modules/plant.dart';
import 'package:plantshop/plant_shop/providers/plants_provider.dart';
import 'package:plantshop/widgets/bottomNavigationBar.dart';
import 'package:plantshop/widgets/wishlist_plant_card.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class WishListScreen extends StatefulWidget {
  static const routeName="/wishList-screen";
  @override
  _WishListScreenState createState() => _WishListScreenState();
}


class _WishListScreenState extends State<WishListScreen> {
  int index=1;
  void rebuild(){
  setState(() {
    print("im running again");
  });
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushReplacementNamed(context, HomePage.routeName);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff4f7fe),
        body:  Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Favorites",
                          style: GoogleFonts.varelaRound(
                              textStyle: TextStyle(
                                  color: Color(0xFF384a65),
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              width: size.width * 0.7,
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Add to Favorites",
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.pink.shade400,
                                ),
                              ),
                              height: 50,
                              width: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Consumer<Plants>(
                builder: (context,data,child){
                  return Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: data.favoriteItems.length,
                        itemBuilder: (context, index) {
                          return ChangeNotifierProvider.value(
                            value: data.favoriteItems[index],
                            child: WishListPlantCard(setMe: rebuild,),
                          );
                        }),

                  );
                },
              ),
            ],
          ),
        ),
//        bottomNavigationBar: PlantNavigationBar(indexNumber: index,)
      ),
    );
  }
}
