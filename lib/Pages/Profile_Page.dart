import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geo_pulse/Pages/EditProfilePage.dart';
import 'package:geo_pulse/Service/Alert_Service.dart';
import 'package:geo_pulse/Service/Auth_Services.dart';
import 'package:geo_pulse/Service/Media_Service.dart';
import 'package:geo_pulse/Service/Navigation_Services.dart';
import 'package:geo_pulse/Widgets.dart';
import 'package:geo_pulse/const.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   File? selectedImage;
  final GetIt getIt = GetIt.instance;
  late AuthService authService;
  late NavigationService navigationService;
  late AlertService alertService;
  late MediaService mediaService;

  @override
  void initState() {
    super.initState();
    authService = getIt<AuthService>();
    navigationService = getIt<NavigationService>();
    alertService = getIt<AlertService>();
    mediaService = getIt<MediaService>();
  }

  Future<void> pickImage() async {
    File? file = await mediaService.getImageFromGallery();
    if (file != null) {
      setState(() {
        selectedImage = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ProfilePicture(
                imageUrl: selectedImage != null ? selectedImage!.path : PLACEHOLDER_PFP,
                onEdit: pickImage,
              ),
              SizedBox(height: 10),
              ProfileInfoTile(title: 'Name'),
              ProfileInfoTile(title: 'Employee ID'),
              ProfileInfoTile(title: 'Email'),
              ProfileInfoTile(title: 'Phone number'),
              ProfileInfoTile(title: 'Designation'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Editprofilepage()),
                      );
                    },
                    child: const Text('Edit Profile'),
                  ),
                  SizedBox(width: 35),
                  LogoutButton(
                    onLogout: () async {
                      bool result = await authService.logout();
                      if (result) {
                        alertService.ShowToast(text: "Successfully logged out", icon: Icons.check);
                        navigationService.pushReplacementNamed("/login");
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoTile extends StatelessWidget {
  final String title;

  const ProfileInfoTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}

class LogoutButton extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutButton({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onLogout,
      child: const Text(
        'Logout',
        style: TextStyle(color: Color.fromRGBO(255, 0, 0, 1)),
      ),
    );
  }
}
