import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/Provider/Cart_Provider.dart';
import 'package:food_app/Provider/Product_Provider.dart';
import 'package:food_app/Provider/UserProvider.dart';
import 'package:food_app/Provider/wish_list_provider.dart';
import 'package:food_app/view/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'Provider/checOut.dart';
// import 'package:food_app/view/HomeScreen.dart';
// import 'Authentication/Sign_In.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider<ProductProvider>(
    create: (context)=>ProductProvider()),
    ChangeNotifierProvider<UserProvider>(
    create: (context)=>UserProvider()),
      ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),),
      ChangeNotifierProvider<WishlistProvider>(create: (context) => WishlistProvider(),),
      ChangeNotifierProvider<checkOutProvider>(
        create: (context) => checkOutProvider(),),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Homescreen(),
      ),
    );
  }
}
