import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhoneImages extends StatefulWidget {
  const PhoneImages({super.key});

  @override
  State<PhoneImages> createState() => _PhoneImagesState();
}

class _PhoneImagesState extends State<PhoneImages> {
  List<XFile> selectedImages = [];
  Future<void> _pickImages() async {
    final pickedImages = await ImagePicker().pickMultiImage();

    if (pickedImages != null) {
      setState(() {
        selectedImages = pickedImages;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickImages,
            child: Text('Pick Images'),
          ),
          Expanded(
              child: GridView.builder(
            itemCount: selectedImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Image.file(File(selectedImages[index].path));
            },
          )),
        ],
      ),
    );
  }
}
