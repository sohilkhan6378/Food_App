import 'dart:core';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/wish_list_provider.dart';
import 'Review_cart.dart';

class ProductOverview extends StatefulWidget {
  String imgUrl;
  String imgName;
  //String wishlistQuantity;
  int wishlistPrice;
  String wishlistId;

  ProductOverview({
    super.key,
    required this.imgUrl,
    required this.imgName,
    // required this.wishlistQuantity,
    required this.wishlistPrice,
    required this.wishlistId,
  });

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  final List indexArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  bool isWishlist = false;

  gettingWishlistBool() {
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishlist").doc(widget.wishlistId).get().then((value) => {
          if(value.exists){
            if(mounted){
              isWishlist = value.get("isWishlist")
            }
          }

            }
            );
  }

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of(context);
     gettingWishlistBool();
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "Product Overview",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            // backgroundColor: Colors.orangeAccent,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          // height: 300,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.network(
                widget.imgUrl,
                height: 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              // SizedBox(
              //   height: 30,
              // ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.yellowAccent.shade400),
                alignment: Alignment.center,
                child: Text(
                  widget.imgName,
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                ),
              ),
              Container(
                height: 192.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: ListWheelScrollView(
                  itemExtent: 100,
                  children: indexArr
                      .map((value) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: ListTile(
                                title: Text(
                                  widget.imgName,
                                  style: TextStyle(
                                      color: Colors.orangeAccent, fontSize: 18),
                                ),
                                leading: Icon(
                                  Icons.account_circle,
                                  color: Colors.orangeAccent,
                                ),
                                trailing: Image.network(widget.imgUrl),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.indigo),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
          // decoration: BoxDecoration(
          //   image: DecorationImage(image: NetworkImage(),)
          // ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewCart(),));
              },
              child: Container(
                height: 60,
                width: 192,
                color: Colors.green,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shop,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Shop Now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isWishlist = !isWishlist;
                });

                if (isWishlist == true) {
                  wishlistProvider.addWishlistProduct(
                    wishlistId: widget.wishlistId,
                    wishlistImage: widget.imgUrl,
                    wishlistName: widget.imgName,
                    wishlistPrice: widget.wishlistPrice,

                  );
                }
              },
              child: Container(
                height: 60,
                width: 192,
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isWishlist == false
                          ? Icons.favorite_outline_outlined
                          : Icons.favorite,
                      color: Colors.white,
                    ),

                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Whishlist",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
