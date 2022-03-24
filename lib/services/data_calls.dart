import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:researchapp/env.dart';

class DataClass {
  Future<bool> addPatient(
      String name, String casename, String, String desc, File file) async {
    try {
      var response = await http.post(
        Uri.parse(SERVER_URL+"/file_upload"),
        body:jsonEncode({}),
        );
    } catch (e) {}
      return false;

  }
}
