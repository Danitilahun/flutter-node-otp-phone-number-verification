import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_verification/Provider/OTPProvider.dart';
import 'package:otp_verification/screens/VerificationSuccessScreen.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OTPProvider>(context, listen: false);
    final String phoneNumber = Provider.of<OTPProvider>(context).phoneNumber;
    final String dialCode = Provider.of<OTPProvider>(context).dialCode;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/message.png',
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setWidth(200),
                ),
                SizedBox(height: ScreenUtil().setHeight(16)),
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(24),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                Text(
                  'Enter the OTP sent to $dialCode$phoneNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                OTPTextField(
                  length: 4,
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Colors.grey,
                    borderColor: Colors.white,
                    focusBorderColor: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 50,
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    final otpProvider =
                        Provider.of<OTPProvider>(context, listen: false);
                    otpProvider.setOTPCode(pin);
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    final otpProvider =
                        Provider.of<OTPProvider>(context, listen: false);
                    otpProvider.sendOTP();
                  },
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(
                        color: const Color.fromRGBO(143, 130, 244, 1),
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(100)),
                Container(
                  width: ScreenUtil()
                      .setWidth(0.6 * MediaQuery.of(context).size.width),
                  child: ElevatedButton(
                    onPressed: () async {
                      final otpProvider =
                          Provider.of<OTPProvider>(context, listen: false);
                      // otpProvider.verifyOTP();
                      await otpProvider.verifyOTP();
                      _handleButtonPress(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(143, 130, 244, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(16),
                      ),
                    ),
                    child: Text(
                      'Verify',
                      style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleButtonPress(BuildContext context) {
    bool isVerified =
        Provider.of<OTPProvider>(context, listen: false).isVerified;
    if (isVerified) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerificationSuccessScreen()),
      );
      // Perform verification and navigate to OTP login page if successful
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'cancle',
                  style: TextStyle(
                      color: const Color.fromRGBO(
                          143, 130, 244, 1), // Set the text color to white
                      fontSize: ScreenUtil().setSp(16),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ], // Set the background color to black
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10), // Add a border radius of 8.0
                  child: Image.asset(
                    'assets/wrong.png',
                    width: ScreenUtil().setWidth(120),
                    height: ScreenUtil().setWidth(120),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(16)),
                Center(
                  child: Text(
                    'Your OTP is invalid or has expired. Please enter a valid OTP or click "Resend" to request a new OTP. The OTP expires after 3 minutes.',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white, // Set the text color to white
                      fontSize: ScreenUtil().setSp(18),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
