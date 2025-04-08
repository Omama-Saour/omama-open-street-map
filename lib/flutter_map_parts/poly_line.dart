import 'package:flutter/material.dart';
import '../my_widgets/my_button.dart';
import '../my_widgets/my_input.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/plugin_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PolyLine extends StatefulWidget {
  const PolyLine({super.key});

  @override
  State<PolyLine> createState() => _PolyLineState();
}

class _PolyLineState extends State<PolyLine> {
  final startLatitude = TextEditingController();
  final startLongitude = TextEditingController();
  final endLatitude = TextEditingController();
  final endLongitude = TextEditingController();
  bool isVisible = false;
  List<LatLng> routPoints = [LatLng(33.51330035143343, 36.28575218791221)];
  LatLng? startLocation;
  LatLng? endLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poly Line', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green[600],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyInput(controler: startLatitude, hint: 'Enter Starting Latitude'),
                const SizedBox(height: 15),
                MyInput(controler: startLongitude, hint: 'Enter Starting Longitude'),
                const SizedBox(height: 15),
                MyInput(controler: endLatitude, hint: 'Enter Ending Latitude'),
                const SizedBox(height: 15),
                MyInput(controler: endLongitude, hint: 'Enter Ending Longitude'),
                const SizedBox(height: 15),
                MyButton(
                  height: 60,
                  width: 300,
                  buttonText: 'Get PolyLine',
                  onPressed: () async {
                    var v1 = double.parse(startLatitude.text);
                    var v2 = double.parse(startLongitude.text);
                    var v3 = double.parse(endLatitude.text);
                    var v4 = double.parse(endLongitude.text);

                    var url = Uri.parse('http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
                    var response = await http.get(url);
                    print(response.body);
                    setState(() {
                      routPoints = [];
                      var router = jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
                      for (int i = 0; i < router.length; i++) {
                        var reed = router[i].toString();
                        reed = reed.replaceAll("[", "");
                        reed = reed.replaceAll("]", "");
                        var lat1 = reed.split(',');
                        var long1 = reed.split(",");
                        routPoints.add(LatLng(double.parse(lat1[1]), double.parse(lat1[0])));
                      }
                      startLocation = LatLng(double.parse(startLatitude.text), double.parse(startLongitude.text));
                      endLocation = LatLng(double.parse(endLatitude.text), double.parse(endLongitude.text));
                      isVisible = !isVisible;
                      print(routPoints);
                    });
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 600,
                  width: MediaQuery.sizeOf(context).width * 0.94,
                  child: Visibility(
                    visible: isVisible,
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: routPoints[0],
                        initialZoom: 10,
                      ),
                      // nonRotatedChildren: [
                      //   AttributionWidget.defaultWidget(
                      //     source: 'OpenStreetMap contributors',
                      //     onSourceTapped: null,
                      //   ),
                      // ],
                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        PolylineLayer(
                          // polylineCulling: false,
                          polylines: [
                            Polyline(points: routPoints, color: Colors.green.shade800, strokeWidth: 3),
                          ],
                        ),
                        if (startLocation != null)
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: startLocation!,
                                child: Icon(Icons.location_on_outlined, color: Colors.green),
                              ),
                            ],
                          ),
                        if (endLocation != null)
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: endLocation!,
                                child: Icon(Icons.location_on, color: Colors.green),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}