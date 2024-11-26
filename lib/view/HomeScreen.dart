import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/Provider/Product_Provider.dart';
import 'package:food_app/Widgets/Count.dart';

import 'package:food_app/view/Drawer_Side.dart';
import 'package:food_app/view/Search_Screen.dart';
import 'package:food_app/view/fruitsAllview.dart';
import 'package:food_app/view/my_profile.dart';
import 'package:food_app/view/product_view.dart';
import 'package:provider/provider.dart';
import '../Widgets/searchItem.dart';
import 'Drawer_Side.dart';
import 'Review_cart.dart';
import 'dryFruitsViewAll.dart';
import 'herbsProductAllview.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late ProductProvider productProvider;
  var HerbsProductUnit;
  var FruitsProductUnit;
  var DryFruitsProductUnit;



  @override
  void initState() {
   // print(imgUrl.toString());
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchherbsProductData();
    super.initState();

  }

  // Widget Drawer_icon({IconData? icon, String title = " "}) {
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    // productprovider.fetchherbsProductData();

    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      drawer: Drawer_side(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.green, fontSize: 18),
        ),
        actions: [
          CircleAvatar(
              radius: 13,
              backgroundColor: Colors.grey.shade400,
              child: InkWell(
                onTap:() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
      },
                  child: const Icon(Icons.search, size: 18, color: Colors.green,))
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewCart(),));
              },
              child: CircleAvatar(
                radius: 13,
                backgroundColor: Colors.grey.shade400,
                child: const Icon(
                  Icons.shopping_cart,
                  size: 18,
                  color: Colors.green,
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1489450278009-822e9be04dff?w=500&auto=format&fit=crop&q="
                              "60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGFsbCUyMHR5cGUlMjB2ZWdldGFibGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D")),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 110,
                        decoration: const BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        alignment: Alignment.center,
                        child: Text(
                          "Vegi",
                          style: TextStyle(
                              color: Colors.greenAccent.shade200,
                              fontSize: 18,
                              shadows: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.orangeAccent,
                                    offset: Offset(5, 5))
                              ]),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          "30% Off",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent),
                        ),
                      ),
                      SizedBox(
                          width: 110,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "On All Product Cagetable",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Herbs Seasoning",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.orangeAccent),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Herbsproductallview(),));
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //herbs product collection
              SizedBox(
                height: 260,
                width: MediaQuery.of(context).size.width,
                child:
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("HerbsProductCollection")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          return ListView.builder(itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              // height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: InkWell(
                                onTap: () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductOverview(

                                          imgUrl: "${snapshot.data!.docs[index]["ProductImage"]}",
                                          imgName: "${snapshot.data!.docs[index]["ProductName"]}",
                                         // wishlistQuantity: "${snapshot.data!.docs[index]["ProductQuantity"]}",
                                          wishlistPrice: snapshot.data!.docs[index]["ProductPrice"],
                                          wishlistId: "${snapshot.data!.docs[index]["ProductId"]}",



                                        ),

                                      )

                                  );

                                },

                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            topLeft: Radius.circular(12)),
                                        child: Image.network("${snapshot.data!.docs[index]["ProductImage"]}"??"https://images.unsplash.com/photo-1489450278009-822e9be04dff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGFsbCUyMHR5cGUlMjB2ZWdldGFibGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D",
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: 148,
                                        )
                                    ),


                                    const SizedBox(
                                      height: 10,

                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 3.0),
                                      child:
                                      Text(
                                        "${snapshot.data!.docs[index]["ProductName"]}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.orangeAccent),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 3.0),
                                      child: Text(
                                        "₹${snapshot.data!.docs[index]["ProductPrice"]}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.greenAccent),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: SizedBox(
                                        width: 140,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(3),
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Colors.black38,
                                                      )),
                                                  child:
                                                  InkWell(
                                                    onTap: (){
                                                      showModalBottomSheet(context: context, builder: (context){
                                                        return Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children:[
                                                            ListTile(
                                                                title: Text("${snapshot.data!.docs[index]["ProductUnit"][0]}"),
                                                                onTap: (){
                                                                  setState(() {
                                                                    HerbsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][0]}";
                                                                  });
                                                                }

                                                            ),
                                                            ListTile(
                                                              title: Text("${snapshot.data!.docs[index]["ProductUnit"][1]}"),
                                                              onTap: (){
                                                                HerbsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][1]}";
                                                                setState(() {

                                                                });
                                                              }
                                                              ,
                                                            ),
                                                            ListTile(
                                                                title:Text("${snapshot.data!.docs[index]["ProductUnit"][2]}"),
                                                                onTap: (){
                                                                  setState(() {
                                                                    HerbsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][2]}";
                                                                  });
                                                                }

                                                            ),
                                                            ListTile(
                                                                title: Text("${snapshot.data!.docs[index]["ProductUnit"][3]}"),
                                                                onTap: (){
                                                                  HerbsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][3]}";
                                                                }

                                                            ),

                                                            // ListTile(
                                                            //
                                                            //     title: Text("${snapshot.data!.docs[index]["ProductUnit"][4]}"),
                                                            //     onTap: () {}
                                                            //
                                                            // ),

                                                          ],
                                                        );

                                                      }
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(      HerbsProductUnit??"50Gram",
                                                          style: const TextStyle(
                                                              fontSize: 11),
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .arrow_drop_down_circle_outlined,
                                                          size: 13,
                                                          color:
                                                          Colors.orangeAccent,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            // Expanded(
                                            //     child: Container(
                                            //       padding: EdgeInsets.all(3),
                                            //       height: 30,
                                            //       width: 50,
                                            //       decoration: BoxDecoration(
                                            //           borderRadius:
                                            //           BorderRadius.circular(
                                            //               12),
                                            //           color: Colors.white,
                                            //           border: Border.all(
                                            //             width: 1,
                                            //             color: Colors.black38,
                                            //           )),
                                            //       child: Row(
                                            //         mainAxisAlignment:
                                            //         MainAxisAlignment
                                            //             .spaceBetween,
                                            //         children: [
                                            //           InkWell( onTap: (){
                                            //             setState(() {
                                            //               HerbCount = HerbCount-1;
                                            //             });
                                            //           },
                                            //             child: Icon(
                                            //               Icons.remove,
                                            //               size: 18,
                                            //               color:
                                            //               Colors.orangeAccent,
                                            //             ),
                                            //           ),
                                            //           Text("${HerbCount}", style: TextStyle(fontSize: 16, color: Colors.orangeAccent),
                                            //           ),
                                            //           InkWell(
                                            //             onTap: (){
                                            //               setState(() {
                                            //                 HerbCount =HerbCount+1;
                                            //               });
                                            //             },
                                            //             child: Icon(
                                            //               Icons.add,
                                            //               size: 18,
                                            //               color:
                                            //               Colors.orangeAccent,
                                            //             ),
                                            //           )
                                            //         ],
                                            //       ),
                                            //     ))
                                            Count(
                                              productImage: '${snapshot.data!.docs[index]["ProductImage"]}',
                                              productId: '${snapshot.data!.docs[index]["ProductId"]}',
                                              productName: '${snapshot.data!.docs[index]["ProductName"]}',
                                              productPrice: snapshot.data!.docs[index]["ProductPrice"],
                                               // productPrice: 120
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                          );

                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.hasError.toString()),
                          );
                        } else {
                          return const Center(
                            child: Text("No Data Found"),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),

              //herbs product collection ends

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Fresh Fruits",
                      style:
                          TextStyle(fontSize: 16, color: Colors.orangeAccent),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fruitsallview(),));
                      },
                      child: const Text("View All",
                          style:
                              TextStyle(fontSize: 16, color: Colors.orangeAccent)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 260,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder(stream: FirebaseFirestore.instance.collection("FruitCollection").snapshots(), builder:
                    (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.active){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            // height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductOverview(
                                            imgUrl: "${snapshot.data!.docs[index]["ProductImage"]}",
                                            imgName: "${snapshot.data!.docs[index]["ProductName"]}",
                                            // wishlistQuantity: "${snapshot.data!.docs[index]["ProductQuantity"]}",
                                            wishlistPrice: snapshot.data!.docs[index]["ProductPrice"],
                                            wishlistId: "${snapshot.data!.docs[index]["ProductId"]}",
                                      ),
                                    )
                                );
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          topLeft: Radius.circular(12)),
                                      child: Image.network(
                                        "${snapshot.data!.docs[index]["ProductImage"]}",
                                        fit: BoxFit.cover,
                                        height: 150,
                                        width: 148,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 3.0),
                                    child: Text(
                                      "${snapshot.data!.docs[index]["ProductName"]}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.orangeAccent),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 3.0),
                                    child: Text(
                                      "₹${snapshot.data!.docs[index]["ProductPrice"]}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.greenAccent),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: SizedBox(
                                      width: 140,

                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.all(3),
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.black38,
                                                    )),
                                                child:
                                                InkWell(
                                                  onTap: (){
                                                    showModalBottomSheet(context: context, builder: (context){

                                                      return Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children:[
                                                          ListTile(
                                                              title: Text("${snapshot.data!.docs[index]["ProductUnit"][0]}"),
                                                              onTap: (){
                                                                setState(() {
                                                                  FruitsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][0]}";
                                                                });
                                                              }

                                                          ),
                                                          ListTile(
                                                            title: Text("${snapshot.data!.docs[index]["ProductUnit"][1]}"),
                                                            onTap: (){
                                                              FruitsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][1]}";
                                                              setState(() {

                                                              });
                                                            }
                                                            ,
                                                          ),
                                                          ListTile(
                                                              title:Text("${snapshot.data!.docs[index]["ProductUnit"][2]}"),
                                                              onTap: (){
                                                                setState(() {
                                                                  FruitsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][2]}";
                                                                });
                                                              }

                                                          ),
                                                          ListTile(
                                                              title: Text("${snapshot.data!.docs[index]["ProductUnit"][3]}"),
                                                              onTap: (){
                                                                FruitsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][3]}";
                                                              }

                                                          ),

                                                          // ListTile(
                                                          //
                                                          //     title: Text("${snapshot.data!.docs[index]["ProductUnit"][4]}"),
                                                          //     onTap: () {}
                                                          //
                                                          // ),

                                                        ],
                                                      );


                                                      // return Column(
                                                      //   mainAxisSize: MainAxisSize.min,
                                                      //
                                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                                      //   children:[
                                                      //     ListTile(
                                                      //         title: Text("${snapshot.data!.docs[index]["ProductUnit"][0]}"),
                                                      //         onTap: (){}
                                                      //
                                                      //     ),
                                                      //     ListTile(
                                                      //       title: Text("${snapshot.data!.docs[index]["ProductUnit"][1]}"),
                                                      //       onTap: (){}
                                                      //       ,
                                                      //     ),
                                                      //     ListTile(
                                                      //         title:Text("${snapshot.data!.docs[index]["ProductUnit"][2]}"),
                                                      //         onTap: (){}
                                                      //
                                                      //     ),
                                                      //     ListTile(
                                                      //         title: Text("${snapshot.data!.docs[index]["ProductUnit"][3]}"),
                                                      //         onTap: (){}
                                                      //
                                                      //     ),
                                                      //
                                                      //     // ListTile(
                                                      //     //
                                                      //     //     title: Text("${snapshot.data!.docs[index]["ProductUnit"][4]}"),
                                                      //     //     onTap: () {}
                                                      //     //
                                                      //     // ),
                                                      //
                                                      //   ],
                                                      // );

                                                    }
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FruitsProductUnit??"50 Gram",
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .arrow_drop_down_circle_outlined,
                                                        size: 13,
                                                        color:
                                                        Colors.orangeAccent,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                // productUnit(
                                                //   title: "50 Gram",)

                                              )
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Count(
                                            productImage: '${snapshot.data!.docs[index]["ProductImage"]}',
                                            productId: '${snapshot.data!.docs[index]["ProductId"]}',
                                            productName: '${snapshot.data!.docs[index]["ProductName"]}',
                                            productPrice: snapshot.data!.docs[index]["ProductPrice"],
                                            //productPrice: 150,
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.horizontal,
                      );

                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.hasError.toString()));
                    }
                    else{
                      return const Center(child: Text("No Data Found"),);
                    }
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }

                }),
              ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Fresh Dry Fruits",
                      style:
                          TextStyle(fontSize: 16, color: Colors.orangeAccent),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DryFruitviewAll(),));
                      },
                      child: const Text("View All",
                          style:
                              TextStyle(fontSize: 16, color: Colors.orangeAccent)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 260,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 260,
                      child: StreamBuilder(stream: FirebaseFirestore.instance.collection("DryFruitsCollection").snapshots(), builder:
                          (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.active){
                          if(snapshot.hasData){
                            return ListView.builder(
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  // height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductOverview(
                                                  imgUrl: "${snapshot.data!.docs[index]["ProductImage"]}",
                                                  imgName: "${snapshot.data!.docs[index]["ProductName"]}",
                                                  // wishlistQuantity: "${snapshot.data!.docs[index]["ProductQuantity"]}",
                                                  wishlistPrice: snapshot.data!.docs[index]["ProductPrice"],
                                                  wishlistId: "${snapshot.data!.docs[index]["ProductId"]}",
                                            ),
                                          ));
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                                topRight: Radius.circular(12),
                                                topLeft: Radius.circular(12)),
                                            child: Image.network(
                                              "${snapshot.data!.docs[index]["ProductImage"]}",
                                              fit: BoxFit.cover,
                                              height: 150,
                                              width: 148,
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 3.0),
                                          child: Text(
                                            "${snapshot.data!.docs[index]["ProductName"]}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.orangeAccent),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 3.0),
                                          child: Text(
                                            "₹${snapshot.data!.docs[index]["ProductPrice"]}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.greenAccent),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: SizedBox(
                                            width: 140,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      padding: const EdgeInsets.all(3),
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Colors.black38,
                                                          )),
                                                      child: InkWell(
                                                        onTap: (){
                                                          showModalBottomSheet(context: context, builder: (context){
                                                            return Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children:[
                                                                ListTile(
                                                                    title: Text("${snapshot.data!.docs[index]["ProductUnit"][0]}"),
                                                                    onTap: (){
                                                                      setState(() {
                                                                        DryFruitsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][0]}";
                                                                      });
                                                                    }

                                                                ),
                                                                ListTile(
                                                                  title: Text("${snapshot.data!.docs[index]["ProductUnit"][1]}"),
                                                                  onTap: (){
                                                                    DryFruitsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][1]}";
                                                                    setState(() {

                                                                    });
                                                                  }
                                                                  ,
                                                                ),
                                                                ListTile(
                                                                    title:Text("${snapshot.data!.docs[index]["ProductUnit"][2]}"),
                                                                    onTap: (){
                                                                      setState(() {
                                                                        DryFruitsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][2]}";
                                                                      });
                                                                    }

                                                                ),
                                                                ListTile(
                                                                    title: Text("${snapshot.data!.docs[index]["ProductUnit"][3]}"),
                                                                    onTap: (){
                                                                      DryFruitsProductUnit = "${snapshot.data!.docs[index]["ProductUnit"][3]}";
                                                                    }

                                                                ),

                                                                // ListTile(
                                                                //
                                                                //     title: Text("${snapshot.data!.docs[index]["ProductUnit"][4]}"),
                                                                //     onTap: () {}
                                                                //
                                                                // ),

                                                              ],
                                                            );

                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              DryFruitsProductUnit??"50Gram",
                                                              style: const TextStyle(
                                                                  fontSize: 11),
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .arrow_drop_down_circle_outlined,
                                                              size: 13,
                                                              color:
                                                              Colors.orangeAccent,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Count(
                                                  productImage: '${snapshot.data!.docs[index]["ProductImage"]}',
                                                  productId:    '${snapshot.data!.docs[index]["ProductId"]}',
                                                  productName:  '${snapshot.data!.docs[index]["ProductName"]}',
                                                  productPrice:   snapshot.data!.docs[index]["ProductPrice"],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              itemCount: snapshot.data!.docs.length,
                              scrollDirection: Axis.horizontal,
                            );


                          }else if(snapshot.hasError){
                            return Center(child: Text(snapshot.hasError.toString()));
                          }
                          else{
                            return const Center(child: Text("No Data Found"),);
                          }
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }

                      }),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
