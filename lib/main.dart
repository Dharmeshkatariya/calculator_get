import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/calculator_controller.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(title: 'CALCULATOR'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                height: 200,
                width: double.infinity,
                color: Colors.black,
                child: Text(
                  "\n${_calculatorController.outputResult}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 39),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  color: Colors.cyan.shade50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _rowac(),
                      _row7(),
                      _row4(),
                      _row1(),
                      _row0(),
                    ],
                  ),
                ))
          ],
        )));
  }

  Widget _rowac() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            _calculatorController.outputResult.value = "0";
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            height: 60,
            width: 60,
            child: const Text(
              'Ac',
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _calculatorController
                .textPress(_calculatorController.outputResult.value);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            height: 60,
            width: 60,
            child: const Text(
              'C',
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        _customWidget(title: "%", color: Colors.black38),
        _customWidget(title: "", color: Colors.yellow),
      ],
    );
  }

  Widget _row7() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _customWidget(title: "7", color: Colors.black38),
        _customWidget(title: "8", color: Colors.black38),
        _customWidget(title: "9", color: Colors.black38),
        _customWidget(title: "/", color: Colors.yellow),
      ],
    );
  }

  Widget _row4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _customWidget(title: "4", color: Colors.black38),
        _customWidget(title: "5", color: Colors.black38),
        _customWidget(title: "6", color: Colors.black38),
        _customWidget(title: "*", color: Colors.yellow),
      ],
    );
  }

  Widget _row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _customWidget(title: "1", color: Colors.black38),
        _customWidget(title: "2", color: Colors.black38),
        _customWidget(title: "3", color: Colors.black38),
        _customWidget(title: "-", color: Colors.yellow),
      ],
    );
  }
  Widget _row0() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _customWidget(title: '0', color: Colors.black38),
        _customWidget(title: '.', color: Colors.black38),
        GestureDetector(
          onTap: () {
            _calculatorController.separate();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            height: 60,
            width: 60,
            child: const Text(
              "=",
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        _customWidget(title: "+", color: Colors.yellow),
      ],
    );
  }
  Widget _customWidget({required String title, required Color color}) {
    return GestureDetector(
      onTap: () {
        _calculatorController.numberPress(title);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        height: 60,
        width: 60,
        child: Text(
          title,
          style: const TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
