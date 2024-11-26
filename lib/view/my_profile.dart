import 'package:flutter/material.dart';
import 'package:food_app/view/Drawer_Side.dart';

class MyProfile extends StatefulWidget{
  String userName;
  String userEmail;
  String userImage;

  MyProfile({super.key, 
    required this.userName,
    required this.userEmail,
    required this.userImage
});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override

  Widget listtile ({
    required IconData icon,
    required String title,
    //required IconData icon,
}){
    return Column(
      children: [
        const Divider(
          height: 10,
        ),
        ListTile(
          leading: Icon(icon, color: Colors.orangeAccent,),
          title: Text(title, style: const TextStyle(color: Colors.greenAccent, fontSize: 18),),
          trailing: const Icon(Icons.arrow_forward_ios,color: Colors.orangeAccent,),
        )
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
  backgroundColor: Colors.orangeAccent,
      drawer: Drawer_side(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.orangeAccent),
        title: const Text("My Profile", style: TextStyle(
          color: Colors.orangeAccent,
          fontSize: 18
        ),),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.orangeAccent,
                ),
                Container(
                  height: 602.3,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    )
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: const EdgeInsets.only(left: 20),
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.userName, style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,

                                      ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(widget.userEmail, style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,

                                      ),),


                                    ],
                                  ),
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.orangeAccent,
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.greenAccent,
                                      child: Icon(Icons.edit,size: 15, color: Colors.orangeAccent,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                      listtile(
                        icon: Icons.shop,
                        title: "My Orders",
                      ),
                      listtile(
                        icon: Icons.location_on_outlined,
                        title: "My Delivery Address",
                      ),
                      listtile(
                        icon: Icons.person_outline,
                        title: "Refer A Friend",
                      ),
                      listtile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions",
                      ),
                      listtile(
                        icon: Icons.policy_outlined,
                        title: "Privacy & Policy",
                      ),
                      listtile(
                        icon: Icons.add_chart,
                        title: "About",
                      ),
                      listtile(
                        icon: Icons.exit_to_app_outlined,
                        title: "Logout",
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.greenAccent,
                child: CircleAvatar(
                  // backgroundImage: AssetImage(userImage),
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                      child: Image.network(widget.userImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZMSiYpk1yz3y3YCk_1bNEyom9VeQ1sfEdJw&s")),


                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}