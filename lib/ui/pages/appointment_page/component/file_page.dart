import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilePage extends StatefulWidget {
  const FilePage({
    Key? key,
    required this.files,
     //this.onOpenedFile,
  }) : super(key: key);

  final List<PlatformFile> files;
  //final ValueChanged<PlatformFile> onOpenedFile;

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: widget.files.length,
      itemBuilder: (context,indext){
        final file=widget.files[indext];
        return buildFile(file);
      },
    );
  }

  Widget buildFile(PlatformFile file) {
    final kb=file.size/1024;
    final mb=kb/1024;
    final fileSize=mb>=1?'${mb.toStringAsFixed(2)} MB':"${kb.toStringAsFixed(1)}";
    final extension =  file.extension??'none';
    final color = Colors.deepPurple;
    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(300),
      child: Text(extension.toString(),style: TextStyle(
        fontSize: ScreenUtil().setSp(7),
        color: color,
      ),),
    );
  }
}
