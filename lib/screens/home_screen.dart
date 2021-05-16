import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/providers/plants_provider.dart';
import 'package:plantshop/widgets/bottomNavigationBar.dart';
import 'package:plantshop/widgets/plant_card.dart';
import 'package:plantshop/widgets/popular_card.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  static const routeName="/home-screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int index=2;
    var plants= Provider.of<Plants>(context).items;
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false, ///resizeToBottomInset
          backgroundColor: Color(0xfff4f7fe),
          ///bg color///
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Plant Catalog",
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
                                            hintText: "Search",
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
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.filter_alt,
                                    color: Colors.white,
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
                TabBar(isScrollable: true, controller: _tabController, tabs: [
                  Tab(
                    child: Text("All"),
                  ),
                  Tab(
                    child: Text("Indoor"),
                  ),
                  Tab(
                    child: Text("Outdoor"),
                  ),
                  Tab(
                    child: Text("Office"),
                  ),
                  Tab(
                    child: Text("Garden"),
                  ),
                ]),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: size.height * 0.4,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:plants.length,
                          itemBuilder: (context, index) {
                            return ChangeNotifierProvider.value(
                              value:plants[index],
                              child: PlantCard(
                              ),
                            );
                          }),
                      Container(
                        color: Colors.yellowAccent,
                      ),
                      Container(
                        color: Colors.pink,
                      ),
                      Container(color: Colors.green),
                      Container(
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Popular",
                          style: GoogleFonts.varelaRound(
                            textStyle: TextStyle( color: Color(0xFF384a65),
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: size.height * 0.15,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return PopularCard();
                      }),
                ),
              ],
            ),
          ),
      bottomNavigationBar: PlantNavigationBar(indexNumber: index,)
      ),
    );
  }
}