import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Provider/checOut.dart';
class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);
  @override
  Widget build(BuildContext context) {
    // checkOutProvider checkoutprovider = Provider.of(context);
    // checkoutprovider.getDeliveryAddressData();

    return Scaffold(
    appBar: AppBar(
      title: const Text("Google Map"),
      centerTitle: true,
      backgroundColor: Colors.orangeAccent,
    ),
    body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          GoogleMap(initialCameraPosition: CameraPosition(target: _initialcameraposition),
            mapType: MapType.normal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            onMapCreated: (value){},
            mapToolbarEnabled: true,
            // myLocationEnabled: true,

          )
        ],
      ),
    ),
    );
  }
}
