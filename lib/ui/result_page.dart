import 'package:flutter/material.dart';
import 'package:submission/widget/result_body.dart';

class ResultPage extends StatelessWidget {
  final String imagePath;
  const ResultPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Result Page'),
        centerTitle: true,
      ),
      body: SafeArea(child: ResultBody(imagePath: imagePath)),
    );
  }
}
