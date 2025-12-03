import 'package:flutter/material.dart';
import 'package:submission/service/image_service.dart';
import 'package:submission/ui/result_page.dart';

class HomeController extends ChangeNotifier {
  final ImageService _imageService = ImageService();
  String? _imagePath;
  String? get imagePath => _imagePath;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> pickFromGallery() async {
    _setLoading(true);
    try {
      _imagePath = await _imageService.pickImageFromGallery();
      if (_imagePath != null) {
        debugPrint("Image picked: $_imagePath");
      } else {
        debugPrint("Image not selected or permission denied");
      }
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  void setImagePath(String path) async {
    final cropped = await _imageService.cropImage(path);
    _imagePath = cropped ?? path;
    notifyListeners();
  }

  void goToResultPage(BuildContext context) async {
    if (_imagePath != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(imagePath: _imagePath!),
        ),
      );

      _imagePath = null;
      _isLoading = false;
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih gambar terlebih dahulu!')),
      );
    }
  }
}
