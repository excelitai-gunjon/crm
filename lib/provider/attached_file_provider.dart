import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AttachedFile extends ChangeNotifier{
  static List<PlatformFile> files = [];

  void addFile()async{
    final result = await FilePicker.platform
        .pickFiles(withReadStream: true, allowMultiple: true);

    if (result == null) return;
    //files.add(result.files);
    files=List.from(result.files);
    notifyListeners();
  }

  void removefile(PlatformFile value){
    //files.removeAt(index);
    files.remove(value);
    notifyListeners();
  }
}