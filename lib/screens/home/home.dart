import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/core/api_service.dart';
import 'package:restaurant_app/core/location_service.dart';
import 'package:restaurant_app/screens/panel/panel_screen.dart';
import 'package:restaurant_app/widgets/appbar.dart';
import 'package:restaurant_app/widgets/icon_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiService = ApiService();
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  @override
  void initState() {
    super.initState();
    checkStatus();
    _fetchLocation();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-12.046093, -77.030690),
    zoom: 12,
  );

  checkStatus() async {
    final response = await apiService.checkApiStatus();
    if (response) {
      debugPrint('En el 200');
      // List<PhotoType> typesPhotos = await apiService.getPhotoTypes();
      // print(typesPhotos);
    }
  }

  Future<void> _fetchLocation() async {
    try {
      Position? position = await LocationService.getCurrentLocation();
      if (position != null) {
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
        });

        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(_currentPosition!, 15),
        );
      }
    } catch (e) {
      debugPrint("Error obteniendo ubicación: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(),
      body: Column(
        children: [
          IconTextWidgets(label: 'Home'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text("Total: 8")),
              SizedBox(width: 20),
              Flexible(child: Text("Pendientes: 5")),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PanelScreen()),
              );
            },
            child: Text('next'),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition:_initialPosition,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
