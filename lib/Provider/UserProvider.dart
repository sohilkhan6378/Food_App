import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier{
 void addUserData({
   required User currentUser,
   required String username,
   required String useremail,
   required String userimage
 }) async{
  await FirebaseFirestore.instance.collection("UsersData").doc(currentUser.uid).set({
  "UserId": currentUser.uid,
   "UserName": username,
   "UserEmail": useremail,
   "UserImage": userimage
   });

 }

}