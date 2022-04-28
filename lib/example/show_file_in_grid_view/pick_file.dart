import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:shahid_mahamum_sir/example/show_file_in_grid_view/widget_show.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/provider/attached_file_provider.dart';

class pickFile extends StatefulWidget {
  const pickFile({Key? key}) : super(key: key);
  @override
  State<pickFile> createState() => _pickFileState();
}
class _pickFileState extends State<pickFile> {
  //List<PlatformFile> files = [];

  @override
  Widget build(BuildContext context) {
    final attachedFile=Provider.of<AttachedFile>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              attachedFile.addAttachedFile();
              // final result = await FilePicker.platform
              //     .pickFiles(withReadStream: true, allowMultiple: true);
              //
              // if (result == null) return;
              // //files.add(result.files);
              // setState(() {
              //   //files.add(result.files);
              //   files=List.from(result.files);
              // });
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Wrap(
          direction: Axis.horizontal,
          children: AttachedFile.attachedfiles.map((e){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      OpenFile.open(e.path.toString());
                    },
                    child: Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          border: Border.all(
                            width: 1,
                            color: Colors.orangeAccent,
                          )
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -15,
                            right: -15,
                            child: GestureDetector(
                              onTap: (){
                                attachedFile.removeAttachedFile(e);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                    shape: BoxShape.circle
                                ),
                                child: const Icon(Icons.cancel_outlined),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Text('${e.name}'+'${e.extension}'),
                ],
              ),
            );
          }).toList(),
        ),//buildShow(files: AttachedFile.files),
      ),
    );
  }
}