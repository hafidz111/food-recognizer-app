import 'dart:io';

import 'package:flutter/material.dart';

class ResultImage extends StatelessWidget {
  final String imagePath;
  const ResultImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(
        File(imagePath),
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ResultInfo extends StatelessWidget {
  final String foodName;
  final double confidence;

  const ResultInfo({
    super.key,
    required this.foodName,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          foodName,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${confidence.toStringAsFixed(2)}%",
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
