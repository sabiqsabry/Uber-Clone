import 'package:flutter/material.dart';
import '../models/ride.dart';

class RideTypeCard extends StatelessWidget {
  final RideType type;
  final double fare;
  final int eta;
  final bool selected;
  final VoidCallback onTap;

  const RideTypeCard({
    super.key,
    required this.type,
    required this.fare,
    required this.eta,
    required this.selected,
    required this.onTap,
  });

  String get typeName {
    switch (type) {
      case RideType.basic:
        return 'Basic';
      case RideType.comfort:
        return 'Comfort';
      case RideType.xl:
        return 'XL';
    }
  }

  IconData get typeIcon {
    switch (type) {
      case RideType.basic:
        return Icons.directions_car;
      case RideType.comfort:
        return Icons.airline_seat_recline_extra;
      case RideType.xl:
        return Icons.airport_shuttle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? Colors.teal.withOpacity(0.1) : Colors.white,
          border: Border.all(
            color: selected ? Colors.teal : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (selected)
              BoxShadow(
                color: Colors.teal.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          children: [
            Icon(typeIcon, size: 32, color: Colors.teal),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    typeName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$fare | $eta min',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle, color: Colors.teal, size: 24),
          ],
        ),
      ),
    );
  }
}
