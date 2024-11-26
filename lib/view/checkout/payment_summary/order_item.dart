import 'package:flutter/material.dart';
class orderItem extends StatelessWidget {
  const orderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network("https://t4.ftcdn.net/jpg/05/37/04/61/360_F_537046123_s8JVn2NrClPQDOryhSm8jonYZPfIzPRX.jpg", width: 100, height: 90,),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Tomato", style: TextStyle(
            color: Colors.grey.shade600,
          ),
          ),
          Text("50Gram", style: TextStyle(
            color: Colors.grey.shade600,
          ),
          ),
          const Text(" Price₹30",)
        ],
      ),
      subtitle: const Text("Quantity 2"),
    );
  }
}
