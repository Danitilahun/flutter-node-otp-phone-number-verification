import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ok.png',
                    width: ScreenUtil().setWidth(250),
                    height: ScreenUtil().setWidth(250),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(16)),
                  Text(
                    'Verified',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(24),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(16)),
                  Text(
                    'Your account has been verified successfully.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  Container(
                    width: ScreenUtil()
                        .setWidth(0.6 * MediaQuery.of(context).size.width),
                    child: ElevatedButton(
                      onPressed: () {
                        // Perform action on button press
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
                        'Done',
                        style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
