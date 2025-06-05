import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/ride.dart';
import '../models/driver.dart';
import '../widgets/primary_button.dart';

class RideTrackingScreen extends StatelessWidget {
  final Ride ride;
  final Driver driver;
  final LatLng driverPosition;
  final int eta;
  final VoidCallback? onCancel;

  const RideTrackingScreen({
    super.key,
    required this.ride,
    required this.driver,
    required this.driverPosition,
    required this.eta,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Ride'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: driverPosition,
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('driver'),
                  position: driverPosition,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure),
                ),
                Marker(
                  markerId: const MarkerId('pickup'),
                  position: ride.pickup,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                ),
                Marker(
                  markerId: const MarkerId('dropoff'),
                  position: ride.dropoff,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                ),
              },
              polylines: {}, // TODO: Add route polyline
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.teal.withOpacity(0.1),
                      child: const Icon(Icons.person, color: Colors.teal),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(driver.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(driver.carModel + ' • ' + driver.carPlate,
                            style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                    const Spacer(),
                    Text('$eta min',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.teal)),
                  ],
                ),
                const SizedBox(height: 16),
                if (onCancel != null)
                  PrimaryButton(
                    label: 'Cancel Ride',
                    color: Colors.red,
                    onPressed: onCancel!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
