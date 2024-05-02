import 'package:bmi_calculator_app/reusable_widgets/reusable.dart';
import 'package:flutter/material.dart';

class ResultBmi extends StatefulWidget {
  final String ? name;
 final double ? weight;
 final double ? height;
 final String ? age;
 final String ? gender;
 final String ? bmi;
 final double bmiResult;

   ResultBmi({
     super.key,
     required this.name,
     required this.weight,
     required this.height,
     required this.age,
     required this.bmi,
     required this.bmiResult,
     required this.gender});

  @override
  State<ResultBmi> createState() => _ResultBmiState();
}

class _ResultBmiState extends State<ResultBmi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAppBarColor,
      appBar: appBarBMI(),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.all(25),
          child: Column(
            children:
            [
              SizedBox(height: 20),
              selectionText('Your BMI Result'),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(17),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:
                        [
                          txtResult('Gender : ${widget.gender}'),
                          SizedBox(height: 60),
                          Row(
                            children: [
                              txtResult('Name : ${widget.name!.toUpperCase()}'),
                              Spacer(),
                              txtResult('Age : ${widget.age}'),
                            ],
                          ),
                          SizedBox(height: 60),
                          Row(
                            children: [
                              txtResult('Weight : ${widget.weight!.toInt()}'),
                              Spacer(),
                              txtResult('Height : ${widget.height!.toInt()}'),
                            ],
                          ),
                          SizedBox(height: 60),
                          txtResult('BMI Result : ${widget.bmiResult.round()}'),
                          SizedBox(height: 60),
                          Center(child: txtResult('Your BMI is ${widget.bmi} ')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              appButton(
                  'Re-Calculate',
                onPressed: () {
                  Navigator.pop(context);
                }
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
