import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Provider/Cart_Provider.dart';
import 'package:food_app/Widgets/searchItem.dart';
import 'package:provider/provider.dart';

import '../Model/Cart_Model.dart';
import '../Provider/wish_list_provider.dart';

class WishlistProduct extends StatelessWidget {
  const WishlistProduct({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistprovider = Provider.of(context);
    wishlistprovider.getWishlistData;
    // TODO: implement build
    return Scaffold(
      // bottomNavigationBar: ListTile(
      //   title: Text(
      //     "Total Amount",
      //     style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
      //   ),
      //   subtitle: Text(
      //     "₹170",
      //     style: TextStyle(color: Colors.green, fontSize: 16),
      //   ),
      //   trailing: Container(
      //     height: 40,
      //     width: 160,
      //     decoration: BoxDecoration(
      //         color: Colors.orangeAccent,
      //         borderRadius: BorderRadius.circular(20),
      //         border: Border.all(color: Colors.black, width: 2)),
      //     child: MaterialButton(
      //       onPressed: () {},
      //       child: Text(
      //         "Submit",
      //         style: TextStyle(fontSize: 18),
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        title: const Text(
          "Wishlist Product",
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
                          .collection("Wishlist")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .collection("YourWishlist")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              //width: 384,
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemBuilder: (context, index) => Padding(
                                  padding:
                                  const EdgeInsets.only(top: 15, left: 5),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Image.network(
                                          snapshot.data!.docs[index]
                                          ["wishlistImage"],
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
                                                "${snapshot.data!.docs[index]["wishlistName"]}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.orangeAccent,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              // Text(
                                              //   "${snapshot.data!.docs[index]["wishlistId"]}",
                                              //   style: const TextStyle(
                                              //     fontSize: 14,
                                              //     color: Colors.orangeAccent,
                                              //     fontWeight: FontWeight.w800,
                                              //   ),
                                              // ),
                                              Text(
                                                "₹${snapshot.data!.docs[index]["wishlistPrice"]}",
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.orangeAccent,
                                                  fontWeight: FontWeight.w700,
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
                                                  showDialog(context: context, builder: (BuildContextcontext) {
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
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                "Wishlist")
                                                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                                                .collection(
                                                                "YourWishlist").doc("${snapshot.data!.docs[index]["wishlistId"]}")
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
                                                  }
                                                  );
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
                                              // SizedBox(
                                              //   height: 5,
                                              // ),
                                              // Container(
                                              //   alignment: Alignment.center,
                                              //   height: 26,
                                              //   width: 150,
                                              //   decoration: BoxDecoration(
                                              //       border: Border.all(
                                              //         color: Colors.green,
                                              //         width: 2,
                                              //       ),
                                              //       borderRadius:
                                              //       BorderRadius.circular(
                                              //           20)),
                                              //   child: Container(
                                              //     alignment: Alignment.center,
                                              //     width: 100,
                                              //     child: Row(
                                              //       mainAxisAlignment:
                                              //       MainAxisAlignment
                                              //           .center,
                                              //       children: [
                                              //         Icon(
                                              //           Icons.add,
                                              //           size: 20,
                                              //           color: Colors.green,
                                              //         ),
                                              //         Text(
                                              //           "ADD",
                                              //           style: TextStyle(
                                              //               fontSize: 14,
                                              //               color:
                                              //               Colors.green),
                                              //         )
                                              //       ],
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: snapshot.data!.docs.length,
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
              )
            ],
          ),
        ),
      ),


    );
  }


}
