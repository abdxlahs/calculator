import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'buttons.dart';

var userinput = '';
var answerinBIN = '';

class Bin extends StatefulWidget {
  @override
  _BinState createState() => _BinState();
}

class _BinState extends State<Bin> {
  final List<String> buttons = [
    'C',
    'DEL',
    '1',
    '0',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 127, 80, 1),
      body: Column(children: [
        Expanded(
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
                    answerinBIN,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Mybutton(
                      buttondata: () {
                        setState(() {
                          userinput = userinput.replaceAll(userinput, '');

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
      ]),
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
  answerinBIN = int.parse(finalinput, radix: 2).toRadixString(10);
}
