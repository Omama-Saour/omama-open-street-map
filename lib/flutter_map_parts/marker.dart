import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddMarker extends StatefulWidget {
  const AddMarker({super.key});

  @override
  State<AddMarker> createState() => _AddMarkerState();
}

class _AddMarkerState extends State<AddMarker> {
  List<Marker> _markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marker',
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
          const Text(
              "Tap anywhere on map to add marker.. "
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(33.51330035143343, 36.28575218791221),
                initialZoom: 10,
                onTap: (tapPosition, point) {
                  setState(() {
                    _markers.add(
                      Marker(
                        point: point,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    );
                  });
                },
              ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: _markers,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}