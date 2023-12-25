import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sampleapnibus/Pages/opt_page.dart';
import 'package:sampleapnibus/Utils/utils.dart';

class LoginDelegate extends StatefulWidget {
  const LoginDelegate({Key? key}) : super(key: key);

  @override
  State<LoginDelegate> createState() => _LoginDelegateState();
}

class _LoginDelegateState extends State<LoginDelegate> {
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 120),
            Image.asset(
              "assets/images/app_logo.png",
              fit: BoxFit.cover,
              scale: 4.5,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Enter Phone Number",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                maxLength: 10,
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () =>
                      ApiUtils.sendOTP(phoneNumberController.text, context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide(color: Colors.green),
                    ),
                  ),
                  child: Text(
                    "Send OTP",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
            ),
          ],
        ),)
      ,
    );
  }
}
