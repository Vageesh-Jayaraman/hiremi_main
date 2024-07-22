import 'dart:convert';
import 'package:hiremi_version_two/API_Integration/Profile/createProfile.dart';
import 'package:http/http.dart' as http;


CreateProfile _apiService = CreateProfile();

class RegisterService {
  final String url = 'http://13.127.81.177:8000/api/registers/';

  Future<String?> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      var profile = {
        "register": responseData['id'].toString()
      };
      var profileId = await _apiService.createProfile(profile);
      return profileId;
    } else {
      return null;
    }
  }
}
