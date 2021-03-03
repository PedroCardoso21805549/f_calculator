import 'package:flutter/material.dart';
import 'button.dart';
import 'package:f_calculator/blocs/calculator.dart';

class Keyboard extends StatelessWidget {
  final keys = [
    ["C", "<", "/", "X"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["0", ".", "="]
  ];
  final Calculator calculator;

  Keyboard({this.calculator});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Button(
                text: "C",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.grey,
                onPressed: (symbol) => calculator.onClean(),
              ),
              Button(
                text: "<",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.grey,
                onPressed: (symbol) => calculator.onCleanLast(),
              ),
              Button(
                text: "/",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.orange,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: "X",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.orange,
                onPressed: (symbol) => calculator.onReceiveSymbol("*"),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Button(
                text: "4",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.black54,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: "5",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.black54,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: "6",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.black54,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: "-",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.orange,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Button(
                text: "1",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.black54,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: "2",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.black54,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: "3",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.black54,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: "+",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.orange,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                text: "0",
                width: calculateButtonWidth(context, isDouble: true),
                height: calculateButtonHeight(context),
                color: Colors.black54,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: ".",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.black54,
                onPressed: (symbol) => calculator.onReceiveSymbol(symbol),
              ),
              Button(
                text: "=",
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                color: Colors.orange,
                onPressed: (symbol) => calculator.onEquals(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double calculateButtonWidth(context, {isDouble = false}) {
    double width = MediaQuery.of(context).size.width / 4;
    return isDouble ? (width * 2) : width;
  }

  double calculateButtonHeight(context) {
    return MediaQuery.of(context).size.height / 8;
  }
}