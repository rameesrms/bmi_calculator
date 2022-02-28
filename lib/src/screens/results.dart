

import 'package:bmi2/src/constants.dart';
import 'package:bmi2/src/screens/home.dart';

import 'package:flutter/material.dart';


class Results extends StatelessWidget {
Results({required this.BmiText,required this.BmiResult,required this.interText});

late final String BmiText;
late final String BmiResult;
late final String interText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appB,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          Expanded( flex:2,child: ContainerBoxn(color: containerbg,
          widchild:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [


              Text(BmiText,style: TextStyle( fontSize:20,
                  fontWeight: FontWeight.w500
                  ,color: BmiText.toLowerCase()=="normal"?Colors.green:Colors.red

              ),),
              Text(BmiResult,style: TextStyle( fontSize:70,
                  fontWeight: FontWeight.w500
                  ,color: Colors.black

              ),),
              Text(interText,style: TextStyle( fontSize:10,
                  fontWeight: FontWeight.w500
                  ,color: Colors.green

              ),)
,


              ElevatedButton(

                style: ElevatedButton.styleFrom(

                  elevation: 5,),
                child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.refresh_sharp,size: 50,),
                ) ,




                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>HomePage()));

                },)

            ],),)),

        ],),
      ),
    );
  }
}






class ContainerBoxn extends StatelessWidget {
  ContainerBoxn({this.color,this.widchild}) ;

  final Widget? widchild;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(19),
      child: widchild,




      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,3)
          )],
          color:color,borderRadius: BorderRadius.circular(10)),

    );
  }
}
