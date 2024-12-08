import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class CustomMapView extends StatefulWidget{
    static const routeName = '/mapview-screen';


  const CustomMapView({super.key});

  @override
  State<StatefulWidget> createState() => _CustomMapView();

}

class _CustomMapView extends State<CustomMapView>{

  late LatLng latLng = const LatLng(-26.149302, 28.034762) ;
  late List<LatLng> routePositions= [];

  @override
  void initState(){
    super.initState();
    getRealTimeLocation();
}
  late Stream<Position> locationStream;

  Future<void> getRealTimeLocation() async{
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always){
      // Position position = await Geolocator.getCurrentPosition();

      locationStream = Geolocator.getPositionStream();
      //gets location every second or so

      locationStream.listen((Position position ) {
        setState(() {
          latLng = LatLng(position.latitude, position.longitude);

          routePositions.add(latLng);
          print(routePositions);
        });
      });

    }else{
      print("add in popup that says permission denied");
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlutterMap(
      options: MapOptions(
          initialCenter: latLng,
          initialZoom: 20.0),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        userAgentPackageName: "com.example.app",),
        const RichAttributionWidget(
            attributions: [
              TextSourceAttribution("OpenStreetMap contributors")
            ]
        ), MarkerLayer(markers:
          [Marker(point: latLng, child: const Icon(Icons.person_pin,size: 60,),)]
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: routePositions,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }

}