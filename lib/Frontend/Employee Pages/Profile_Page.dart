import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geo_pulse/Frontend/Components/ProfileInfo_tile.dart';
import 'package:geo_pulse/Frontend/Components/Profile_piture.dart';
import 'package:geo_pulse/Frontend/Components/const.dart';
import 'package:geo_pulse/Frontend/Components/my_button.dart';
import 'package:geo_pulse/Frontend/Employee%20Pages/EditProfilePage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
   File? selectedImage;
  final GetIt getIt = GetIt.instance;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Profile page',
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.inversePrimary,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ProfilePicture(
                imageUrl: selectedImage != null ? selectedImage!.path : PLACEHOLDER_PFP,
                onEdit:() {
                  Editprofilepage();
                },
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
                  MyButton(
                    text: "Edit Profile", 
                    ontap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Editprofilepage()),
                      );
                    }
                  ),
                  SizedBox(width: 35),
                  MyButton(
                    text: "Logout",
                    ontap: () {
                      
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


