import 'dart:convert';
import 'dart:io';

import "package:http/http.dart " as http;
import 'package:researchapp/env.dart';
import 'package:researchapp/services/exceptions.dart';

class AuthService {
  Future<dynamic> login(String username, String password) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(SERVER_URL + "/login"),
          headers: {'X-API-Key': API_KEY, 'Content-Type': 'application/json'},
          body: jsonEncode({"user": username, "pw": password}));
      responseJson = _returnresponse(response);
    } on SocketException {
      throw InternetError("No internet Connection");
    }
    return responseJson;
  }

  _returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        throw ServerError(response.body);
      case 511:
        throw APIKeyError(response.body);
      case 401:
        {
          //api doesn't have username and password as parameters
          //password not found
          //password incorrect
          throw Exception("weird 401 error");
        }
      case 201:
        {
          var responseJson = json.decode(response.body.toString());
          print(responseJson);
          return responseJson;
        }
    }
  }
}
