import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission/controller/home_controller.dart';
import 'package:submission/firebase_options.dart';
import 'package:submission/service/image_classification_service.dart';
import 'package:submission/ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final imageClassificationService = ImageClassificationService();
  await imageClassificationService.initHelper();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
        Provider<ImageClassificationService>(
          create: (context) => imageClassificationService,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Classifier',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
