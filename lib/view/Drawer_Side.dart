import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/HomeScreen.dart';
import 'package:food_app/view/Review_cart.dart';
import 'package:food_app/view/wislistProduct.dart';
import 'my_profile.dart';

class Drawer_side extends StatefulWidget {
  const Drawer_side({super.key});

  @override
  State<Drawer_side> createState() => _Drawer_sideState();
}

class _Drawer_sideState extends State<Drawer_side> {
  Widget Drawer_icon({IconData? icon, String title = " "}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: Colors.greenAccent,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      backgroundColor: Colors.orangeAccent,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SizedBox(

          width: MediaQuery.of(context).size.width,
          child:
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("UsersData")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                   return ListView.builder(itemBuilder: (context, index)=>  SizedBox(
                     height: MediaQuery.of(context).size.height,
                     child: ListView(
                       children: [
                         const SizedBox(
                           height: 30,
                         ),
                         Row(
                           children: [
                             CircleAvatar(
                               backgroundColor: Colors.white,
                               radius: 40,
                               child: SizedBox( height: 78, width: 78, child: ClipRRect(
                                 borderRadius: BorderRadius.circular(40),
                                   child: Image.network("${snapshot.data!.docs[index]["UserImage"]}")
                               ),
                               )
                               // CircleAvatar(
                               //  backgroundColor: Colors.red,C
                               //   backgroundImage: AssetImage(
                               //   "assets/images/logo.webp",
                               //   ),
                               //   radius: 38,
                               //
                               // ),
                             ),
                             const SizedBox(
                               width: 10,
                             ),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "${snapshot.data!.docs[index]["UserName"]}",
                                   style: const TextStyle(
                                     fontSize: 18,
                                     color: Colors.greenAccent,
                                   ),
                                 ),
                                 Text(
                                   "${snapshot.data!.docs[index]["UserEmail"]}",
                                   style: const TextStyle(
                                     fontSize: 12,
                                     color: Colors.greenAccent,
                                   ),
                                 ),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                 SizedBox(
                                     height: 30,
                                     child: OutlinedButton(
                                       onPressed: () {},
                                       style: OutlinedButton.styleFrom(
                                         backgroundColor: Colors.lightGreenAccent,
                                       ),
                                       child: Text(
                                         "Login",
                                         style: TextStyle(color: Colors.white),
                                       ),
                                     ))
                               ],
                             )
                           ],
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         InkWell(
                             onTap: () {
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => Homescreen(),
                                   ));
                             },
                             child: Drawer_icon(icon: Icons.home_outlined, title: "Home")),
                         InkWell(
                           onTap: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => ReviewCart(),
                                 ));
                           },
                           child: Drawer_icon(
                               icon: Icons.shopping_bag_outlined, title: "Review Cart"),
                         ),
                         InkWell(
                             onTap: () {
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => MyProfile(
                                         userName: "${snapshot.data!.docs[index]["UserName"]}",
                                         userEmail:  "${snapshot.data!.docs[index]["UserEmail"]}",
                                         userImage:  "${snapshot.data!.docs[index]["UserImage"]}"
                                     )
                               ));
                             },
                             child: Drawer_icon(
                                 icon: Icons.account_circle, title: "My Profile")),
                         Drawer_icon(icon: Icons.notifications, title: "Notification"),
                         Drawer_icon(icon: Icons.star, title: "Rating"),
                         InkWell(
                             onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistProduct(),));
                             },
                             child: Drawer_icon(
                                 icon: Icons.favorite_outline_outlined, title: "Wishlist")),
                         Drawer_icon(icon: Icons.copy, title: "Complaint"),
                         Drawer_icon(icon: Icons.format_quote_outlined, title: "FAQS"),
                         const SizedBox(
                           height: 10,
                         ),
                         const Padding(
                           padding: EdgeInsets.only(left: 18.0),
                           child: Text(
                             "Contact Support",
                             style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                           ),
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 18.0),
                           child: Container(
                             width: 200,
                             alignment: Alignment.topLeft,
                             child: const Row(
                               // mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "Call Us:",
                                   style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                                 ),
                                 SizedBox(
                                   width: 20,
                                 ),
                                 Text(
                                   "9785181728",
                                   style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                                 )
                               ],
                             ),
                           ),
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 18.0),
                           child: Container(
                             width: 200,
                             alignment: Alignment.topLeft,
                             child: const Row(
                               //mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "Email Us:",
                                   style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                                 ),
                                 SizedBox(
                                   width: 10,
                                 ),
                                 Text(
                                   "Khansohil870@gmail.com",
                                   style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                       itemCount: snapshot.data!.docs.length,
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
        // ListView(
        //   children: [
        //     SizedBox(
        //       height: 30,
        //     ),
        //     Row(
        //       children: [
        //         CircleAvatar(
        //           backgroundColor: Colors.white,
        //           radius: 40,
        //           child: CircleAvatar(
        //             backgroundColor: Colors.red,
        //             backgroundImage: AssetImage(
        //                 "assets/images/logo.webp"),
        //             radius: 38,
        //           ),
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Column(
        //
        //
        //
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Welcome Guest",
        //               style: TextStyle(
        //                 fontSize: 18,
        //                 color: Colors.greenAccent,
        //               ),
        //             ),
        //             Container(
        //                 height: 30,
        //                 child: OutlinedButton(
        //                   onPressed: () {},
        //                   child: Text(
        //                     "Login",
        //                     style: TextStyle(color: Colors.white),
        //                   ),
        //                   style: OutlinedButton.styleFrom(
        //                     backgroundColor: Colors.lightGreenAccent,
        //                   ),
        //                 ))
        //           ],
        //         )
        //       ],
        //     ),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     InkWell(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => Homescreen(),
        //               ));
        //         },
        //         child: Drawer_icon(icon: Icons.home_outlined, title: "Home")),
        //     InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => ReviewCart(),
        //             ));
        //       },
        //       child: Drawer_icon(
        //           icon: Icons.shopping_bag_outlined, title: "Review Cart"),
        //     ),
        //     InkWell(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => MyProfile(),
        //               ));
        //         },
        //         child: Drawer_icon(
        //             icon: Icons.account_circle, title: "My Profile")),
        //     Drawer_icon(icon: Icons.notifications, title: "Notification"),
        //     Drawer_icon(icon: Icons.star, title: "Rating"),
        //     InkWell(
        //         onTap: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistProduct(),));
        //         },
        //         child: Drawer_icon(
        //             icon: Icons.favorite_outline_outlined, title: "Wishlist")),
        //     Drawer_icon(icon: Icons.copy, title: "Complaint"),
        //     Drawer_icon(icon: Icons.format_quote_outlined, title: "FAQS"),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 18.0),
        //       child: Text(
        //         "Contact Support",
        //         style: TextStyle(fontSize: 18, color: Colors.greenAccent),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 5,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 18.0),
        //       child: Container(
        //         width: 200,
        //         alignment: Alignment.topLeft,
        //         child: Row(
        //           // mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Call Us:",
        //               style: TextStyle(fontSize: 16, color: Colors.greenAccent),
        //             ),
        //             SizedBox(
        //               width: 20,
        //             ),
        //             Text(
        //               "9785181728",
        //               style: TextStyle(fontSize: 16, color: Colors.greenAccent),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 5,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 18.0),
        //       child: Container(
        //         width: 200,
        //         alignment: Alignment.topLeft,
        //         child: Row(
        //           //mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Email Us:",
        //               style: TextStyle(fontSize: 16, color: Colors.greenAccent),
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             Text(
        //               "Khansohil870@gmail.com",
        //               style: TextStyle(fontSize: 16, color: Colors.greenAccent),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
