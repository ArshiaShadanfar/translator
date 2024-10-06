import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class FilePickerController extends GetxController {
  RxList<dynamic> files = [].obs;

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
        files.addAll(result.files
            .map((file) => {
                  'name': file.name,
                  'bytes': file.bytes,
                })
            .toList());
        print(files);
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }
}
