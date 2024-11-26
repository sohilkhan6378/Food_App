import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Provider/Cart_Provider.dart';
import 'package:food_app/Widgets/searchItem.dart';
import 'package:provider/provider.dart';
import '../Model/Cart_Model.dart';
import '../Widgets/Count.dart';
import 'checkout/deliveryDetails.dart';

class ReviewCart extends StatefulWidget {
  const ReviewCart({super.key});

  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  @override
  int cartPrice = 0;

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of(context);
   //cartProvider.getReviewCartProductData();
    return Scaffold(
      bottomNavigationBar: ListTile(

        title: const Text(
         "Amount",
          style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
        ),
        // subtitle: Container(
        //   height: 25,
        //   child: Column(
        //     children: [
        //      Text("320")
        //     ],
        //   ),
        // ),
        subtitle: const Text(
          // "${cartProvider.reviewCartDataList.map((e){
          //             return cartPrice += e.CartPrice*e.CartQuantity;
          // }).toList()}",
          "₹170",
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
        trailing: Container(
          height: 40,
          width: 160,
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2)),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => deliveryDetails(),));
            },
            child: const Text(
              "Submit",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Review Cart",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("productCart")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .collection("YourCart")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.active) {
                          if (snapshot.hasData) {



                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              //width: 384,
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemBuilder: (context, index){
                                  //ReviewCartModel data = cartProvider.getreviewcartProductDataList;
                                return  Padding(
                                    padding:
                                    const EdgeInsets.only(top: 15, left: 5),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.network(
                                                snapshot.data!.docs[index]
                                                ["CartImage"],
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 100,
                                              ),
                                              const SizedBox(
                                                width: 14,
                                              ),
                                              SizedBox(
                                                width: 180,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${snapshot.data!.docs[index]["CartName"]}",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.orangeAccent,
                                                        fontWeight: FontWeight.w800,
                                                      ),
                                                    ),

                                                    Text(
                                                      "₹${snapshot.data!.docs[index]["CartPrice"]}",
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.orangeAccent,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                    // totalPrice = snapshot.data!.docs[index]["CartPrice"],


                                                    Text(
                                                      "Quantity"
                                                          "${snapshot.data!.docs[index]["CartQuantity"]}",
                                                      style: const TextStyle(
                                                        color: Colors.orangeAccent,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 63,
                                                width: 80,
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        deleteitem();
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContextcontext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    "Delete Item"),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      Navigator.of(
                                                                          context)
                                                                          .pop(); // Close the dialog
                                                                    },
                                                                    child: const Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed: () {
                                                                      // Perform delete action here

                                                                      FirebaseFirestore.instance.collection("productCart").doc(FirebaseAuth.instance.currentUser?.uid).collection("YourCart").doc(
                                                                          "${snapshot.data!.docs[index]["CartId"]}")
                                                                          .delete();

                                                                      Navigator.of(
                                                                          context)
                                                                          .pop(); // Close the dialog
                                                                      // Optionally, show a snackbar or perform other actions
                                                                      ScaffoldMessenger.of(
                                                                          context)
                                                                          .showSnackBar(
                                                                        const SnackBar(
                                                                          content: Text(
                                                                              'Item deleted successfully!'),
                                                                        ),
                                                                      );
                                                                    },
                                                                    style:
                                                                    ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                      Colors
                                                                          .red, // Set button color to red for delete
                                                                    ),
                                                                    child: const Text(
                                                                        'Delete'),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: const Column(
                                                        children: [
                                                          Icon(
                                                            Icons.delete,
                                                            color:
                                                            Colors.orangeAccent,
                                                            size: 30,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      height: 26,
                                                      width: 200,
                                                      // decoration: BoxDecoration(
                                                      //     border: Border.all(
                                                      //       color: Colors.green,
                                                      //       width: 2,
                                                      //     ),
                                                      //     borderRadius:
                                                      //         BorderRadius.circular(
                                                      //             20)),
                                                      child: Column(
                                                        children: [
                                                          Count(
                                                            productImage: '${snapshot.data!.docs[index]["CartImage"]}',
                                                            productId: '${snapshot.data!.docs[index]["CartId"]}',
                                                            productName: '${snapshot.data!.docs[index]["CartName"]}',
                                                            productPrice: snapshot.data!.docs[index]["CartPrice"],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              width: MediaQuery.of(context).size.width,
                                              color: Colors.grey.shade400,
                                              child:
                                              Text(snapshot.data!.docs.map((doc) {
                                                return "Price=>${doc["CartPrice"]}Quantity=${doc["CartQuantity"]}";  // or any other field you want to display
                                              }).join('+'),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: snapshot.data!.docs.length,
                                //itemCount: cartProvider.getreviewcartProductDataList.length,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('${snapshot.hasError}'),
                            );
                          } else {
                            return const Center(
                                child: Text("No Data Found😒😒😒😒😒"));
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                              backgroundColor: Colors.yellowAccent,
                            ),
                          );
                        }
                      })
                ],
              ),

            ],
          ),
        ),
      ),

      // ListView.builder(
      //  // itemCount: cartprovider.getReviewCartDataList.length,
      //   itemCount: 6,
      //   itemBuilder: (context,index){
      //    // CartModel data = cartprovider.getReviewCartDataList[index];
      //    // print(data);
      //     return Column(
      //       children: [
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Search_Item(
      //           isBool: true,
      //           imgUrl: "",
      //           isImage: false,
      //
      //         ),
      //
      //       ],
      //     );
      //   },
      // ),
    );
  }

  void deleteitem() {}
}
