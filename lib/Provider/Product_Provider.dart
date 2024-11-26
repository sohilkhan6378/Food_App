import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app/Model/Product_Model.dart';

class ProductProvider with ChangeNotifier{
  List<ProductModel> herbsProductList =[];
  late ProductModel productModel;

  fetchherbsProductData() async{
   List<ProductModel> newList = [];

   QuerySnapshot Value = await FirebaseFirestore.instance.collection("HerbsProductCollection").get();

   for (var element in Value.docs) {
     productModel = ProductModel(
         ProductImage: element.get("ProductImage"),
         ProductName: element.get("ProductName"),
         ProductPrice: element.get("ProductPrice")
     );
     newList.add(productModel);

   }
   herbsProductList = newList;
   notifyListeners();
  }

   List<ProductModel> get getherbsProductDataList{
    return herbsProductList;
  }

}