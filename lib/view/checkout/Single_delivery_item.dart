import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addresstype;

  const SingleDeliveryItem(
  {super.key, 
    required this.title,
    required this.address,
    required this.number,
    required this.addresstype
  }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 20,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10,),
                  ),
                  child: Text(addresstype, style: const TextStyle(fontSize: 13, color: Colors.white),),
                ),
              ),
            ],
          ),
          leading: const CircleAvatar(
            radius: 10,
            backgroundColor: Colors.orangeAccent,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              const SizedBox(
                height: 5,
              ),
              Text(number),
            ],
          ),

        ),
        const Divider(
          height: 1,
          color: Colors.black,
        )
      ],
    );
  }
}
