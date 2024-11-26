import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/Model/Product_Model.dart';
import 'package:provider/provider.dart';

class WishlistProvider with ChangeNotifier{

  void addWishlistProduct(
      {
        required String wishlistId,
        required String wishlistImage,
        required String wishlistName,
        required int wishlistPrice,
        //required String wishlistQuantity,
      }
      ) async{await FirebaseFirestore.instance.collection("Wishlist")
      .doc(FirebaseAuth.instance.currentUser!.uid,).collection("YourWishlist").doc(wishlistId).set({
    "wishlistId": wishlistId,
    "wishlistImage": wishlistImage,
    "wishlistName": wishlistName,
    "wishlistPrice": wishlistPrice,
  //"CartQuantity": wishlistQuantity,
    "isWishlist": true,
  });
  }

//   get data
  List<ProductModel> wishList = [];
getWishlistData()async{
    List<ProductModel> newList = [];
 QuerySnapshot value = await FirebaseFirestore.instance.collection("Wishlist").doc(FirebaseAuth.instance.currentUser!.uid)
     .collection("YourWishlist").get();

 for (var element in value.docs) {
   ProductModel productmodel = ProductModel(
       ProductImage: element.get("wishlistImage"),
       ProductName: element.get("WishlistName"),
       ProductPrice: element.get("WishlistPrice")
   );
   newList.add(productmodel);
 }

 wishList = newList;
 notifyListeners();
}
List<ProductModel> get getWishlistProductData{
  return wishList;
}
}