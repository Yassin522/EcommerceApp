import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants.dart';
import 'custom_verify_textfield.dart';



class Otpforsignup extends StatefulWidget {
  @override
  _OtpforsignupState createState() => _OtpforsignupState();
}

final TextEditingController _charA = TextEditingController();
final TextEditingController _charB = TextEditingController();
final TextEditingController _charC = TextEditingController();
final TextEditingController _charD = TextEditingController();
late String A, B, C, D;

GetStorage storage = GetStorage();



class _OtpforsignupState extends State<Otpforsignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Get.toNamed('/login'),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/illustration-3.png',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  "Enter your Teacher code number",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  padding: EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textFieldOTP(
                            first: true,
                            last: false,
                            controller: _charA,
                            onChange: (String value) {
                              setState(() {
                                A = value;
                              });
                            },
                          ),
                          textFieldOTP(
                            first: false,
                            last: false,
                            controller: _charB,
                            onChange: (String value) {
                              setState(() {
                                B = value;
                              });
                            },
                          ),
                          textFieldOTP(
                            first: false,
                            last: false,
                            controller: _charC,
                            onChange: (String value) {
                              setState(() {
                                C = value;
                              });
                            },
                          ),
                          textFieldOTP(
                            first: false,
                            last: true,
                            controller: _charD,
                            onChange: (String value) {
                              setState(() {
                                D = value;
                                print(D);
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (verifycode==
                                A + B + C + D) {
                              
                              print("broooooooo");
                
                              Get.offAllNamed(AppPages.signup);
                            } else {
                              showSnackBar("Wrong Code", context);
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(kPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              'Verify',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
