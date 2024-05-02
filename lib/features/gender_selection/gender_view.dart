import 'package:bmi_calculator_app/features/user_data/data_view.dart';
import 'package:bmi_calculator_app/reusable_widgets/reusable.dart';
import 'package:flutter/material.dart';

class GenderView extends StatefulWidget {
   GenderView({super.key});

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {

  String ? gender;
  String ? genderTxt='Select Gender';
  Color ? color;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>onBackButtonPressed(context),
      child: Scaffold(
       backgroundColor:  scaffoldAppBarColor,
        appBar: appBarBMI(),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding:  EdgeInsets.only(right: 17,left: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: selectionText('Select Your Gender'),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.8,

                      ),
                       itemCount: 2,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                                    setState(() {
                                       gender=index==0?'Male':'Female';

                                    });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:  index.isEven?Colors.blueAccent:pinkColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                Image.asset(
                                    index==0?'assets/images/male.png':'assets/images/female.png'
                                ),
                                SizedBox(height: 8),
                                Text(
                                    index==0?'Male':'Female',
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Gender : ${gender==null?'$genderTxt':gender}',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                appButton('Continue',
                  onPressed: (){
                  if(gender!=null){
                    Navigator
                        .of(context)
                        .push(MaterialPageRoute(builder: (context)=>UserData(gender: gender,)));
                  }else{
                    setState(() {
                      genderTxt='Select Gender to Continue';
                    });
                  }

                  }
                ),

                SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool>onBackButtonPressed(BuildContext context) async{
    bool exitApp=await showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: scaffoldAppBarColor,
            title: Text('BMI Calculator',style: TextStyle(color: pinkColor)),
            content: Text('Do You Want to Close the App ?',style: TextStyle(color: pinkColor),textAlign: TextAlign.center,),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No',style: TextStyle(color: pinkColor)),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes',style: TextStyle(color: pinkColor)),
                  ),
                ],
              ),
            ],
          );
        },
    );
    return exitApp ?? false;
}
}
