import 'package:flutter/material.dart';
import 'package:otp_verification/Data/OTPService.dart';
import 'package:provider/provider.dart';

class OTPProvider with ChangeNotifier {
  OTPService _otpService = OTPService();
  String _phoneNumber = '';
  String _otpCode = '';
  String _dialCode = '';
  String _hash_Code = '';
  bool _isVerified = false;

  String get phoneNumber => _phoneNumber;
  String get otpCode => _otpCode;
  String get dialCode => _dialCode;
  String get hash_Code => _hash_Code;
  bool get isVerified => _isVerified;

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setOTPCode(String value) {
    _otpCode = value;
    notifyListeners();
  }

  void setDialCode(String value) {
    _dialCode = value;
    notifyListeners();
  }

  Future<void> sendOTP() async {
    try {
      _hash_Code = await _otpService.sendOTP(_dialCode + _phoneNumber);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> verifyOTP() async {
    try {
      _isVerified = await _otpService.verifyOTP(
          _dialCode + _phoneNumber, _otpCode, _hash_Code);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
