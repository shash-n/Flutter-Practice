// import 'dart:typed_data';
// import 'package:pointycastle/export.dart' as pointy_castle;

import 'dart:convert';

import 'package:http/http.dart' as http;

class UserLoginModel {
  static const _baseURL =
      "https://e3-qkmountain.qkinnovations.com/qkm-andermatt-backend/api/";
  static const _postsEndpoint = _baseURL + "user/appLogin";
  static const int _deviceToken = 1;
  static const String? _deviceType = "A";
  static const int _categoryId = 2;

  static String _errorText = "";
  static String _email = "Placeholder@Email.com";
  static String _password = "PlaceholderPassword";

  static Future<bool> checkLogin(email, password) async {
    final url = Uri.parse(_postsEndpoint);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'device_token': _deviceToken,
          'device_type': _deviceType,
          'category_id': _categoryId,
        }));

    // final sha256Digest = pointy_castle.SHA256Digest();
    // final hashValue = sha256Digest
    //     .process(Uint8List.fromList(utf8.encode(passwordController.text)));

    switch (response.statusCode) {
      case 200:
        _email = email;
        _password = password;
        return true;
      default:
        _errorText = ":-|";
        return false;
    }
  }

  static String get getEmail {
    return _email;
  }

  static String get getPassword {
    return _password;
  }

  static String get getError {
    return _errorText;
  }
}
