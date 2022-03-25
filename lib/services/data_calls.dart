import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:researchapp/env.dart';

class DataClass {
  Future<bool> addPatient(String name, String casename, String desc,
      String fileid, String jwt) async {
    try {
      var response = await http.post(
        Uri.parse(SERVER_URL + "/file_upload"),
        headers: {
          'X-API-Key': API_KEY,
          'Content-Type': 'application/json',
          'x-access-token': jwt
        },
        body: jsonEncode({
          "patient_name": name,
          "body_label": casename,
          "label": desc,
          "filee": fileid
        }),
      );
      print(response.body);
      return true;
    } on Exception {
      return false;
    }
  }
}
