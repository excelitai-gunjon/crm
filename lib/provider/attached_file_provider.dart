import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttachedFile extends ChangeNotifier{
  static List<PlatformFile> attachedfiles = [];
  static List<File> galleryList = [];

  void addAttachedFile()async{
    final result = await FilePicker.platform
        .pickFiles(withReadStream: true, allowMultiple: true);
    if (result == null) return;
    //files.add(result.files);
    attachedfiles=List.from(result.files);
    notifyListeners();
  }

  void removeAttachedFile(PlatformFile value){
    //files.removeAt(index);
    attachedfiles.remove(value);
    notifyListeners();
  }

  pickImageFromGallery()async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      galleryList.add(imageTemporary);
      notifyListeners();
    }on PlatformFile catch(e){
      print("Faild to pick image: $e");
    }
  }

  void removeGalleryFile(File value){
    //files.removeAt(index);
    galleryList.remove(value);
    notifyListeners();
  }
  pickImageFromCamera()async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      galleryList.add(imageTemporary);
      notifyListeners();
    }on PlatformFile catch(e){
      print("Faild to pick image: $e");
    }
  }

}