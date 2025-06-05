import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../models/ride.dart';

class PastRidesScreen extends StatelessWidget {
  const PastRidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rideHistory = Provider.of<AppState>(context).rideHistory;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Rides'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: rideHistory.isEmpty
          ? const Center(child: Text('No past rides yet.'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: rideHistory.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final ride = rideHistory[index];
                return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.local_taxi, color: Colors.teal),
                    title: Text(
                      '${ride.pickup.latitude.toStringAsFixed(3)}, ${ride.pickup.longitude.toStringAsFixed(3)} → ${ride.dropoff.latitude.toStringAsFixed(3)}, ${ride.dropoff.longitude.toStringAsFixed(3)}',
                    ),
                    subtitle: Text(
                      'Fare: £${ride.fare.toStringAsFixed(2)} | ${ride.distance.toStringAsFixed(2)} km',
                    ),
                    trailing: Text(
                      ride.completedAt != null
                          ? '${ride.completedAt!.hour}:${ride.completedAt!.minute.toString().padLeft(2, '0')}'
                          : '',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
