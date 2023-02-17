import 'package:flutter/material.dart';

import 'buttons.dart';

var answerinHex = '';
var userinput = '';

class Hex extends StatefulWidget {
  @override
  _HexState createState() => _HexState();
}

class _HexState extends State<Hex> {
  final List<String> buttons = [
    'C',
    'DEL',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
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
                    answerinHex,
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
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Mybutton(
                      buttondata: () {
                        setState(() {
                          userinput = userinput.replaceAll(userinput, '');

                          answerinHex = "";
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
  if (x == 'A' ||
      x == 'B' ||
      x == 'C' ||
      x == 'D' ||
      x == 'E' ||
      x == 'F' ||
      x == '=') {
    return true;
  } else {
    return false;
  }
}

void parsing() {
  String finalinput = userinput;
  answerinHex = int.parse(finalinput, radix: 16).toRadixString(10);
}
