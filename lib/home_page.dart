import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_tream/trimmer_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Video Trimmer"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Video Trimmer"),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.video,
              allowMultiple: false,
            );
            if (result != null) {
              File file = File(result.files.single.path!);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return TrimmerView(file);
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
