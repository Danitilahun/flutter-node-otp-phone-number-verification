import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_verification/Provider/OTPProvider.dart';
import 'package:otp_verification/screens/OTPVerify.dart';
import 'package:otp_verification/screens/country_code_picker.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _phoneNumberController =
      TextEditingController(); // Added variable to store the selected dial code

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _callBackFunction(String name, String dialCode, String flag) {
    final otpProvider = Provider.of<OTPProvider>(context, listen: false);
    otpProvider.setDialCode(dialCode.substring(1));
  }

  @override
  Widget build(BuildContext context) {
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
                  'assets/lock.png',
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
                SizedBox(height: ScreenUtil().setHeight(16)),
                Text(
                  'We will send you a one-time password to this mobile number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(18),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                Text(
                  'Enter Mobile Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(60),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CountryPicker(
                          callBackFunction: _callBackFunction,
                          headerText: 'Select Country',
                          headerBackgroundColor: Theme.of(context).primaryColor,
                          headerTextColor: Colors.white,
                        ),
                      ),
                      // SizedBox(width: ScreenUtil().setWidth(16)),
                      Expanded(
                        flex: 5,
                        child: TextField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            hintText: '935660741',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 20.sp),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(100)),
                Container(
                  width: ScreenUtil()
                      .setWidth(0.6 * MediaQuery.of(context).size.width),
                  child: ElevatedButton(
                    onPressed: () {
                      final otpProvider =
                          Provider.of<OTPProvider>(context, listen: false);
                      otpProvider.setPhoneNumber(_phoneNumberController.text);
                      otpProvider.sendOTP();
                      // Perform action on button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OTPVerify()),
                      );
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
                      'Get OTP',
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
}
