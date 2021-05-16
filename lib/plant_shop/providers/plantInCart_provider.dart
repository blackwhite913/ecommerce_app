import 'package:flutter/material.dart';
import 'package:plantshop/plant_shop/modules/plantinCart.dart';




class PlantsInCart with ChangeNotifier{
  Map<String,PlantInCart> _items={};
  ///same as the plants provider,but here we making a map of all the objects instead of a list////

  int get itemCount{
    return _items.length;
    ///gets the dynamic length of the objects in the map///
  }

  Map<String,PlantInCart> get items{
    return _items;
    ///gets the dynamic value to use,same as the items getter in plants///
  }

  double get totalAmount{
    var total=0.0;
    _items.forEach((key, value) {total=value.price*value.quantity+total;
    });
    return total;
    ///the cart is a place where more then one object can exist either of the same type
    ///or of different type,hence the code runs through all the plants in the cart
    ///gets the price of them and their  quantity on how many added
    ///and adds it to the total value to be displayed////
    ///and being a getter it updates dynamically//
  }

  void removeItem(String id){
    _items.remove(id);
    notifyListeners();
    ///simply removes the item based on id,only available in maps,similar in list but with index///
  }

  void incrementQuantity(String productId){
   _items.update(productId, (value){
     return PlantInCart(name: value.name, id: value.id, price:value.price, quantity:value.quantity+1,imageUrl: value.imageUrl);
   });
   notifyListeners();
  }
  void decrementQuantity(String productId){
    print(productId);
    _items.update(productId, (value){
      return PlantInCart(name: value.name, id: value.id, price:value.price, quantity:value.quantity-1,imageUrl: value.imageUrl);
    });
    notifyListeners();
  }

  void addItem(String productId,double price,String title,String imageUrl){
    if(_items.containsKey(productId)){
      _items.update(productId, (existingValue) => PlantInCart(name: existingValue.name, id: existingValue.id, price: existingValue.price, quantity: existingValue.quantity+1,imageUrl: existingValue.imageUrl));
    }else{
      _items.putIfAbsent(productId,()=>PlantInCart(name: title,price: price,id: productId,quantity: 1,imageUrl: imageUrl));
      print(_items);
    }
    notifyListeners();
  }
  ///this is adding in the cart list,which is how to make a normal #plant# object from the #plants# list
///to a  #plantInCart# object and finally adding it to the #plantsInCart# list
/// the function takes in all plantInCart properties id,price,name(title),it does not take the quantity as that we decide
/// it checks if the carts list already contains this plant or no with the help of contains key function
/// which looks for the unique id provided by the class when a plantInCart is made,if the plantInCart already exist ,
/// it updates the plantInCart list with the same plantInCart but with quantity plus 1
/// thus giving you an exact copy of the plant with the quantity increased
/// or else if the plant object never existed in the cart or simply is not there
/// it creates a fresh plantInCart object with quantity being 1,also this uses the plantId as the object
  /// suppose plant A is being put in the cart its still the plant A in just the a new list called Cart items list(_items)
  /// so that is why the data must be passed be passed down for easier approach and better efficiency//

  void deleteItem(String productId){
    _items.removeWhere((key, value) => key==productId);
    notifyListeners();
  }

  void clearAll(){
    _items={};
    notifyListeners();
  }

}