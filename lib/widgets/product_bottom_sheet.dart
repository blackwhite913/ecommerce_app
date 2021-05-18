import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantshop/plant_shop/modules/plant.dart';
import 'package:plantshop/plant_shop/providers/plants_provider.dart';
import 'package:provider/provider.dart';


class ProductBottomSheet extends StatefulWidget {
  @override
  _ProductBottomSheetState createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
  final _form=GlobalKey<FormState>();
  final _priceFocusNode =FocusNode();
  final _descriptionFocusNode =FocusNode();
  final _imageUrlController=TextEditingController();
  final _imageFocusNode=FocusNode();
  var _initValues={
    'title':'',
    'description':'',
    'price':'',
    'imageUrl':'',
  };
  var _addMainPlant=Plant(id: null,name: '',price: 0,description: '',imageUrl: '');


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageFocusNode.addListener(_updateImageUrl);
  }

  void _saveForm(){
    final value= _form.currentState.validate();
    if(!value){
      return;
    }
    _form.currentState.save();
    if(_addMainPlant.id!=null){
     print("hain");
    }else{
      Provider.of<Plants>(context,listen: false).addPlant(_addMainPlant);
    }
    Navigator.of(context).pop();
  }

  void _updateImageUrl(){
    if(!_imageFocusNode.hasFocus){
      setState(() {

      });
    }
  }


  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusNode.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
      ),
      height: 600,
      padding: const EdgeInsets.only(top: 60,left: 20,right: 20),
      child:  Form(
        key: _form,
        child: ListView(
          children: [
            Text("Add Product",style: GoogleFonts.varelaRound(textStyle: TextStyle(
              color:Color(0xFF384a65),
              fontSize: 24,
              fontWeight: FontWeight.bold
            )),),
            SizedBox(height: 20,),
            TextFormField(
              initialValue: _initValues['title'],
              decoration: InputDecoration(
                  labelText: "Name",
                  hoverColor: Color(0xFF384a65),
                  labelStyle: GoogleFonts.vesperLibre(textStyle: TextStyle(
                      color:Color(0xFF384a65).withOpacity(0.5),
                      fontSize: 18,
                  )),
                  contentPadding: const EdgeInsets.all(3),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF384a65)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF384a65)),
                  ),
              ),
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              textInputAction: TextInputAction.next,
              onSaved: (value){
                _addMainPlant= Plant(
                  name: value,
                  price: _addMainPlant.price,
                  description:_addMainPlant.description,
                  imageUrl: _addMainPlant.imageUrl,
                  id: _addMainPlant.id,
                  isFavorite: _addMainPlant.isFavorite,
                );
              },
              validator: (value){
                if(value.isEmpty){
                  return 'Please provide a value';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              initialValue: _initValues['price'],
              focusNode: _priceFocusNode,
              decoration: InputDecoration(
                labelText: "Price",
                hoverColor: Color(0xFF384a65),
                labelStyle: GoogleFonts.vesperLibre(textStyle: TextStyle(
                  color:Color(0xFF384a65).withOpacity(0.5),
                  fontSize: 18,
                )),
                contentPadding: const EdgeInsets.all(3),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF384a65)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF384a65)),
                ),
              ),
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onSaved: (value){
                _addMainPlant= Plant(
                  name: _addMainPlant.name,
                  price: double.parse(value),
                  description:_addMainPlant.description,
                  imageUrl: _addMainPlant.imageUrl,
                  id: _addMainPlant.id,
                  isFavorite: _addMainPlant.isFavorite,
                );
              },
              validator: (value){
                if(value.isEmpty){
                  return "Please Enter a Price";
                }
                if(double.tryParse(value)==null){
                  return "Please Enter a valid Price";
                }
                if(double.parse(value)<=0){
                  return "Please Enter a price more then 0";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              initialValue: _initValues['description'],
              focusNode: _descriptionFocusNode,
              decoration: InputDecoration(
                labelText: "Description",
                hoverColor: Color(0xFF384a65),
                labelStyle: GoogleFonts.vesperLibre(textStyle: TextStyle(
                  color:Color(0xFF384a65).withOpacity(0.5),
                  fontSize: 18,
                )),
                contentPadding: const EdgeInsets.all(3),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF384a65)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF384a65)),
                ),
              ),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              onSaved: (value){
                _addMainPlant= Plant(
                  name: _addMainPlant.name,
                  price: _addMainPlant.price,
                  description:value,
                  imageUrl: _addMainPlant.imageUrl,
                  id: _addMainPlant.id,
                  isFavorite: _addMainPlant.isFavorite,
                );
              },
              validator: (value){
                if(value.isEmpty){
                  return 'Please provide a value';
                }
                if(value.length>=300){
                  return "The description is too large";
                }
                if(value.length<=10){
                  return "The description is too small";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 8,right: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                     borderRadius: BorderRadius.all(Radius.circular(8)),
                     boxShadow: [
                       BoxShadow(
                         offset: Offset(-1,3),
                         color: Colors.grey.withOpacity(0.5)
                       )
                     ]
                  ),
                  child: _imageUrlController.text.isEmpty?
                    Center(
                      child: Text("Enter the url",style: GoogleFonts.varelaRound(
                        textStyle: TextStyle(color:Color(0xFF384a65),fontSize: 13,fontWeight: FontWeight.bold),)),
                    )
                      :FittedBox(
                    child: Image.network(_imageUrlController.text,fit: BoxFit.cover,),
                  ),
                ),
                Expanded(
                  child:TextFormField(
                    focusNode: _imageFocusNode,
                    controller: _imageUrlController,
                    decoration: InputDecoration(
                      labelText: "Image Link",
                      hoverColor: Color(0xFF384a65),
                      labelStyle: GoogleFonts.vesperLibre(textStyle: TextStyle(
                        color:Color(0xFF384a65).withOpacity(0.5),
                        fontSize: 18,
                      )),
                      contentPadding: const EdgeInsets.all(3),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF384a65)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF384a65)),
                      ),
                    ),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    onSaved: (value){
                      _addMainPlant= Plant(
                        name: _addMainPlant.name,
                        price: _addMainPlant.price,
                        description:_addMainPlant.description,
                        imageUrl: value,
                        id: _addMainPlant.id,
                        isFavorite: _addMainPlant.isFavorite,
                      );
                    },
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
                ),

              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  height: 50,
                    onPressed: (){
                      _saveForm();
                    },
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:60.0),
                      child: Text("Submit",style: TextStyle(color: Colors.white),),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
