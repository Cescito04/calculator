import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? first, second;
  String? op;
  String? result, text = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (["+", "-", "*", "/"].contains(btnText)) {
      first = int.parse(text!);
      result = "";
      op = btnText;
    } else if (btnText == "=") {
      second = int.parse(text!);
      if (op == "+") {
        result = (first! + second!).toString();
      } else if (op == "-") {
        result = (first! - second!).toString();
      } else if (op == "*") {
        result = (first! * second!).toString();
      } else if (op == "/") {
        result = (first! / second!).toString();
      }
    } else {
      result = int.parse(text! + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget customOutlineButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> buttonRows = [
      ["9", "8", "7", "+"],
      ["6", "5", "4", "-"],
      ["3", "2", "1", "*"],
      ["C", "0", "=", "/"],
    ];

    return Scaffold(
      appBar: AppBar(

        title: Text("Calculatrice"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text(
                  text!,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            for (List<String> buttonRow in buttonRows)
              Row(
                children: [
                  for (String buttonValue in buttonRow)
                    customOutlineButton(buttonValue),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
