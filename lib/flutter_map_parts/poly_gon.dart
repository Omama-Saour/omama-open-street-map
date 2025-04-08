import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/plugin_api.dart';

class PolyGon extends StatefulWidget {
  const PolyGon({super.key});

  @override
  State<PolyGon> createState() => _PolyGonState();
}

class _PolyGonState extends State<PolyGon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poly Gon', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
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
            initialCenter: LatLng(34.8021, 38.9968),
            initialZoom: 6.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            PolygonLayer(
              polygons: [
                Polygon(
                  points: [
                    LatLng(37.3271116366717, 42.182304383039295),
                    LatLng(37.073335607716665, 42.35808563501631),
                    LatLng(36.61615651547413, 41.84172820733383),
                    LatLng(36.52792441929001, 41.38030242089416),
                    LatLng(36.040849424754576, 41.24846648191141),
                    LatLng(35.50603793516827, 41.24846648191141),
                    LatLng(34.832484310138426, 41.21550749716572),
                    LatLng(34.3984914867149, 40.98479460394588),
                    LatLng(34.344083029873744, 40.62224577174328),
                    LatLng(32.3249377633327, 36.84294885423744),
                    LatLng(32.51968677046303, 36.18376915932364),
                    LatLng(32.769459379996256, 35.78826134237535),
                    LatLng(33.34953934837735, 35.78826134237535),
                    LatLng(33.52373204903159, 35.89812462486098),
                    LatLng(33.82544456465246, 36.304618770057836),
                    LatLng(34.44380486359724, 36.49138635028341),
                    LatLng(34.67903809969415, 36.33757775480352),
                    LatLng(34.670002975293826, 35.931083609606674),
                    LatLng(35.192407295194485, 35.931083609606674),
                    LatLng(35.53286385577686, 35.79924767062392),
                    LatLng(36.00530732919033, 35.95305626610381),
                    LatLng(35.86297872237458, 36.172782831075075),
                    LatLng(36.20945528620035, 36.39250939604634),
                    LatLng(36.28033882412408, 36.66716760226043),
                    LatLng(36.85387915860306, 36.65618127401185),
                    LatLng(36.68666958373389, 37.01873010621444),
                    LatLng(36.642606482515525, 37.458183236156984),
                    LatLng(36.95051792660283, 38.183280900562174),
                    LatLng(36.72190189855257, 38.74358364123891),
                    LatLng(36.68666958373389, 39.18303677118145),
                    LatLng(37.01195157631268, 40.402519206772),
                    LatLng(37.10838990780333, 41.182548512420006),
                    LatLng(37.3271116366717, 42.182304383039295),
                  ],
                  isFilled: true,
                  color: Colors.green.withOpacity(0.1),
                  borderColor: Colors.green,
                  borderStrokeWidth: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}