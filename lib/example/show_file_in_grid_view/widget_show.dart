import 'dart:io';

import 'package:file_picker/src/platform_file.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../provider/attached_file_provider.dart';

Widget buildShow({
  required List<PlatformFile> files,
  //required BuildContext context,
}){
  return Wrap(
    direction: Axis.horizontal,
    children: files.map((e){
      return Column(
        children: [
          Container(
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
                  top: -5,
                  right: -5,
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text('${e.name}'+'${e.extension}'),
        ],
      );
    }).toList(),
  );
  //   ListView.builder(
  //   scrollDirection: Axis.vertical,
  //   itemCount: files.length,
  //   itemBuilder: (context, index) {
  //     final file = files[index];
  //     return buildFile(file,context,index);
  //   },
  // );
}


Widget buildFile(PlatformFile file,BuildContext context,int index){
  final attachedFile=Provider.of<AttachedFile>(context);
  final kb = file.size / 1024;
  final mb = kb / 1024;
  final size =
  (mb >= 1) ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
  return Container(
    color: Colors.amber,
    child: InkWell(
      onTap: () {
        OpenFile.open(file.path.toString());
      },
      child: Container(
        height: 100,
        width: 200,
        color: Colors.white,
        child: ListTile(
          leading: (file.extension == 'jpg' || file.extension == 'png')
              ? Image.file(
            File(file.path.toString()),
            width: 80,
            height: 80,
          )
              : const SizedBox(
            width: 80,
            height: 80,
          ),
          title: Text('${file.name}'),
          subtitle: Text('${file.extension}'),
          trailing:
          // Text(
          //   '$size',
          //   style: const TextStyle(fontWeight: FontWeight.w700),
          // ),
          IconButton(
            onPressed:(){
              //attachedFile.removefile(index);
          }, icon: const Icon(Icons.delete_outline),
          ),
        ),
      ),
    ),
  );}