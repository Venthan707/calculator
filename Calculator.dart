import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var firstValue = '',
      secondValue = '',
      result = '',
      opClicked = '',
      cancel = '';
  TextEditingController txtValue = new TextEditingController();
  bool isOperatorClicked = false;

  ConcatValues(String val) {
    setState(() {
      if (isOperatorClicked) {
        secondValue = "$secondValue$val";
        txtValue.text = secondValue;
        //print(secondValue);
      } else {
        firstValue = "$firstValue$val";
        txtValue.text = firstValue;
        //print(firstValue);
      }
    });
  }

  callOperator(String opValue, String opText) {
    setState(() {
      isOperatorClicked = true;
      txtValue.text = opValue;
      opClicked = opText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black12,
            centerTitle: true,
            title: Text(
              "Calculator",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 100,
                    child: TextFormField(
                      decoration: InputDecoration(border: InputBorder.none),
                      textAlign: TextAlign.right,
                      controller: txtValue,
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          child: FloatingActionButton(
                              onPressed: () {
                                 cancel = "${cancel}";
                                setState(() {
                                  isOperatorClicked = false;
                                  opClicked = '';
                                  firstValue = '';
                                  secondValue = '';
                                  txtValue.text = "0";
                                });
                              },
                              backgroundColor: Colors.white54,
                              child: Text(
                                "AC",
                                style:
                                    TextStyle(fontSize: 30, color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    isOperatorClicked = true;
                                    // opClicked = "percentage";
                                    int val = int.parse((txtValue.text));
                                    txtValue.text = (val / 100).toString();
                                    firstValue = txtValue.text;
                                  });
                                },
                                backgroundColor: Colors.white54,
                                child: Text(
                                  "%",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  print("pressed backspace");
                                  setState(() {
                                    txtValue.text = txtValue.text
                                        .substring(0, txtValue.text.length - 1);
                                    if (isOperatorClicked) {
                                      secondValue = txtValue.text;
                                    } else {
                                      firstValue = txtValue.text;
                                    }

                                    print(txtValue.text);


                                  });
                                },
                                backgroundColor: Colors.white54,
                                child: Icon(
                                  Icons.backspace_outlined,
                                  color: Colors.black,
                                  size: 30,
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  callOperator ("÷", "division");
                                },
                                backgroundColor: Colors.orangeAccent,
                                child: Text(
                                  "÷",
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.white),
                                )))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("7");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "7",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("8");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "8",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("9");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "9",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  callOperator("*", "mul");
                                },
                                backgroundColor: Colors.orangeAccent,
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          child: FloatingActionButton(
                              onPressed: () {
                                ConcatValues("4");
                              },
                              backgroundColor: Colors.white24,
                              child: Text(
                                "4",
                                style:
                                    TextStyle(fontSize: 30, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("5");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("6");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  callOperator("-", "sub");
                                },
                                backgroundColor: Colors.orangeAccent,
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("1");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("2");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("3");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  callOperator("+", "Add");
                                },
                                backgroundColor: Colors.orangeAccent,
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          child: FloatingActionButton(
                              onPressed: () {
                                ConcatValues("00");
                              },
                              backgroundColor: Colors.white24,
                              child: Text(
                                "00",
                                style:
                                    TextStyle(fontSize: 30, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues("0");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  ConcatValues(".");
                                },
                                backgroundColor: Colors.white24,
                                child: Text(
                                  ".",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                                onPressed: () {
                                  isOperatorClicked = false;
                                  var first, second;
                                  if (firstValue.contains('.')) {
                                    first = double.parse(firstValue);
                                  } else {
                                    first = int.parse(firstValue);
                                  }
                                  if (secondValue.contains('.')) {
                                    second = double.parse(secondValue);
                                  } else {
                                    second = int.parse(secondValue);
                                  }
                                  var res;
                                  print(opClicked);
                                  //opClicked="result";
                                  if (opClicked == "Add") {
                                    res = first + second;
                                  } else if (opClicked == "sub") {
                                    res = first - second;
                                  } else if (opClicked == "mul") {
                                    res = first * second;
                                  } else if (opClicked == "division") {
                                    res = first / second;
                                  }
                                  firstValue = res.toString();
                                  print(firstValue);
                                  secondValue = "";

                                  print(res);
                                  txtValue.text = '${res}';
                                },
                                backgroundColor: Colors.orangeAccent,
                                child: Text(
                                  "=",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
