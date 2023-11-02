import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int Currentindex = 0;
  String result ='' ;
  double height = 0;
  double weight = 0;
  TextEditingController HeightController = TextEditingController();
  TextEditingController WeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('BMI Calculator' , style:TextStyle(color: Colors.black),
         ),
         elevation: 0.0,
         backgroundColor: Color(0xfffafafa),
         actions: [
           IconButton(onPressed: (){}, icon: Icon(Icons.settings , color: Colors.black,))
         ]

       ),

        body:
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      radioButton('MAN', Colors.blueAccent, 0),
                      radioButton('WOMAN', Colors.pink, 1),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Your Height in Cm :' , style: TextStyle(
                    fontSize: 18.0,
                  ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                      controller: HeightController,
                      textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         hintText: 'Your Height in Cm',
                         filled: true,
                         fillColor: Colors.grey[200],
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8.0),
                           borderSide: BorderSide.none,
                         )
                       ),
                  ),
                  Text('Your Weight in Kg :' , style: TextStyle(
                    fontSize: 18.0,
                  ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: WeightController,
                    decoration: InputDecoration(
                        hintText: 'Your Weight in Kg',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        )
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          height = double.parse(HeightController.value.text);
                          weight = double.parse(WeightController.value.text);
                          CalculateBmi(height, weight);
                        });

                      },
                      child: Text('Calculate', style: TextStyle(fontSize: 28.0),),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('Your BMI is : ',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 28.0,
                           fontWeight: FontWeight.bold,
                         ),),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(result ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
                ),
          ),
    );
  }
  void changeIndex(int index){
    print('index in change index');
   setState(() {
     Currentindex = index;
   });
  }
  void CalculateBmi (double height , double weight){
    double finalresult = weight /(height * height / 1000);
    String Bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = Bmi ;
    });
  }
  
 Widget radioButton(String value  , Color color , int index){
   print('start in radio button ');
    return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          height: 80.0,
          child: ElevatedButton(

              style: ElevatedButton.styleFrom(

                  backgroundColor : Currentindex == index ? color : Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )
              ),

            onPressed: () {
              print('onPressed in radio button ');
                changeIndex(index);
            },

            child: Text(value , style: TextStyle(
              color: Currentindex == index ? Colors.white : color ,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
             ),
            ),

          ),
        ),
    );
 }
}
