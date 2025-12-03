import 'dart:io';

import 'package:flutter/material.dart';
import 'package:submission/controller/home_controller.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => controller.pickFromGallery(),
        child:
            controller.isLoading
                ? const CircularProgressIndicator()
                : controller.imagePath != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(controller.imagePath!),
                    fit: BoxFit.cover,
                    width: 250,
                    height: 250,
                  ),
                )
                : const Icon(Icons.image, size: 100),
      ),
    );
  }
}
