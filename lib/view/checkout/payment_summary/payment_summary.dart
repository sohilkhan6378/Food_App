import 'package:flutter/material.dart';

import '../Add_Delivery_Address/add_delivery_address.dart';
import 'order_item.dart';

class paymentSummary extends StatefulWidget {
  const paymentSummary({super.key});

  @override
  State<paymentSummary> createState() => _paymentSummaryState();
}
enum AddressType{
  Home,
  OnlinePayment,
  PhonePe,
  Gpay,
  AmazonePay,
}
class _paymentSummaryState extends State<paymentSummary> {
  var myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      bottomNavigationBar: ListTile(
        title: const Text("Total Amount"),
        subtitle: const Text(
          "₹300",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            color: Colors.orangeAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "PLACE ORDER",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const ListTile(
                    title: Text("Sohil Khan"),
                    subtitle: Text(
                        "82/83 Sector-8, Pratap Nagar Jaipur Rajasthan(302016)"),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const ExpansionTile(   title: Text("Order Item 5"),   children: [
                    orderItem(),
                    orderItem(),
                    orderItem(),
                    orderItem(),
                    orderItem(),
                  ]
                  ) ,
                  const Divider(),
                  const ListTile(
                    minVerticalPadding: 5,
                    leading: Text("Subtotal",style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                   trailing: Text("₹300", style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text("Shipping Charge",style: TextStyle(
                        color: Colors.grey.shade600
                    ),),
                    trailing: const Text("₹0", style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text("Company Discount",style: TextStyle(
                        color: Colors.grey.shade600
                    ),),
                    trailing: const Text("₹20", style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  const Divider(
                  ),
                  const ListTile(
                    leading: Text("Payment Options"),
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
                    secondary: const Icon(Icons.work,color: Colors.orangeAccent,),
                  ),
                  RadioListTile(
                    value: AddressType.OnlinePayment,
                    title: const Text("OnlinePayment"),
                    groupValue: myType,
                    onChanged: (AddressType? value){
                      setState(() {
                        myType = value!;
                      });
                    },
                    secondary: const Icon(Icons.other_houses,color: Colors.orangeAccent,),
                  ),
                  RadioListTile(
                    value: AddressType.PhonePe,
                    title: const Text("Phonepe"),
                    groupValue: myType,
                    onChanged: (AddressType? value){
                      setState(() {
                        myType = value!;
                      });
                    },
                    secondary: const Icon(Icons.paypal,color: Colors.orangeAccent,),
                  ),
                  RadioListTile(
                    value: AddressType.Gpay,
                    title: const Text("GooglePay"),
                    groupValue: myType,
                    onChanged: (AddressType? value){
                      setState(() {
                        myType = value!;
                      });
                    },
                    secondary: const Icon(Icons.payment,color: Colors.orangeAccent,),
                  ),
                  RadioListTile(
                    value: AddressType.AmazonePay,
                    title: const Text("Amazonepay"),
                    groupValue: myType,
                    onChanged: (AddressType? value){
                      setState(() {
                        myType = value!;
                      });
                    },
                    secondary: const Icon(Icons.payments,color: Colors.orangeAccent,),
                  ),
                ],
              );
            }, itemCount: 1,
          )
      ),
    );
  }
}
