import 'dart:math';

import 'package:bmi_calculator_app/features/bmi_result/result_view.dart';
import 'package:bmi_calculator_app/reusable_widgets/reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserData extends StatefulWidget {
  final String ? gender;
   UserData({super.key,required this.gender});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {

  GlobalKey<FormState> formState=GlobalKey();
  TextEditingController nameController =TextEditingController();
  TextEditingController weightController =TextEditingController();
  TextEditingController heightController =TextEditingController();
  TextEditingController ageController =TextEditingController();
  String ? name;     String ? bmi;    String ? age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAppBarColor,
      appBar: appBarBMI(icn: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios,color: whiteColor,size: 22,)
      ),),
      body: Padding(
        padding:  EdgeInsets.all(25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    'assets/images/fit.jpg',
                  ),
                ),
              ),
              SizedBox(height: 20),
              selectionText('Insert Your Data to Calculate BMI'),
              SizedBox(height: 20),
              Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(
                      'Name :',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      validator: (value)
                      {
                        if(value!.isEmpty){
                          return 'Enter Name';
                        }else{
                          return null;
                        }
                      },
                      style: TextStyle(
                        color: whiteColor,
                      ),
                     maxLength: 15,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(
                          color: whiteColor,
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: pinkColor,
                          )
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: whiteColor,
                          ),
                        )
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Text(
                          'Weight :',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: weightController,

                            validator: (value)
                            {
                              if(value!.isEmpty){
                                return 'Enter Weight';
                              }else{
                                return null;
                              }
                            },
                            style: TextStyle(
                              color: whiteColor,
                            ),
                            decoration: InputDecoration(
                                hintText: 'kg',
                                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
                                counterStyle: TextStyle(
                                  color: whiteColor,
                                ),

                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: pinkColor,
                                    )
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: whiteColor,
                                  ),
                                )
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Height :',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: heightController,

                            validator: (value)
                            {
                              if(value!.isEmpty){
                                return 'Enter Height';
                              }else{
                                return null;
                              }
                            },
                            style: TextStyle(
                              color: whiteColor,
                            ),
                            decoration: InputDecoration(
                                hintText: 'cm',
                                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
                                counterStyle: TextStyle(
                                  color: whiteColor,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: pinkColor,
                                    )
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: whiteColor,
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Text(
                          'Age :',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: ageController,
                            validator: (value)
                            {
                              if(value!.isEmpty){
                                return 'Enter Age';
                              }else{
                                return null;
                              }
                            },
                            style: TextStyle(
                              color: whiteColor,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Age',
                                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
                                counterStyle: TextStyle(
                                  color: whiteColor,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: pinkColor,
                                    )
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: whiteColor,
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 17),
                   appButton(
                 'Show Result',
                 onPressed: () {

                   if(formState.currentState!.validate())
                   {
                     double weight=double.parse(weightController.text);
                     double height=double.parse(heightController.text);
                     double bmiResult =weight / pow(height/100,2);
                     if(bmiResult<18.5){
                       bmi='Underweight';
                     }else if(bmiResult >=18.5 && bmiResult <25){
                       bmi='Normal weight';
                     }else if(bmiResult >=25 && bmiResult <30)
                     {
                       bmi='Overweight';
                     }else{
                       bmi='Obese';
                     }
                     Navigator.of(context).push(MaterialPageRoute(
                         builder: (context) =>ResultBmi(
                          name: nameController.text.toUpperCase(),
                           weight: double.parse(weightController.text),
                           height: double.parse(heightController.text),
                           age: ageController.text,
                           gender:'${widget.gender}',
                           bmi: bmi,
                           bmiResult: bmiResult)));}}
             ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


