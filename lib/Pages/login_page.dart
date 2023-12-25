import "package:flutter/material.dart";
import "package:flutter_gif/flutter_gif.dart";

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 50)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(color: Colors.green),
                      ),
                    ),
                    child: Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 50)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(color: Colors.white),
                      ),
                    ),
                    child: Text("Create New Account",
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 23)),
                  ),
                ),
              ),
              const _GifTickerWidget()
            ],
          )),
    );
  }
}

class _GifTickerWidget extends StatefulWidget {
  const _GifTickerWidget({
    super.key,
  });

  @override
  State<_GifTickerWidget> createState() => _GifTickerWidgetState();
}

class _GifTickerWidgetState extends State<_GifTickerWidget>
    with TickerProviderStateMixin {
  late FlutterGifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlutterGifController(vsync: this)
      ..repeat(min: 0, max: 40, period: const Duration(milliseconds: 2000));
  }

  @override
  Widget build(BuildContext context) {
    return GifImage(
        color: Colors.black,
        width: 180,
        height: 200,
        fit: BoxFit.cover,
        image: AssetImage("assets/gif/bus_moving_animated.gif"),
        controller: _controller);
  }
}
