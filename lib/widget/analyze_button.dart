import 'package:flutter/material.dart';
import 'package:submission/controller/home_controller.dart';

class AnalyzeButton extends StatelessWidget {
  const AnalyzeButton({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => controller.goToResultPage(context),
      child: const Text("Analyze"),
    );
  }
}
