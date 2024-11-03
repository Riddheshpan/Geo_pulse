import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geo_pulse/Frontend/Components/Media_Service.dart';
import 'package:geo_pulse/Frontend/Employee%20Pages/my_home_page.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final GetIt getIt=GetIt.instance;
  getIt.registerSingleton<MediaService>(MediaService());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Geo locator",
      home: HomePage(),
    );
  }
}