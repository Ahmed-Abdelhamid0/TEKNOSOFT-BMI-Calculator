import 'package:bmi_calculator_app/features/gender_selection/gender_view.dart';
import 'package:bmi_calculator_app/reusable_widgets/reusable.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
   Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 7),
            ()=>Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context)=>GenderView())),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAppBarColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
                '\t\t\t\t\tBMI\nCalculator',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xffa780f7),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '( Body Mass Index )',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xffa780f7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
