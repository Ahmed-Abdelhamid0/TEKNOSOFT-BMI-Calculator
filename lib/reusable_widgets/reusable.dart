import 'package:flutter/material.dart';


Color scaffoldAppBarColor=Color(0xff252734);
Color pinkColor=Color(0xffa780f7);
Color whiteColor=Colors.white;

Widget selectionText(String txt){
  return Text(
    txt,
    style: TextStyle(
      color: pinkColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );
}

AppBar appBarBMI({IconButton ? icn}){
  return AppBar(
    elevation: 0,
    backgroundColor: scaffoldAppBarColor,
    automaticallyImplyLeading: false,
    title: Text('BMI Calculator'),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 22,
      color: pinkColor,
    ),
    leading: icn,
  );
}

Widget appButton(String txt,{Function() ? onPressed}){
  return Container(
    width: double.infinity,
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      color: pinkColor,
      textColor: whiteColor,
    ),
  );
}

Widget txtResult(String txt){
  return Text(
    txt,
    style: TextStyle(
      color: whiteColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}
