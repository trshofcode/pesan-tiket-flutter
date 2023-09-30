import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PetaHalaman extends StatefulWidget {
  PetaState createState() => PetaState();
}

class PetaState extends State<PetaHalaman> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-7.5780925, 110.8091229);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peta"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15,
        ),
      ),
    );
  }
}
