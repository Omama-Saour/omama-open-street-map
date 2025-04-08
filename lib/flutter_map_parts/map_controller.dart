import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../my_widgets/my_button.dart';

class MyMapController extends StatefulWidget {
  const MyMapController({super.key});

  @override
  State<MyMapController> createState() => _MyMapControllerState();
}

class _MyMapControllerState extends State<MyMapController> {
  final _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Controller',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green[600],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(
                height: 56,
                width: 110,
                buttonText: 'Syria',
                onPressed: () {
                  _mapController.move(LatLng(34.963949048238895, 38.38966279578364), 6.0);
                },
              ),
              MyButton(
                height: 56,
                width: 110,
                buttonText: 'Gordon',
                onPressed: () {
                  _mapController.move(LatLng(31.820226302719377, 36.7356043874526), 6.0);
                },
              ),
              MyButton(
                height: 56,
                width: 110,
                buttonText: 'Egypt',
                onPressed: () {
                  _mapController.move(LatLng(26.9484349485732, 29.90890874143866), 6.0);
                },
              ),
            ],
          ),

          const SizedBox(height: 20,),
          MyButton(
            height: 56,
            width: 220,
            buttonText: 'Fit Bounds',
            onPressed: () {
              _mapController.move(LatLng(34.963949048238895, 38.38966279578364), 4.0);
            },
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: LatLng(33.51330035143343, 36.28575218791221),
                initialZoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
