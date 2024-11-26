import 'package:flutter/material.dart';
import 'package:food_app/view/checkout/payment_summary/payment_summary.dart';
import 'package:provider/provider.dart';

import '../../Model/delivery_model.dart';
import '../../Provider/checOut.dart';
import 'Add_Delivery_Address/add_delivery_address.dart';
import 'Single_delivery_item.dart';
class deliveryDetails extends StatefulWidget {
  const deliveryDetails({super.key});

  @override
  State<deliveryDetails> createState() => _deliveryDetailsState();
}

class _deliveryDetailsState extends State<deliveryDetails> {


  @override
  Widget build(BuildContext context) {
    checkOutProvider checkoutprovider = Provider.of(context);
    checkoutprovider.getDeliveryAddressData();
//print(checkoutprovider.getDeliveryAddressList);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const addDeliveyAddress(),));
        },
      backgroundColor: Colors.orangeAccent,
      child: const Icon(Icons.add,size: 30,color: Colors.white,),),
    //   bottomNavigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(30)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: MaterialButton(
          onPressed: (){
             checkoutprovider.getDeliveryAddressList.isEmpty?  Navigator.push(context, MaterialPageRoute(builder: (context) => const addDeliveyAddress(),)):  Navigator.push(context, MaterialPageRoute(builder: (context) => const paymentSummary(),));
          },
          child:
          checkoutprovider.getDeliveryAddressList.isEmpty? const Text("Add New Address", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w400
          ),): const Text("Payment Summary"),
        ),
      ),
        appBar: AppBar(
          title: const Text("Delivery Details", style: TextStyle(fontSize: 25, color: Colors.green),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,

    ),
      body: ListView(
        children: [
          const ListTile(
            title: Text("Deliver To", style: TextStyle(color: Colors.black, fontSize: 18),),
            leading: Icon(Icons.location_on, size: 30,color: Colors.black,),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
    checkoutprovider.getDeliveryAddressList.isEmpty? Container(
        child: const Center(child: Text("No Data"),),
      ):
          Column(
            children: checkoutprovider.getDeliveryAddressList.map((e){
              return SingleDeliveryItem(
                      title: "${e.firstName} ${e.lastName}",
                      address: "${e.Area} , ${e.Street} , ${e.Society}",
                      number: "${e.MobileNumber} , ${e.AltMobileNum}",
                      addresstype: e.AddressType,
                    );
            }).toList(),
            // children: [
            //   checkoutprovider.getDeliveryAddressList.isEmpty? Container(
            //     child: Center(child: Text("No Datas"),),
            //   ): SingleDeliveryItem(
            //     title: 'Sohil Developer',
            //     address: 'Area Pratap Nagar Sector 8 Jaipur(RAJASTHAN)',
            //     number: '+919785181728',
            //     addresstype: 'Work',
            //   ),
            //   // SingleDeliveryItem(
            //   //   title: 'Sohil Developer',
            //   //   address: 'Area Pratap Nagar Sector 8 Jaipur(RAJASTHAN)',
            //   //   number: '+919785181728',
            //   //   addresstype: 'Work',
            //   // ),
            //
            // ],
          )
        ],
      ),
    );
  }
}
