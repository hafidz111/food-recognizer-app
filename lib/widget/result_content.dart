import 'package:flutter/material.dart';
import 'package:submission/widget/result_image_info.dart';

class ResultContent extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final double confidence;

  const ResultContent({
    super.key,
    required this.imagePath,
    required this.foodName,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ResultImage(imagePath: imagePath),
          const SizedBox(height: 12),
          ResultInfo(foodName: foodName, confidence: confidence),
        ],
      ),
    );
  }
}
