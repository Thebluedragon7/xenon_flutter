import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'initpage.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      loadingText: Text(
          '''The noble gases are the chemical elements in group 18 of the periodic table. They are the most stable due to having the maximum number of valence electrons their outer shell can hold. Therefore, they rarely react with other elements since they are already stable.'''),
      seconds: 5,
      navigateAfterSeconds: stppage(),
      title: Text('Welcome to Xenon World\nBy Milan Gurung'),
      image: Image.asset('images/noG.jpg'),
      photoSize: 130.0,
      gradientBackground: LinearGradient(
        colors: [Colors.white70, Colors.black],
      ),
    );
  }
}
