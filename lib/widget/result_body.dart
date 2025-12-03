import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission/service/image_classification_service.dart';
import 'package:submission/widget/result_content.dart';

class ResultBody extends StatefulWidget {
  final String imagePath;
  const ResultBody({super.key, required this.imagePath});

  @override
  State<ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {
  Map<String, dynamic>? _inferenceResult;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(_runClassification);
  }

  Future<void> _runClassification() async {
    final service = context.read<ImageClassificationService>();
    final result = await service.inferenceImageFileIsolate(widget.imagePath);

    setState(() {
      _inferenceResult = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final foodName = _inferenceResult?['foodName'] ?? "Gagal Deteksi";
    final confidence =
        (_inferenceResult?['confidence'] as double? ?? 0.0) * 100;

    return ResultContent(
      imagePath: widget.imagePath,
      foodName: foodName,
      confidence: confidence,
    );
  }
}
