import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/login_screen.dart';
import 'package:myapp/services/page_navigate_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      navigateToNextScreen(context, LoginScreen());
    });
    super.initState();
  }

//
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: _height,
        width: _width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                child: TextLiquidFill(
                  text: 'NewsApp',
                  waveDuration: Duration(seconds: 2),
                  waveColor: Colors.amber,
                  loadDuration: Duration(seconds: 3),
                  boxBackgroundColor: Colors.blue,
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
