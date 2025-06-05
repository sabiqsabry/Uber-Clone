import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onChanged;
  final int maxRating;

  const RatingStars({
    super.key,
    required this.rating,
    required this.onChanged,
    this.maxRating = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 28,
          ),
          onPressed: () => onChanged(index + 1),
          splashRadius: 18,
        );
      }),
    );
  }
}
