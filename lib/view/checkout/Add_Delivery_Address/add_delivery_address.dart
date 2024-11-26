import 'package:flutter/material.dart';
import 'package:food_app/view/checkout/googleMap/google_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Provider/checOut.dart';
import '../../../Widgets/custom_textfield.dart';
import '../Single_delivery_item.dart';
class addDeliveyAddress extends StatefulWidget {
  const addDeliveyAddress({super.key});
  @override
  State<addDeliveyAddress> createState() => _addDeliveyAddressState();
}
enum AddressType{
  Home,
  Work,
  Other
}

class _addDeliveyAddressState extends State<addDeliveyAddress> {
var myType = AddressType.Home;
var myname;
TextEditingController FirstNameController  = TextEditingController();
TextEditingController LastNameController  = TextEditingController();
TextEditingController MobilenumberController  = TextEditingController();
TextEditingController AlterNatenumController  = TextEditingController();
TextEditingController SocietyController  = TextEditingController();
TextEditingController StreetController  = TextEditingController();
TextEditingController LandmarkController  = TextEditingController();
TextEditingController CityController  = TextEditingController();
TextEditingController AreaController  = TextEditingController();
TextEditingController PincodeController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    checkOutProvider checkoutprovider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Delivery Address"),
      centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.orangeAccent,
        ),

        child: checkoutprovider.isLoading ==false?
        MaterialButton(onPressed: (){
          myname = FirstNameController.text.toString();
          checkoutprovider.validator(context,myType);
        },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),child: Text("Add Address", style: TextStyle(
          color: Colors.white,fontSize: 18,
        ),
        ),
        ): const Center(child: CircularProgressIndicator(color: Colors.green,),)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: ListView(
          children: [

            CustomTextfield(
              controller: checkoutprovider.FirstNameController,
              labText: 'FirstName',
              keyboardType: TextInputType.text,
            ),
            CustomTextfield(
              controller: checkoutprovider.LastNameController,
              labText: 'LastName',
              keyboardType: TextInputType.text,
            ),
            CustomTextfield(
              controller: checkoutprovider.MobilenumberController,
              labText: 'Mobile Number',
              keyboardType: TextInputType.text,
            ),
            CustomTextfield(
              controller: checkoutprovider.AlterNatenumController,
              labText: 'AlterNate Number',
              keyboardType: TextInputType.text,
            ),CustomTextfield(
              controller: checkoutprovider.SocietyController,
              labText: 'Society',
              keyboardType: TextInputType.text,
            ),CustomTextfield(
              controller: checkoutprovider.StreetController,
              labText: 'Street',
              keyboardType: TextInputType.text,
            ),CustomTextfield(
              controller: checkoutprovider.LandmarkController,
              labText: 'LandMark',
              keyboardType: TextInputType.text,
            ),
            CustomTextfield(
              controller: checkoutprovider.CityController,
              labText: 'City',
              keyboardType: TextInputType.text,
            ),
            CustomTextfield(
              controller: checkoutprovider.AreaController,
              labText: 'Area',
              keyboardType: TextInputType.text,
            ),
            CustomTextfield(
              controller: checkoutprovider.PincodeController,
              labText: 'Pincode',
              keyboardType: TextInputType.number,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomGoogleMap(),));
              },
              child: SizedBox(
                height: 47,
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set Location")
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
                value: AddressType.Home,
                title: const Text("Home"),
                groupValue: myType,
              onChanged: (AddressType? value){
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(Icons.home,color: Colors.orangeAccent,),
            ),
            RadioListTile(
              value: AddressType.Work,
              title: const Text("Work"),
              groupValue: myType,
              onChanged: (AddressType? value){
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(Icons.work,color: Colors.orangeAccent,),
            ),
            RadioListTile(
              value: AddressType.Other,
              title: const Text("Other"),
              groupValue: myType,
              onChanged: (AddressType? value){
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(Icons.other_houses,color: Colors.orangeAccent,),
            )
          ],
        ),
      ),

    );
  }
}
