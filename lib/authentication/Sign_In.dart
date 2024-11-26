// import 'dart:ffi';
//
// import 'package:auth_buttons/auth_buttons.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
//
// import '../Provider/UserProvider.dart';
//
// class SignIn extends StatefulWidget {
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   late UserProvider userProvider;
//
//   googleLogin() async {
//     print("googleLogin method Called");
//     GoogleSignIn _googleSignIn = GoogleSignIn();
//     try {
//       var reslut = await _googleSignIn.signIn();
//       if (reslut == null) {
//         return;
//       }
//
//       final userData = await reslut.authentication;
//       final credential = GoogleAuthProvider.credential(accessToken: userData.accessToken, idToken: userData.idToken);
//       var finalResult =  (await FirebaseAuth.instance.signInWithCredential(credential));
//
//       print("Result $finalResult");
//        print(reslut.displayName);
//       var email =  print(reslut.email);
//       var photo =   print(reslut.photoUrl);
//     userProvider.addUserData(
//         currentUser: reslut,
//         username: "${reslut.displayName}",
//         useremail:"${reslut.email}",
//         userimage: "${reslut.photoUrl}"
//     );
//
//      }
//     catch (error) {
//       print(error);
//     }
//   }
//
//
//   Future<void> signOut() async{
//     await GoogleSignIn().disconnect();
//     FirebaseAuth.instance.signOut();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     userProvider = Provider.of<UserProvider>(context);
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage("assets/images/background.png"),
//             )),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Sign In to Continue",
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black87,
//                   letterSpacing: 1.5,
//                   fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Vegi",
//               style: TextStyle(
//                   fontSize: 50,
//                   color: Colors.white,
//                   shadows: [
//                     BoxShadow(
//                         blurRadius: 10,
//                         color: Colors.lightGreen,
//                         offset: Offset(4, 4))
//                   ],
//                   fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             GoogleAuthButton(
//               onPressed: () {
//                 googleLogin();
//               },
//               style: AuthButtonStyle(
//                   buttonColor: Colors.white,
//                   textStyle: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 20,
//                   ),
//                   borderRadius: 5,
//                   elevation: 5,
//                   iconType: AuthIconType.secondary),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             AppleAuthButton(
//               onPressed: () {},
//               style: AuthButtonStyle(
//                   buttonColor: Colors.white,
//                   textStyle: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 20,
//                   ),
//                   borderRadius: 5,
//                   elevation: 5,
//                   //iconType:AuthIconType.secondary,
//                   iconType: AuthIconType.outlined,
//                   iconColor: Colors.orange,
//                   width: 275,
//                   iconSize: 35),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Text(
//               "By Signing You are Agree to Our",
//               style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
//             ),
//             Text("Terms and Privacy Policy",
//                 style: TextStyle(fontSize: 16, color: Colors.grey.shade800)),
//             SizedBox(
//               height: 50,
//             ),
//             ElevatedButton(onPressed: (){
//               signOut();
//             }, child: Icon(Icons.logout)),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:ffi';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../Provider/UserProvider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider;

  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var reslut = await googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken,
      );

      // Sign in with Firebase and get User object
      UserCredential finalResult = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = finalResult.user;

      // print("Firebase User: $user");
      // print("Google User Name: ${reslut.displayName}");
      // print("Google User Email: ${reslut.email}");
      // print("Google User Photo: ${reslut.photoUrl}");

      // Use Firebase User object to add user data
      if (user != null) {
        userProvider.addUserData(
          currentUser: user,
          username: "${reslut.displayName}",
          useremail: reslut.email,
          userimage: "${reslut.photoUrl}",
        );
      }

    } catch (error) {
      print("Error in googleLogin: $error");
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign In to Continue",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Vegi",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.lightGreen,
                    offset: Offset(4, 4),
                  ),
                ],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            GoogleAuthButton(
              onPressed: googleLogin,
              style: const AuthButtonStyle(
                buttonColor: Colors.white,
                textStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
                borderRadius: 5,
                elevation: 5,
                iconType: AuthIconType.secondary,
              ),
            ),
            const SizedBox(height: 10),
            AppleAuthButton(
              onPressed: () {},
              style: const AuthButtonStyle(
                buttonColor: Colors.white,
                textStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
                borderRadius: 5,
                elevation: 5,
                iconType: AuthIconType.outlined,
                iconColor: Colors.orange,
                width: 275,
                iconSize: 35,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "By Signing You are Agree to Our",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
            ),
            Text(
              "Terms and Privacy Policy",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: signOut,
              child: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
