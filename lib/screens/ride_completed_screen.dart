import 'package:flutter/material.dart';
import '../models/ride.dart';
import '../widgets/rating_stars.dart';
import '../widgets/primary_button.dart';

class RideCompletedScreen extends StatefulWidget {
  final Ride ride;
  final VoidCallback onDone;
  const RideCompletedScreen(
      {super.key, required this.ride, required this.onDone});

  @override
  State<RideCompletedScreen> createState() => _RideCompletedScreenState();
}

class _RideCompletedScreenState extends State<RideCompletedScreen> {
  int _rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Trip Summary'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Fare',
                style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            Text(' 24${widget.ride.fare.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 16),
            Text('Distance',
                style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            Text('${widget.ride.distance.toStringAsFixed(2)} km',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 32),
            const Text('Rate your driver',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 12),
            RatingStars(
              rating: _rating,
              onChanged: (val) => setState(() => _rating = val),
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Done',
              onPressed: widget.onDone,
            ),
          ],
        ),
      ),
    );
  }
}
