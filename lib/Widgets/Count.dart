import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../Provider/Cart_Provider.dart';

class Count extends StatefulWidget {
  String productId;
  String productImage;
  String productName;
  int productPrice;
  Count({super.key, 
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  bool isTrue = false;
  var HerbCount = 1;

  getAddandQuantity() {
    FirebaseFirestore.instance
        .collection("productCart")
        .doc(
          FirebaseAuth.instance.currentUser!.uid,
        )
        .collection("YourCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        HerbCount = value.get("CartQuantity");
                        isTrue = value.get("isAdd");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddandQuantity();
    // print(widget.productImage);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(3),
      height: 30,
      width: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.black38,
          )),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (HerbCount > 1) {
                      setState(() {
                        HerbCount--;
                      });
                    }
                    if (HerbCount == 1) {
                      setState(() {
                        isTrue = false;
                        Fluttertoast.showToast(msg: "You Reached Mini Limit");
                        //HerbCount = HerbCount-1;
                      });

                    }else{
                      setState(() {
                        HerbCount--;
                      });
                    }


                    cartProvider.updateCartProduct(
                      CartId: widget.productId,
                      CartImage: widget.productImage,
                      CartName: widget.productName,
                      CartPrice: widget.productPrice,
                      CartQuantity: HerbCount,
                    );

                  },
                  child: const Icon(
                    Icons.remove,
                    size: 16,
                    color: Colors.orangeAccent,
                  ),
                ),
                Text(
                  "$HerbCount",
                  style: const TextStyle(fontSize: 14, color: Colors.orangeAccent),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      HerbCount = HerbCount + 1;
                    });
                    cartProvider.updateCartProduct(
                      CartId: widget.productId,
                      CartImage: widget.productImage,
                      CartName: widget.productName,
                      CartPrice: widget.productPrice,
                      CartQuantity: HerbCount,
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.orangeAccent,
                  ),
                )
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  cartProvider.addCartProduct(
                    CartId: widget.productId,
                    CartImage: widget.productImage,
                    CartName: widget.productName,
                    CartPrice: widget.productPrice,
                    CartQuantity: HerbCount,
                  );
                },
                child: const Text("ADD"),
              ),
            ),
    ));
  }
}
