import 'package:flutter/material.dart';
import '../theme/light_theme.dart';
import 'package:math_expressions/math_expressions.dart';
import '../components/calculator_input_field.dart';
import '../components/calculatorBtn.dart';
import '../components/app_bar.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  void _updateInputField(String value) {
    List<String> arr = ["=", "DEL", "C", "A"];
    setState(() {
      if (!arr.contains(value)) {
        _inputController.text += value;
      }
      if (value == arr[1]) {
        _inputController.text = "";
      }
      if (value == arr[0]) {
        try {
          Parser parser = Parser();
          Expression exp = parser.parse(_inputController.text);
          ContextModel contextModel = ContextModel();
          double result =
              exp.evaluate(EvaluationType.REAL, contextModel).toDouble();
          _inputController.text = result.toString();
        } catch (e) {
          print("Invalid expression: $e");
        }
      }
    });
  }

  TextEditingController _inputController = TextEditingController();
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'A',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarText: 'Calculator app'),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CalculatorInputField(
                controller: _inputController,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 480,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          blurRadius: 4, // Shadow blur radius
                          offset: Offset(2, 2), // Shadow offset
                        ),
                      ],
                    ),
                    child: GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      children: List.generate(buttons.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CalculatorBtn(
                            buttonText: buttons[index],
                            onPressed: () {
                              _updateInputField(buttons[index]);
                            },
                          ),
                        );
                      }),
                    ),
                  ))
            ],
          )),
    );
  }
}
