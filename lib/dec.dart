import 'package:calculator/HEX.dart';
import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'bincal.dart';

var userinput = '';
var answer = '';
var anwerinHEX = '';
var answerinBIN = '';

class deci extends StatefulWidget {
  @override
  _deciState createState() => _deciState();
}

class _deciState extends State<deci> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 127, 80, 1),
      appBar: AppBar(
        title: const Text(
          "Conversion",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(255, 127, 80, 1),
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Hex()));
                },
                child: const Card(
                  color: Color.fromRGBO(255, 127, 80, 1),
                  elevation: 20,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "HEX",
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Bin()));
                },
                child: const Card(
                  color: Color.fromRGBO(255, 127, 80, 1),
                  elevation: 20,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "BIN",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userinput,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            anwerinHEX,
                            style: const TextStyle(
                                color: Colors.purple,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 50),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            answerinBIN,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Mybutton(
                        buttondata: () {
                          setState(() {
                            userinput = userinput.replaceAll(userinput, '');
                            answer = '';
                            anwerinHEX = '';
                            answerinBIN = "";
                          });
                        },
                        buttonstext: buttons[index],
                        textcolor: Colors.white,
                        Color: Colors.green,
                      );
                    } else if (index == 1) {
                      return Mybutton(
                          buttondata: () {
                            setState(() {
                              userinput =
                                  userinput.substring(0, userinput.length - 1);
                            });
                          },
                          buttonstext: buttons[index],
                          textcolor: Colors.white,
                          Color: Colors.red);
                    } else if (index == buttons.length - 1) {
                      return Mybutton(
                          buttondata: () {
                            setState(() {
                              parsing();
                            });
                          },
                          buttonstext: buttons[index],
                          textcolor: Colors.white,
                          Color: Color.fromARGB(255, 1, 75, 67));
                    } else {
                      return Mybutton(
                          buttondata: () {
                            setState(() {
                              userinput += buttons[index];
                            });
                          },
                          buttonstext: buttons[index],
                          textcolor: Colors.white,
                          Color: boolcheck(buttons[index])
                              ? Color.fromARGB(255, 1, 75, 67)
                              : Colors.teal);
                    }
                  })),
        ],
      ),
    );
  }
}

bool boolcheck(String x) {
  if (x == 'C' ||
      x == 'DEL' ||
      x == '%' ||
      x == '/' ||
      x == 'X' ||
      x == '-' ||
      x == '+' ||
      x == '=') {
    return true;
  } else {
    return false;
  }
}

void parsing() {
  String finalinput = userinput;
  finalinput = finalinput.replaceAll('X', '*');
  Parser p = Parser();
  Expression exp = p.parse(finalinput);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  int forintval = eval.round(); //as RADIX required int val
  answer = eval.toString();
  anwerinHEX = "HEX : " + forintval.toRadixString(16).toUpperCase();
  answerinBIN = "BIN :" + forintval.toRadixString(2);
}
