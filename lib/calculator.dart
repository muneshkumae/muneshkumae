// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, unused_import, unnecessary_import, curly_braces_in_flow_control_structures

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator_App extends StatefulWidget {
  const Calculator_App({super.key});

  @override
  State<Calculator_App> createState() => _Calculator_AppState();
}

class _Calculator_AppState extends State<Calculator_App> {
  String equation = '0';
  String result = '0';
  String expression = '';
//function for butten working
  buttonPresed(Btntext) {
//we are passing btntext so that every butten can have there own value
    setState(() {
      if (Btntext == 'AC') {
        equation = '0';
        result = '0';
      } else if (Btntext == '⌫') {
        equation = equation.substring(0, equation.length - 1);

        if (equation == '') {
          equation = '0';
        }
      } else if (Btntext == '=') {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
 
        try {
          Parser P = Parser();
          Expression exp = P.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          'Error';
        }
      } else {
        if (equation == '0') {
          equation = Btntext;
        } else
          equation = equation + Btntext;
      }
    });
  }

  Widget calbutten(
      String Btntext, Color txtcolor, double btnwidth, Color Btncolor) {
    return InkWell(
      onTap: () {
        buttonPresed(Btntext);
      },
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: btnwidth,
        decoration: BoxDecoration(
          color: Btncolor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          Btntext,
          style: TextStyle(color: txtcolor, fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.elliptical(200, 100)),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent[100],
        title: Text(
          'Calculator',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),

          //display expration value
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 80,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Text(
                equation,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
//display result
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 80,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Text(
                result,
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbutten(
                        'AC', Colors.white, 70, Colors.deepOrangeAccent[100]!),
                    calbutten('⌫', Colors.white, 70, Colors.white38),
                    calbutten('%', Colors.white, 70, Colors.white38),
                    calbutten(
                        '÷', Colors.white, 70, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbutten('7', Colors.white, 70, Colors.white10),
                    calbutten('8', Colors.white, 70, Colors.white10),
                    calbutten('9', Colors.white, 70, Colors.white10),
                    calbutten(
                        '×', Colors.white, 70, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbutten('4', Colors.white, 70, Colors.white10),
                    calbutten('5', Colors.white, 80, Colors.white10),
                    calbutten('6', Colors.white, 80, Colors.white10),
                    calbutten(
                        '-', Colors.white, 70, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbutten('1', Colors.white, 70, Colors.white10),
                    calbutten('2', Colors.white, 70, Colors.white10),
                    calbutten('3', Colors.white, 70, Colors.white10),
                    calbutten(
                        '+', Colors.white, 70, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbutten('0', Colors.white, 165, Colors.white10),
                    calbutten('.', Colors.white, 70, Colors.white10),
                    calbutten(
                        '=', Colors.white, 70, Colors.deepOrangeAccent[100]!),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
