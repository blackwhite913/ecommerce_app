import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:plantshop/plant_shop/providers/orders_provider.dart';



class ProductBottomSheet extends StatefulWidget {
  @override
  _ProductBottomSheetState createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
      ),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          width: double.infinity,
          color:Colors.white,
          child: Form(
            child: Column(
              children: [
                ///title input
                TextFormField(
//                  initialValue: _initValues['title'],
                  decoration: InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder()
                  ),
//                  onFieldSubmitted: (_){
//                    FocusScope.of(context).requestFocus(_priceFocusNode);
//                  },
                  textInputAction: TextInputAction.next,
                  ///the text Input action allows you to change the onSubmit button your
                  ///virtual phone keyboard allowing a better UX with the form filling///
//                  onSaved: (value){
//                    _editProduct= Product(
//                      title: value,
//                      price: _editProduct.price,
//                      description:_editProduct.description,
//                      imageUrl: _editProduct.imageUrl,
//                      id: _editProduct.id,
//                      isFavorite: _editProduct.isFavorite,
//                    );
//                  },
                  validator: (value){
                    ///return null meaning the value is correct///
                    ///if you return a text it is considered to be an error text///
                    if(value.isEmpty){
                      return 'Please provide a value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                ///price input
                TextFormField(
//                  initialValue: _initValues['price'],
//                  focusNode: _priceFocusNode,
                  decoration: InputDecoration(
                      labelText: "Price",
                      border: OutlineInputBorder()
                  ),
//                  onFieldSubmitted: (_){
//                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
//                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
//                  onSaved: (value){
//                    _editProduct= Product(
//                      title: _editProduct.title,
//                      price: double.parse(value),
//                      description:_editProduct.description,
//                      imageUrl: _editProduct.imageUrl,
//                      id: _editProduct.id,
//                      isFavorite: _editProduct.isFavorite,
//                    );
//                  },
                  validator: (value){
                    if(value.isEmpty){
                      return "Please Enter a Price";
                    }
                    if(double.tryParse(value)==null){
                      ///tryparse is similar to parse but ,if there were no numbers parsed it will return null
                      return "Please Enter a valid Price";
                    }
                    if(double.parse(value)<=0){
                      return "Please Enter a price more then 0";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                ///description input
                TextFormField(
//                  initialValue: _initValues['description'],
//                  focusNode: _descriptionFocusNode,
                  decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder()
                  ),
                  maxLines: 3,
                  ///description is a multiline input as generally descriptions
                  ///are bigger ,the max lines allows you to provide breaking lines
                  ///to your textField for a better display of user Input
                  ///the recommended input keyboard for such textFields is
                  ///multiline
                  keyboardType: TextInputType.multiline,
//                  onSaved: (value){
//                    _editProduct= Product(
//                      title: _editProduct.title,
//                      price: _editProduct.price,
//                      description:value,
//                      imageUrl: _editProduct.imageUrl,
//                      id: _editProduct.id,
//                      isFavorite: _editProduct.isFavorite,
//                    );
//                  },
                  validator: (value){
                    ///return null meaning the value is correct///
                    ///if you return a text it is considered to be an error text///
                    if(value.isEmpty){
                      return 'Please provide a value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                ///Image input
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 8,right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                      ),
//                      child: _imageUrlController.text.isEmpty?Text("Enter the Url!!"):FittedBox(
//                        child: Image.network(_imageUrlController.text,fit: BoxFit.cover,),
                      ),
                    Expanded(
                      child:TextFormField(
//                        focusNode: _imageFocusNode,
//                        controller: _imageUrlController,///you cant set initial values to textField with a controller
                        decoration: InputDecoration(
                            labelText: "Image Url",
                            border: OutlineInputBorder()
                        ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
//                        onFieldSubmitted: (_){
//                          _saveForm();
//                        },
//                        onSaved: (value){
//                          _editProduct= Product(
//                            title: _editProduct.title,
//                            price: _editProduct.price,
//                            description:_editProduct.description,
//                            imageUrl: value,
//                            id: _editProduct.id,
//                            isFavorite: _editProduct.isFavorite,
//                          );
//                        },
                        validator: (value){
                          if(value.isEmpty){
                            return "Please Enter an image Url";
                          }
                          if(!value.startsWith('http') || !value.startsWith('https')){
                            return "please Enter a valid url";
                          }
                          return null;
                        },
//                       onEditingComplete: (){
//                         setState(() {
//
//                         });
//                       },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
