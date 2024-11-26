import 'package:flutter/material.dart';
import 'package:food_app/Widgets/searchItem.dart';
class Search extends StatelessWidget {
  const Search({super.key});

  @override

  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-I0SfVVskBpAoFfywL71z9QaPIJ67NNK-OJSWKhxrPSBrklGQZxIEfLY7518usZHWvdo&usqp=CAU",
  // Widget Search_item() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Expanded(
  //           child: Image.network(
  //            //ProductImage,
  //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-I0SfVVskBpAoFfywL71z9QaPIJ67NNK-OJSWKhxrPSBrklGQZxIEfLY7518usZHWvdo&usqp=CAU"),
  //         ),
  //
  //
  //         Expanded(
  //             child: Padding(
  //           padding: const EdgeInsets.only(left: 15.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 "Product Name",
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: Colors.orangeAccent,
  //                 ),
  //               ),
  //               Text(
  //                 "50\$/50 Gram",
  //                 style: TextStyle(
  //                   fontSize: 15,
  //                   color: Colors.orangeAccent,
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 3,
  //               ),
  //               Container(
  //                 height: 40,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(18),
  //                     border: Border.all(color: Colors.green, width: 1)),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       "50 Gram",
  //                       style: TextStyle(color: Colors.green),
  //                     ),
  //                     Icon(
  //                       Icons.arrow_drop_down,
  //                       size: 30,
  //                       color: Colors.green,
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         )),
  //         Expanded(
  //             flex: 1,
  //             child: Container(
  //               alignment: Alignment.center,
  //               height: 40,
  //               decoration: BoxDecoration(
  //                 border: Border.all(
  //                   color: Colors.green,
  //                   width: 1,
  //                 ),
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(
  //                     Icons.add,
  //                     size: 25,
  //                     color: Colors.green,
  //                   ),
  //                   Text(
  //                     "ADD",
  //                     style: TextStyle(fontSize: 18, color: Colors.green),
  //                   )
  //                 ],
  //               ),
  //
  //         ))
  //       ],
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Search"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.menu,
              color: Colors.green,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Search Item",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 22,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                  child: SizedBox(
                width: 375,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.orangeAccent,
                    ),
                    hintText: "Search Item From Store",
                    hintStyle: const TextStyle(color: Colors.orangeAccent),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.orangeAccent,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.orangeAccent,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.orangeAccent,
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.orangeAccent,
                        )),
                  ),
                ),
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Search_Item(
            isBool: false, imgUrl: '', isImage: true,
          ),
          Search_Item(
            isBool: false, imgUrl: '', isImage: true,
          ),
          Search_Item(
            isBool: false, imgUrl: '', isImage: true,
          ),
          Search_Item(
            isBool: false, imgUrl: '', isImage: true,
          ),
          Search_Item(
            isBool: false, imgUrl: '', isImage: true,
          ),
          Search_Item(
            isBool: false, imgUrl: '', isImage: true,
          ),




        ],
      ),
    );
  }
}
