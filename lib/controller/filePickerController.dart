import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FilePickerController extends GetxController {
  List<dynamic> files = [].obs;

  Future<void> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );

      if (result != null) {
        // add files to the list
        files.clear();
        files.addAll(result.files.map((file) {
          String base64String = base64Encode(file.bytes!.toList());
          return {
            'name': file.name,
            'bytes': base64String,
          };
        }).toList());
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }
}
