
import 'package:bmi2/src/components/button.dart';
import 'package:bmi2/src/screens/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi2/src/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


   bool ismalepressed=false;
   bool isfemalepressed=false;
   int height = 170;
   int weight= 60;
   int age =20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appB,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
              onTap: (){
    setState(() {
    isfemalepressed= false;
    ismalepressed = true;
    });
    },
                    child: ContainerBox(
                      color: ismalepressed?Colors.amber:containerbg,
                      widchild:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.male,size: 100,),
                      Text("Male".toUpperCase(),style: titles,)],)

                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isfemalepressed= true;
                        ismalepressed = false;
                      });
                    },
                    child: ContainerBox(
                      color: isfemalepressed?Colors.amber:containerbg,
                        widchild:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.female,size: 100,),
                            Text("Female".toUpperCase(),style: titles)],)

                    ),
                  ),
                ),



              ]
            ),
          ),
          Expanded(

              child: Row(children: [Expanded(child: ContainerBox(color: containerbg,
              widchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                Text("HEIGHT",style: titles,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(height.toString(),style: valueStyle,),
                  Text("cm",style: cmStyle,),  ],),


                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Colors.white,
                    activeTrackColor: Colors.black26,

                    thumbColor: Colors.amber,
                    overlayColor: Color(0x29EB1555),
                    thumbShape:
                    RoundSliderThumbShape(enabledThumbRadius: 13.0),
                    overlayShape:
                    RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],),

              )),],))

    ,Expanded(
    child: Row(
    children: [
    Expanded(
    child: ContainerBox(
      widchild: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Text("WEIGHT",style: titles,),
          Text(weight.toString(),style: valueStyle,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

           ElevatedButton(
             child: Icon(FontAwesomeIcons.minus,color: Colors.white,),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder()
            ,             primary: Colors.black,)
             ,
             onPressed: (){
             setState(() {
               weight--;
             });
           }, ),
            ElevatedButton(
              child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder()
                ,             primary: Colors.black,)
              ,
              onPressed: (){
                setState(() {
                  weight++;
                });
              }, ),




          ],)
        ],
      )

      ,

    color: containerbg,

    ),
    ),
    Expanded(
    child: ContainerBox(
      widchild: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Text("AGE",style: titles,),
          Text(age.toString(),style: valueStyle,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ElevatedButton(
                child: Icon(FontAwesomeIcons.minus,color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder()
                  ,             primary: Colors.black,)
                ,
                onPressed: (){
                  setState(() {
                    age--;
                  });
                }, ),
              ElevatedButton(
                child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder()
                  ,             primary: Colors.black,)
                ,
                onPressed: (){
                  setState(() {
                    age++;
                  });
                }, ),




            ],)
        ],
      )

      ,

      color: containerbg,

    ),
    ),

        ],
      ),

    ),
          SizedBox(height: 7,),
          GestureDetector(
            onTap: (){
              Calc n=new Calc(weight: weight,height: height);
              Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context)=>Results(BmiResult:n.calculateBMI() ,BmiText: n.getResult(),interText: n.getInterpretation(),
              )));

            },
            child: Container(alignment: Alignment.center,
              color: Colors.amber,
              child: Text("RESULT",style: titles,),
              height: 50,
              width: MediaQuery.of(context).size.width,

            ),
          )
        
        ] ));
  }
}








class ContainerBox extends StatelessWidget {
   ContainerBox({this.color,this.widchild}) ;

final Widget? widchild;
   final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
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
