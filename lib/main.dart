import 'package:flutter/material.dart';
import 'package:geo_pulse/Service/Auth_Services.dart';
import 'package:geo_pulse/Service/Navigation_Services.dart';
import 'package:geo_pulse/Utility.dart';
import 'package:get_it/get_it.dart';

void main() async {
    
  await setup();
  runApp( MyApp());
}

Future<void>setup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
  await registerServices();
}

class MyApp extends StatelessWidget {

  final GetIt getIt=GetIt.instance;

  late NavigationService navigationnService;
  late AuthService authService;
  MyApp({super.key}){
    navigationnService=getIt.get<NavigationService>();
    authService = getIt.get<AuthService>();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationnService.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute:authService.user!=null?"/home": "/login",
      routes: navigationnService.route,
    );
  }
}