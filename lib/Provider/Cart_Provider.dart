import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Model/Cart_Model.dart';

class CartProvider with ChangeNotifier{
 void addCartProduct(
     {
   required String CartId,
   required String CartImage,
   required String CartName,
   required int CartPrice,
   required int CartQuantity,
 }
 ) async{await FirebaseFirestore.instance.collection("productCart")
       .doc(FirebaseAuth.instance.currentUser!.uid,).collection("YourCart").doc(CartId).set({
     "CartId": CartId,
     "CartImage": CartImage,
     "CartName": CartName,
     "CartPrice": CartPrice,
     "CartQuantity": CartQuantity,
      "isAdd": true,
   });
 }



 void updateCartProduct(
     {
       required String CartId,
       required String CartImage,
       required String CartName,
       required int CartPrice,
       required int CartQuantity,
     }
     ) async{
   await FirebaseFirestore.instance.collection("productCart")
     .doc(FirebaseAuth.instance.currentUser!.uid,).collection("YourCart").doc(CartId).update({
   "CartId": CartId,
   "CartImage": CartImage,
   "CartName": CartName,
   "CartPrice": CartPrice,
   "CartQuantity": CartQuantity,
   "isAdd": true,
 });
 }

// getting review cart product
  List<ReviewCartModel> reviewCartDataList = [];
 void getReviewCartProductData()async{
   List<ReviewCartModel> newList = [];
  QuerySnapshot value =  await FirebaseFirestore.instance.collection("productCart")
       .doc(FirebaseAuth.instance.currentUser!.uid).collection("YourCart").get();
  for (var element in value.docs) {
    ReviewCartModel reviewCartModel = ReviewCartModel(
      CartPrice: element.get("CartPrice"),
      CartName: element.get("CartName"),
      CartImage: element.get("CartImage"),
      CartId: element.get("CartId"),
      CartQuantity: element.get("CartQuantity"),
    );
    newList.add(reviewCartModel);
    // print(element.get("CartPrice"));

  }
   reviewCartDataList = newList;
   notifyListeners();
 }

  List<ReviewCartModel> get getreviewcartProductDataList{
   return  reviewCartDataList;
  }

  // getTotalPrice(){
  //   double total = 0.0;
  //   reviewCartDataList.forEach((element) {
  //     total += element.CartPrice * element.CartQuantity;
  //     print(total);
  //   });
  //   return total;
  // }
}