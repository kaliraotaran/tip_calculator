import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  List<bool> _selection = [true, false, false];

  String tip = ' ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (tip != 0)
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  tip,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            Text(
              'Total Amount',
            ),
            SizedBox(
              width: 70,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '\$100.00'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ToggleButtons(
                children: [Text('5\%'), Text('10\%'), Text('15\%')],
                isSelected: _selection,
                onPressed: updateselection,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  onPressed: Calculatetip,
                  child: Text('Calculate Tip'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void updateselection(int selectionIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectionIndex == i;
      }
    });
  }

  void Calculatetip() {
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.05, 0.1, 0.15][selectedIndex];

    final tiptotal = (totalAmount * tipPercentage).toStringAsFixed(2);
    setState(() {
      tip = '\$$tiptotal';
    });
  }
}
