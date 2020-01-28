import 'package:GroupChat/views/login.dart';
import 'package:GroupChat/views/reg.dart';
import 'package:GroupChat/widgets/roundedbtn.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const String id = '/Splash';
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50,),
                Image.asset('./assets/name.png'),
                
                SizedBox(height: 30),
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      './assets/cht.jpg',
                    ),
                    height: 250,
                  ),
                ),
                
              ],
            ),
            SizedBox(
              height: 38.0,
            ),
            RoundedButton(
              title: 'Log In',
              color: Colors.redAccent,
              onPressed: () {
              Navigator.pushNamed(context, Login.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, Registration.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
