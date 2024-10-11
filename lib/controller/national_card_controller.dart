import 'package:get/get.dart';
import 'package:dio/dio.dart';

class NationalCardController extends GetxController {
  var isLoading = false.obs;

  Future<Map<String, dynamic>?> processNationalCard(List<dynamic> files) async {
    isLoading.value = true;
    var dio = Dio();
    var url = 'https://your-api-url/document/national_card/process_images';

    var body = {'type': 'NATIONAL_CARD', 'files': files};

    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  Future<String?> getTranslatedFileLink({
    required String firstName,
    required String lastName,
    required String fatherName,
    required String nationalId,
    required String serialNumber,
    required String expirationDate,
    required String birthDate,
  }) async {
    isLoading.value = true;
    var dio = Dio();
    var url = 'https://your-api-url/document/national_card/get_translate';

    var body = {
      'first_name': firstName,
      'last_name': lastName,
      'father_name': fatherName,
      'national_id': nationalId,
      'serial_number': serialNumber,
      'expiration_date': expirationDate,
      'birth_date': birthDate,
    };

    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        return response.data['translated_file_link'];
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
    return null;
  }
}
