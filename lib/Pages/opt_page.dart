import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:pinput/pinput.dart";
import "package:http/http.dart" as http;
import "package:sampleapnibus/Utils/utils.dart";

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late String otp;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 60,
        textStyle: const TextStyle(fontSize: 25, color: Colors.black),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)));
    return Scaffold(
        body: SingleChildScrollView(
      child: Material(
          color: Colors.white,
          child: Column(children: [
            const SizedBox(
              height: 120,
            ),
            Image.asset(
              "assets/images/app_logo.png",
              fit: BoxFit.cover,
              scale: 4.5,
            ),
            SizedBox(
              height: 50,
            ),
            Text("Please type in the OTP sent to",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Text(
              "+91 - ${widget.phoneNumber}",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(
                            color: Colors.green.shade700, width: 2))),
                onChanged: (pin) => otp = pin,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive OTP?",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {
                      ApiUtils.sendOTP(widget.phoneNumber, context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Wait for 30 seconds"),
                      ));
                    },
                    child: Text("Resend it",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Verifying OTP")));
                    final response = await verifyOtpAndLogin(widget.phoneNumber, otp);
                    if(response == 200){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Login Successful")));
                    }
                    else{
                      print(response);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Login Failed")));
                    }
                  },
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
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
            ),
          ])),
    ));
  }
}

Future<http.Response> verifyOtpAndLogin(String phoneNumber, String otp) async {
  final response = await http.put(
    Uri.parse('https://apis.ab.apnibus.com/account/sales-app/otp/verify/'),
    body: {
      'mobile': phoneNumber,
      'otp': otp,
    },
  );
  return response;
}
