import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyAvatarWidget extends StatefulWidget {
  @override
  _MyAvatarWidgetState createState() => _MyAvatarWidgetState();
}

class _MyAvatarWidgetState extends State<MyAvatarWidget> {
  ImageProvider? _imageProvider;

  Future<void> _pickImage() async {
    final pickedImage =
        // ignore: deprecated_member_use
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageProvider = FileImage(File(pickedImage.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage:
          _imageProvider ?? NetworkImage("https://via.placeholder.com/150"),
      child: IconButton(
        icon: Icon(Icons.edit),
        onPressed: _pickImage,
      ),
    );
  }
}
