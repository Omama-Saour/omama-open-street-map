import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Circle extends StatefulWidget {
  const Circle({super.key});

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green[600],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(33.52373204903159, 36.282646113560695),
            initialZoom: 6.0,

          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                  point: LatLng(33.52373204903159, 36.282646113560695),
                  color: Colors.green.withOpacity(0.2),
                  borderColor: Colors.green,
                  borderStrokeWidth: 2,
                  radius: 50000,
                  useRadiusInMeter: true
                ),
                CircleMarker(
                    point: LatLng(35.53286385577686, 35.96404259435235),
                    color: Colors.purple.withOpacity(0.2),
                    borderColor: Colors.purple,
                    borderStrokeWidth: 2,
                    radius: 40000,
                    useRadiusInMeter: true
                ),
                CircleMarker(
                    point: LatLng(34.534357907501935, 38.91936489321593),
                    color: Colors.blue.withOpacity(0.2),
                    borderColor: Colors.blue,
                    borderStrokeWidth: 2,
                    radius: 30000,
                    useRadiusInMeter: true
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
