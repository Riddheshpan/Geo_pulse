import 'package:flutter/material.dart';
import 'package:geo_pulse/Pages/Profile_Page.dart';
import 'package:geo_pulse/Service/Alert_Service.dart';
import 'package:geo_pulse/Service/Auth_Services.dart';
import 'package:geo_pulse/Service/Navigation_Services.dart';
import 'package:get_it/get_it.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GetIt getIt=GetIt.instance;
  late AuthService authService;
  late NavigationService navigationService;
  late AlertService alertService;
  @override
  void initState() {
    super.initState();
    authService=getIt.get<AuthService>();
    navigationService=getIt.get<NavigationService>();
    alertService=getIt.get<AlertService>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        actions: [ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Text('Profile Page'),)],
      ),
    );
  }
} 