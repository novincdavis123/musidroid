import 'package:flutter/material.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:musidroid/demo.dart';

void main() {
  runApp(MaterialApp(useInheritedMediaQuery: true,
    theme: ThemeData(primarySwatch: Colors.blue),
    debugShowCheckedModeBanner: false,
    home: MusiSplash(),
  ));
}
class MusiSplash extends StatelessWidget {
  const MusiSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
  theme: FlameSplashTheme.dark,
  showBefore: (BuildContext context) {
    return Text("To be shown before flame animation",style: TextStyle(color: Colors.amber),);
  },
  onFinish: (BuildContext context) =>  Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Darkmode()))
)
    );
  }
}