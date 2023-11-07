import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visioneducation/main.dart';

import 'cutom_Widgets/dashboard_widget.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageNavigator();
  }
  pageNavigator(){
    Timer(const Duration(seconds: 3),(){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (appContext) => MyApp(title: "Vision Education")));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.fromLTRB(0,370,0,0),
              child: Center(
                child:   Image.asset(
                  DataClass.visionLogo,
                  height: 80,
                  width: 270,
                ), //
              ),
            )
          ],
        ),
      ),
    );
  }
}
