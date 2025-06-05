import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final String hintText;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onTap,
    this.hintText = 'Where to?',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.teal, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                controller.text.isEmpty ? hintText : controller.text,
                style: TextStyle(
                  color:
                      controller.text.isEmpty ? Colors.grey[500] : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
