import 'dart:convert';
import 'package:http/http.dart' as http;

class OTPService {
  final String baseUrl = 'http://10.0.2.2:3000/auth/';

  Future<String> sendOTP(String phoneNumber) async {
    final url = baseUrl + 'send-otp';
    final response =
        await http.post(Uri.parse(url), body: {'phone': phoneNumber});
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final hashCode = jsonResponse['data'];
      return hashCode;
    } else {
      throw Exception('Failed to send OTP');
    }
  }

  Future<bool> verifyOTP(
      String phoneNumber, String otpCode, String hashCode) async {
    final url = baseUrl + 'verify-otp';
    final response = await http.post(Uri.parse(url), body: {
      'phone': phoneNumber,
      'otp': otpCode,
      'hash': hashCode,
    });
    if (response.statusCode == 200) {
      // final jsonResponse = json.decode(response.body);
      // final success = jsonResponse['message'];
      return true;
    } else {
      return false;
    }
  }
}
