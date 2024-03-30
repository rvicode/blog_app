import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage(),))
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Assets.img.background.splash.image(fit: BoxFit.cover)),
              Center(child: Assets.img.icons.logo.svg(width: 100))
            ],
          ),
        ),
      ),
    );
  }
}
