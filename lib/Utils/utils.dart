import 'dart:convert';

import 'package:flutter/material.dart';

import '../Pages/opt_page.dart';
import "package:http/http.dart" as http;

class ApiUtils {
  static Future<void> sendOTP(String phoneNumber, BuildContext ncontext) async {
    try {
      final response = await http.post(
        Uri.parse('https://apis.ab.apnibus.com/account/sales-app/otp/'),
        body: {
          'mobile': phoneNumber,
        },
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(ncontext).showSnackBar(
            SnackBar(
              content: Text(result['developer_message']),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.push(
            ncontext,
            MaterialPageRoute(
              builder: (context) => OtpPage(phoneNumber: phoneNumber),
            ),
          );
        } else {
          ScaffoldMessenger.of(ncontext).showSnackBar(
            SnackBar(
              content: Text(result['developer_message']),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        throw Exception('Failed to send OTP');
      }
    } catch (e) {
      print(e);

      ScaffoldMessenger.of(ncontext).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
