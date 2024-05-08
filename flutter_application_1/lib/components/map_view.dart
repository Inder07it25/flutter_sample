import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMapView extends StatefulWidget {
  const AppMapView({Key? key}) : super(key: key);

  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends State<AppMapView> {
  Position? _currentPosition;
  final LatLng _destinationLatLng =
      const LatLng(37.7749, -122.4194); // Test destination LatLng

  // Google Maps controller
  late GoogleMapController? _mapController; // Change to nullable

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildMap(),
        _buildNavigator(),
      ],
    );
  }

  Widget _buildMap() {
    if (_currentPosition != null) {
      return GoogleMap(
        initialCameraPosition: CameraPosition(
          target:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          zoom: 12,
        ),
        onMapCreated: (controller) {
          // ignore: avoid_print
          print('Map created, controller initialized.');
          setState(() {
            _mapController = controller;
          });
        },
        markers: {
          Marker(
            markerId: const MarkerId('Destination'),
            position: _destinationLatLng,
            icon: BitmapDescriptor.defaultMarker,
          ),
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _buildNavigator() {
    return Positioned(
      bottom: 16,
      left: 16,
      child: ElevatedButton.icon(
        onPressed: () {
          _navigateToDestination();
        },
        icon: const Icon(Icons.navigation),
        label: const Text('Navigate to Destination'),
      ),
    );
  }

  void _navigateToDestination() {
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(_destinationLatLng),
      );
    }
  }
}
