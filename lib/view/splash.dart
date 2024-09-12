import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/images/logo.jpg"),
            image: AssetImage("assets/images/logo.jpg"),
            height: 230,
            width: 230,
          )
        ],
      ),
    ));
  }
}
