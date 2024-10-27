import 'package:firebase_core/firebase_core.dart';
import 'package:geo_pulse/Service/Alert_Service.dart';
import 'package:geo_pulse/Service/Navigation_Services.dart';
import 'package:geo_pulse/firebase_options.dart';
import 'package:get_it/get_it.dart';
import 'package:geo_pulse/Service/Auth_Services.dart';

Future<void>setupFirebase() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> registerServices() async{
  final GetIt getIt=GetIt.instance;
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<AlertService>(AlertService());
}