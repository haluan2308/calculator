

import 'package:carlendar/widget/buttonwidget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String input = '';
  String output = '';

  final List<String> dataViews = [
    'C',
    '%',
    'D',
    '+',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '/',
    '~',
    '0',
    '.',
    '=',
  ];

  bool click = false;

  void toggle(){
    setState(() {
      if(click == false){
        click = true;
      }else{
        click = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text("Calculator"),
        actions: <Widget>[
          IconButton(
            icon: click ?   Icon(Icons.dark_mode) : Icon(Icons.light_mode),
            iconSize: 35,
            color: click ?   Colors.black : Colors.white ,
            onPressed: () {
              print("onclick");
              setState(() {
                toggle();
              });

            },
          ),
        ]
      ),
      backgroundColor: click ? Colors.white : Colors.black12,
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        input,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        output,
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Expanded(
            flex: 4,
              child: Container(
                child: GridView.builder(
                    itemCount: dataViews.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context ,int index){
                        if(index == 0){
                          return Buttonwidget(
                            buttonOntap: (){
                              setState(() {
                                input = '';
                                output = '0';
                              });
                            },
                            color: Colors.blue[100],
                            txtColor: Colors.black,
                            btntext: dataViews[index],
                          );
                        }
                        else if(index == 1) {
                          return Buttonwidget(
                            buttonOntap: (){
                              setState(() {

                              });
                            },
                            btntext: dataViews[index],
                            color: Colors.blue[50],
                            txtColor: Colors.black,
                          );
                        }
                        else if(index == 16){
                          return Buttonwidget(
                            buttonOntap: (){
                              setState(() {

                              });
                            },
                            btntext: dataViews[index],
                            color: Colors.blue[50],
                            txtColor: Colors.black,
                          );
                        }

                        else if(index == 2){
                          return Buttonwidget(
                            buttonOntap: (){
                              setState(() {
                                input = input.substring(0, input.length -1);
                              });
                            },
                            btntext: dataViews[index],
                            color: Colors.blue[50],
                            txtColor: Colors.black,
                          );
                        }
                        else if(index == 19){
                          return Buttonwidget(
                            buttonOntap: (){
                              setState(() {
                                AnswerButton();
                              });
                            },
                            btntext: dataViews[index],
                            color: Colors.blue[600],
                            txtColor: Colors.white,
                          );
                        }
                        else{
                          return Buttonwidget(
                            buttonOntap: () {
                              setState(() {
                                input += dataViews[index];
                              });
                            },
                            btntext: dataViews[index],
                            color: isOperator(dataViews[index])
                                ? Colors.blueAccent
                                : Colors.white,
                            txtColor: isOperator(dataViews[index])
                                ? Colors.white
                                : Colors.black,
                          );
                        }

                     }
                ),
              )
          )
        ],
      ),
    );
  }

  bool isOperator(String str){
    if (str == '/' || str == 'x' || str == '-' || str == '+' || str == '=') {
      return true;
    }
    return false;
  }
  void AnswerButton(){
    String finaluserinput = input;
    finaluserinput = input.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    output = eval.toString();
  }
}
