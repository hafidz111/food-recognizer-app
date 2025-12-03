import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission/controller/home_controller.dart';
import 'package:submission/widget/analyze_button.dart';
import 'package:submission/widget/image_preview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Food Classifier'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: ImagePreview(controller: controller)),
          AnalyzeButton(controller: controller),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
