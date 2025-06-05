import 'package:flutter/material.dart';
import '../models/ride.dart';
import '../widgets/ride_type_card.dart';
import '../widgets/primary_button.dart';

class SelectRideScreen extends StatefulWidget {
  final VoidCallback onConfirm;
  const SelectRideScreen({super.key, required this.onConfirm});

  @override
  State<SelectRideScreen> createState() => _SelectRideScreenState();
}

class _SelectRideScreenState extends State<SelectRideScreen> {
  RideType _selectedType = RideType.basic;

  double _mockFare(RideType type) {
    switch (type) {
      case RideType.basic:
        return 8.0;
      case RideType.comfort:
        return 12.0;
      case RideType.xl:
        return 16.0;
    }
  }

  int _mockEta(RideType type) {
    switch (type) {
      case RideType.basic:
        return 4;
      case RideType.comfort:
        return 6;
      case RideType.xl:
        return 8;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Ride'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            RideTypeCard(
              type: RideType.basic,
              fare: _mockFare(RideType.basic),
              eta: _mockEta(RideType.basic),
              selected: _selectedType == RideType.basic,
              onTap: () => setState(() => _selectedType = RideType.basic),
            ),
            RideTypeCard(
              type: RideType.comfort,
              fare: _mockFare(RideType.comfort),
              eta: _mockEta(RideType.comfort),
              selected: _selectedType == RideType.comfort,
              onTap: () => setState(() => _selectedType = RideType.comfort),
            ),
            RideTypeCard(
              type: RideType.xl,
              fare: _mockFare(RideType.xl),
              eta: _mockEta(RideType.xl),
              selected: _selectedType == RideType.xl,
              onTap: () => setState(() => _selectedType = RideType.xl),
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Confirm Ride',
              onPressed: widget.onConfirm,
            ),
          ],
        ),
      ),
    );
  }
}
