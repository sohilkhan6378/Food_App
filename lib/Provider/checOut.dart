import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/delivery_model.dart';

class checkOutProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobilenumberController = TextEditingController();
  TextEditingController AlterNatenumController = TextEditingController();
  TextEditingController SocietyController = TextEditingController();
  TextEditingController StreetController = TextEditingController();
  TextEditingController LandmarkController = TextEditingController();
  TextEditingController CityController = TextEditingController();
  TextEditingController AreaController = TextEditingController();
  TextEditingController PincodeController = TextEditingController();
  void validator(context, myType) async {
    if (FirstNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "First Name is Required");
    } else if (LastNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last Name is Required");
    } else if (MobilenumberController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile number is Required");
    } else if (AlterNatenumController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alternate Mobile number is Required");
    } else if (SocietyController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Society is Empty");
    } else if (StreetController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Street is Empty");
    } else if (LandmarkController.text.isEmpty) {
      Fluttertoast.showToast(msg: "LandMark is Empty");
    } else if (CityController.text.isEmpty) {
      Fluttertoast.showToast(msg: "City is Empty");
    } else if (AreaController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Area is Empty");
    } else if (PincodeController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pincode is Empty");
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("addDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "firstname": FirstNameController.text,
        "lastname": LastNameController.text,
        "mobilenumber": MobilenumberController.text,
        "altermobile": AlterNatenumController.text,
        "society": SocietyController.text,
        "street": StreetController.text,
        "landmark": LandmarkController.text,
        "city": CityController.text,
        "area": AreaController.text,
        "pincode": PincodeController.text,
        "addresstype": myType.toString(),
      }).then((value) async {
        isLoading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Add Your Delivery Address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }




  // List<DeliveryAddressModel> deliveryAdressList = [];
  // getDeliveryAddressData() async {
  //   List<DeliveryAddressModel> newList = [];
  //   DocumentSnapshot db = await FirebaseFirestore.instance
  //           .collection("addDeliveryAddress")
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .get();
  //
  //   if (db.exists) {
  //     print(db);
  //     print("Data Available");
  //     DeliveryAddressModel deliveryAddressModel = DeliveryAddressModel(
  //       firstName: db.get("firstname"),
  //       lastName: db.get("lastname"),
  //       AddressType: db.get("addresstype"),
  //       // Correct field name
  //       Area: db.get("area"),
  //       // Correct field name
  //       AltMobileNum: db.get("altermobile"),
  //       City: db.get("city"),
  //       Landmark: db.get("landmark"),
  //       MobileNumber: db.get("mobilenumber"),
  //       Pincode: db.get("pincode"),
  //       Society: db.get("society"),
  //       // Correct field name
  //       Street: db.get("street"),
  //     );
  //     newList.add(deliveryAddressModel);
  //     notifyListeners();
  //   }
  //   deliveryAdressList = newList;
  // }
  // List<DeliveryAddressModel> get getDeliveryAddressList {
  //     return deliveryAdressList;
  //   }

List<DeliveryAddressModel> deliveryAddressList= [];
void getDeliveryAddressData()async{
  List<DeliveryAddressModel> newList = [];
  DeliveryAddressModel deliveryAddressModel;
 DocumentSnapshot db =  await FirebaseFirestore.instance
      .collection("addDeliveryAddress")
      .doc(FirebaseAuth.instance.currentUser?.uid).get();
 if(db.exists){
   print("Data Available");
   deliveryAddressModel = DeliveryAddressModel(
       // AddressType: _db.get(), firstName: '', lastName: '', MobileNumber: '',
       // AltMobileNum: '', Society: '', Street: '', Landmark: '', City: '', Area: '', Pincode: '',
     firstName: db.get("firstname"),
           lastName: db.get("lastname"),
           AddressType: db.get("addresstype"),
           // Correct field name
           Area: db.get("area"),
           // Correct field name
           AltMobileNum: db.get("altermobile"),
           City: db.get("city"),
           Landmark: db.get("landmark"),
           MobileNumber: db.get("mobilenumber"),
           Pincode: db.get("pincode"),
           Society: db.get("society"),
           // Correct field name
           Street: db.get("street"),
   );
   newList.add(deliveryAddressModel);
   notifyListeners();
 }
  deliveryAddressList = newList;
 notifyListeners();
}
  List<DeliveryAddressModel>  get getDeliveryAddressList{
    return deliveryAddressList;
  }

}
