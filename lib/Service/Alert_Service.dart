import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:geo_pulse/Service/Navigation_Services.dart';
import 'package:get_it/get_it.dart';

class AlertService {
  final GetIt getIt=GetIt.instance;

  late NavigationService navigationService;

  AlertService(){
    navigationService=getIt.get<NavigationService>();
  }

  void ShowToast({
    required String text,
    IconData icon =Icons.info
  }){
    try {
      DelightToastBar(autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context){
          return ToastCard(
            leading: Icon(icon,size: 28,),
            title: Text(text,style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14
          ),));
        }
      ).show(navigationService.navigatiorKey!.currentContext!);
    } catch (e) {
      print(e);
    }
  }
}