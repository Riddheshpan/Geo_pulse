import 'package:flutter/material.dart';
import 'package:geo_pulse/Pages/EditProfilePage.dart';
import 'package:geo_pulse/Pages/Home_page.dart';
import 'package:geo_pulse/Pages/login_page.dart';


class NavigationService {
  late GlobalKey<NavigatorState> navigatiorKey;
  final Map<String, Widget Function(BuildContext)> routes={
    "/login":(context)=>LoginPage(),
    "/home":(context)=>Homepage(),
    "/edit_profile":(context)=>Editprofilepage(),
  };

  GlobalKey<NavigatorState>? get navigatorKey{
    return navigatiorKey;
  }

  Map<String, Widget Function(BuildContext)>get route{
    return routes;
  }
  NavigationService(){
  navigatiorKey=GlobalKey<NavigatorState>();
}
void pushNamed(String routeName){
  navigatiorKey.currentState?.pushNamed(routeName);
}

void pushReplacementNamed(String routeName){
  navigatiorKey.currentState?.pushReplacementNamed(routeName);
}
void goBack(){
    navigatiorKey.currentState?.pop();
}
}