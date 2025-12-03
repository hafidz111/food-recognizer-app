import 'dart:io';

import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';

class FirebaseMLService {
  Future<File?> loadModel() async {
    try {
      final instance = FirebaseModelDownloader.instance;
      final model = await instance.getModel(
        "food-predictor",
        FirebaseModelDownloadType.latestModel,
        FirebaseModelDownloadConditions(
          iosAllowsCellularAccess: true,
          iosAllowsBackgroundDownloading: false,
          androidChargingRequired: false,
          androidWifiRequired: false,
          androidDeviceIdleRequired: false,
        ),
      );

      return model.file;
    } catch (_) {
      return null;
    }
  }
}
