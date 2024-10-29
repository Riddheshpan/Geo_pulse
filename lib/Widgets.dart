import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geo_pulse/Service/Media_Service.dart';
import 'package:geo_pulse/const.dart';
import 'package:get_it/get_it.dart';
class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onEdit;

  const ProfilePicture({required this.imageUrl, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(imageUrl),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey,
            ),
            child: GestureDetector(
              onTap: onEdit,
              child: Icon(Icons.edit, size: 20,),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;
  final GetIt getIt = GetIt.instance;
  late MediaService mediaService;
  @override
  void initState() {
    super.initState();
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
              // Other widgets...
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
