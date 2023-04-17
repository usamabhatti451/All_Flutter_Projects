import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(DiceApp());

class DiceApp extends StatefulWidget {
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int numOfDice = 1;
  List<int> diceValues = [1];

  void _addDice() {
    setState(() {
      if (numOfDice < 20) { // Check if numOfDice is less than 20 before incrementing
        numOfDice++;
        diceValues.add(1);
      }
    });
  }

  void _removeDice() {
    setState(() {
      if (numOfDice > 1) { // Check if numOfDice is greater than 1 before removing
        numOfDice--;
        diceValues.removeLast();
      }
    });
  }

  void _rollDice() {
    setState(() {
      diceValues = List.generate(numOfDice, (index) => Random().nextInt(6) + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Number of Dice: '),
                  DropdownButton<int>(
                    value: numOfDice,
                    onChanged: (value) {
                      setState(() {
                        numOfDice = value!;
                        diceValues = List.generate(numOfDice, (index) => 1);
                      });
                    },
                    items: List.generate(
                      20, // Generate 20 DropdownMenuItem's instead of 6
                          (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text((index + 1).toString()),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: List.generate(
                  numOfDice,
                      (index) => Dice(
                    value: diceValues[index],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _rollDice,
                child: Text('Roll Dice'),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _addDice,
                    child: Text('Add Dice'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _removeDice,
                    child: Text('Remove Dice'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final int value;

  Dice({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: Image.asset('images/inverted-dice-$value.png'),
    );
  }
}
