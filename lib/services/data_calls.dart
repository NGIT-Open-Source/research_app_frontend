import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:researchapp/env.dart';
import 'package:researchapp/services/exceptions.dart';

class DataClass {
  Future<bool> add(String name, String casename, String desc,
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

  Future<dynamic> getData(String JWT) async {
    var responseJson;
    print("in d class");
    try {
      final response = await http.get(Uri.parse(SERVER_URL + "/get_Data"),
          headers: {
            'X-API-Key': API_KEY,
            'Content-Type': 'application/json',
            'x-access-token': JWT
          });
      responseJson = _returnresponse(response);
      print(response.statusCode);
    } on SocketException {
      throw InternetError("Internet Error");
    }
    return responseJson;
  }

  _returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 511:
        throw APIKeyError(response.body);
      case 401:
        throw ServerError(["server error"]);
      case 200:
        {
          //sucess
          var responseJson = json.decode(response.body.toString());
          print(responseJson);
          return responseJson;
        }
      default:
        throw ServerError(["unknown server error"]);
    }
  }
}
