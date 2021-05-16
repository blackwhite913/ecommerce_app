//import 'package:flutter/material.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';
//import 'package:velocity_x/velocity_x.dart';


//class PaymentGateway extends StatefulWidget {
//  @override
//  _PaymentGatewayState createState() => _PaymentGatewayState();
//}
//
//class _PaymentGatewayState extends State<PaymentGateway> {
//  Razorpay razorpay;
//  TextEditingController _textEditingController=TextEditingController();
//  @override
//  void initState() {
//    super.initState();
//    razorpay=new Razorpay();
//    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
//    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
//    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
//  }
////  @override
////  void dispose() {
////    // TODO: implement dispose
////    super.dispose();
////    razorpay.clear();
////  }
//
//  void openCheckout(){
//    var options={"key":"rzp_test_qeQGo6JmtBdjTT",
//      "amount":num.parse(_textEditingController.text)*100,"name":"MERMAID",
//    "description":"They are real you just dont know",
//      "profile":{
//      "contact":"",
//        "email":"",
//      },
//      "external":{
//      "wallets":["paytm"]
//      }
//    };
//    try{
//      razorpay.open(options);
//    }catch(e){
//      print(e.toString());
//    }
//  }
//  void handlerPaymentSuccess(){
//    Navigator.push(context, MaterialPageRoute(builder: (bcontext){
//      return ShopHome();
//    }));
//  }
//  void handlerErrorFailure(){
//    Navigator.push(context, MaterialPageRoute(builder: (bcontext){
//      return MyHomePage();
//    }));
//  }
//  void handlerExternalWallet(){
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal:40),
//            child: TextField(
//              controller: _textEditingController,
//              decoration: InputDecoration(
//                hintText: "Enter amount",
//              ),
//            ),
//          ),
//          SizedBox(height: 12,),
//          RaisedButton(onPressed: (){
//            openCheckout();
//          }, child: "Pay Now".text.white.make(),)
//        ],
//      ),
//    );
//  }
//}
