import 'package:flutter/material.dart';
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