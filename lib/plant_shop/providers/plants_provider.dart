import 'package:flutter/material.dart';
import 'package:plantshop/plant_shop/modules/plant.dart';


class Plants with ChangeNotifier{    ///this is a provider class used to store and update data ///
  List<Plant> _items=plants;  ///this provider is to manage and store operations and data of the list of object plant///

  List<Plant> get items{  ///this is a getter for real time update ,could use a function with return type
    return _items;         ///List<Plant> with notifyListeners would work the same///
  }

  List<Plant> get favoriteItems{
    return _items.where((element) => element.isFavorite==true).toList();
  }  ///it runs through your List of plants and where the condition isFavorite is true satisfy it takes that plant
  ///and adds it to your favorite Items list///

  Plant findById(String id){
    return _items.firstWhere((element) => element.id==id);
  }///now this is a very useful trick for data segregation ,if there is a single object of a whole list
  ///passed into a new widget ,instead of passing through constructor ,one can pass the id of the plant simply by namedPush
  ///in the other widget and  by traversing through the whole list with the particular id it finds the element
  ///and gets it,thus we have all the properties of the object with just its id///

  void addPlant(Plant plant){
    final newPlant=Plant(
      id: DateTime.now().toString(),
      imageUrl: plant.imageUrl,
      name: plant.name,
      description: plant.description,
      price: plant.price,
    );
    _items.add(newPlant);
    notifyListeners();
  }///a simple code to add more plant object to our existing list///
}

List<Plant> plants=[
  Plant(
      description:
          "Known for its waxy, heart-shaped flowers with a prominent stamen in the center.",
      name: "Anthurium",
      id: "p1",
      price: 30,
      imageUrl:
          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pink-anthurium-flower-royalty-free-image-898519468-1553277047.jpg?crop=1xw:0.99953xh;center,top&resize=980:*",
  ),
  Plant(
    description:
    "Like the aloe and the kalanchoe plants, begonias need their soil to dry out completely between waterings.",
    name: "Begonia",
    id: "p2",
    price: 15,
    imageUrl:
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/rex-cultorum-type-of-begonia-with-large-high-res-stock-photography-55857155-1553275756.jpg?crop=0.672xw:1.00xh;0.218xw,0&resize=980:*",
  ),
  Plant(
    description:
    "Let this plant grow in a bright, sunny spot and it will definitely prosper, but it can handle lower light levels",
    name: "Bird of Paradise",
    id: "p3",
    price: 65,
    imageUrl:
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bright-living-room-with-a-large-house-plant-copy-royalty-free-image-1580854667.jpg?crop=0.479xw:0.998xh;0.0241xw,0&resize=980:*",
  ),
  Plant(
    description:
    "Yucca plants do best in bright, indirect light—too direct, and their leaves might burn—and will still grow in low light",
    name: "Yucca Cane Plant",
    id: "p4",
    price: 23,
    imageUrl:
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/yucca-cane-plant-in-a-pot-on-a-white-background-royalty-free-image-1580856558.jpg?crop=0.91771xw:1xh;center,top&resize=980:*",
  ),
];