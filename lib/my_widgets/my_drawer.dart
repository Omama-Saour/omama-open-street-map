import 'package:flutter/material.dart';
import 'package:omama_map/flutter_map_parts/map_controller.dart';
import 'package:omama_map/flutter_map_parts/marker.dart';
import 'package:omama_map/flutter_map_parts/poly_gon.dart';
import 'package:omama_map/flutter_map_parts/poly_line.dart';
import '../flutter_map_parts/Home.dart';
import '../flutter_map_parts/circle.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.green[50],
        width: 250,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8),
                    child: Text(
                      'Flutter Map',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.green[800],
                    thickness: 1.0,
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        title: const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                          );
                        },
                      ),
                      Divider(
                        color: Colors.green[400],
                        thickness: 1.0,
                      ),
                      ListTile(
                        title: const Text(
                          'Marker',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AddMarker()),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'PolyLine',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PolyLine()),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'PolyGon',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PolyGon()),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Circle',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Circle()),
                          );
                        },
                      ),
                      Divider(
                        color: Colors.green[400],
                        thickness: 1.0,
                      ),
                      ListTile(
                        title: const Text(
                          'Map Controller',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyMapController()),
                          );
                        },
                      ),
                      Divider(
                        color: Colors.green[400],
                        thickness: 1.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}