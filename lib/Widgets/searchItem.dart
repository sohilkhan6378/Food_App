import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/Review_cart.dart';

class Search_Item extends StatelessWidget {
  bool isBool = false;
  String imgUrl;
  bool isImage = false;

  Search_Item({super.key, 
    required this.isBool,
    required this.imgUrl,
    required this.isImage,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: isImage == true?
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  // imgUrl,
                  fit: BoxFit.cover,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-I0SfVVskBpAoFfyw L71z9QaPIJ67NNK-OJSWKhxrPSBrklGQZxIEfLY7518usZHWvdo&usqp=CAU"),
              ): const Text(""),
            ),
            Expanded(child: isImage == true?
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Product Name",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  const Text(
                    "50\$/50 Gram",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                   // width: 10,
                    height: 35,
                    decoration: isBool == false
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.green, width: 1))
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "50 Gram",
                          style: TextStyle(color: Colors.green,fontSize: 18                                         ),
                        ),
                        isBool == false
                            ? const Icon(
                                Icons.arrow_drop_down,
                                size:30,
                                color: Colors.green,
                              )
                            : const Text(""),
                      ],
                    ),
                  )
                ],
              ),
            ): const Text("")),
            Expanded(
                child: isBool == false && isImage == true
                    ? Container(

                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            //width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.green,
                            ),
                            Text(
                              "ADD",
                              style: TextStyle(fontSize: 18, color: Colors.green),
                            )
                          ],
                        ),
                      )
                    :
                SizedBox(
                        height: 63,
                        width: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete,
                              color: Colors.orangeAccent,
                              size: 30,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(

                              alignment: Alignment.center,
                              height: 26,
                              width: 180,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "ADD",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.green),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
            )

          ],
        ),
      ),
    );
  }


}
