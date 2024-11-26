import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class DryFruitviewAll extends StatelessWidget {
  bool isBool = true;

  DryFruitviewAll({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All DryFruitsProduct"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
        body: ListView(
            children:[
              Container(
                //height: double.infinity,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: Text("Search items", style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      alignment: Alignment.center,
                      width: 380,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 5),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: StreamBuilder(stream: FirebaseFirestore.instance.collection("DryFruitsCollection").snapshots(), builder: (context,snapshot){
                          if(snapshot.connectionState == ConnectionState.active){
                            if(snapshot.hasData){
                              return ListView.builder(itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                        fit: BoxFit.cover,
                                        height: 110,
                                        width: 140,
                                        "${snapshot.data!.docs[index]["ProductImage"]}"),
                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${snapshot.data!.docs[index]["ProductName"]}",
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.orangeAccent,
                                                ),
                                              ),
                                              Text(
                                                "${snapshot.data!.docs[index]["ProductPrice"]}",
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.orangeAccent,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
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
                                        )),
                                    Expanded(
                                        child: isBool == true
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
                                            : SizedBox(
                                          height: 50,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.delete,
                                                color: Colors.orangeAccent,
                                                size: 24,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(left: 5),
                                                alignment: Alignment.center,
                                                height: 26,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.green,
                                                      width: 2,
                                                    ),
                                                    borderRadius: BorderRadius.circular(20)),
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
                                              )
                                            ],
                                          ),
                                        ))
                                  ],

                                ),
                              ),itemCount: snapshot.data!.docs.length,
                              );

                            }else if(snapshot.hasError){
                              return Center(child: Text(snapshot.hasError.toString()),);
                            }
                            else{
                              return const Center(child: Text("No Data Found"),);
                            }

                          }else{
                            return const Center(child: CircularProgressIndicator(),);
                          }

                        }),
                      ),
                    )
                  ],
                ),
              ),
            ]

        )
    );
  }
}
