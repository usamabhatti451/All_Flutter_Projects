import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('XyloPhone'),
        ),
        body: const Xylo(),
      ),
    );
  }
}

class Xylo extends StatefulWidget {
  const Xylo({Key? key}) : super(key: key);

  @override
  State<Xylo> createState() => XyloState();
}

class XyloState extends State<Xylo> {
  int numOfButtons = 7; // default number of buttons
  Color buttonColor = Colors.lightGreen; // default button color
  // list of assets for the buttons
  List<String> assets = [
    "../assets/note1.wav",
    "../assets/note2.wav",
    "../assets/note3.wav",
    "../assets/note4.wav",
    "../assets/note5.wav",
    "../assets/note6.wav",
    "../assets/note7.wav",
  ];

  // method to handle button press
  void playSound(int index) {
    final audio=AudioPlayer();
    audio.play('assets/note$index.wav');
  }

  final List<Color> _colors = List.generate(10, (index) => Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: numOfButtons,
            itemBuilder: (context, index) {
              return Container(
                color: _colors[index],
                child: TextButton(
                  onPressed: () {
                    playSound(index);
                  },
                  child: Text("Button ${index + 1}"),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Number of buttons: '),
            DropdownButton<int>(
              value: numOfButtons,
              onChanged: (value) {
                setState(() {
                  numOfButtons = value!;
                });
              },
              items: List.generate(7, (index) {
                return DropdownMenuItem(
                  value: index + 1,
                  child: Text('${index + 1} Buttons'),
                );
              }),
            ),
            const SizedBox(width: 40),
            const Text('Button color: '),
            DropdownButton<Color>(
              value: buttonColor,
              onChanged: (value) {
                setState(() {
                  buttonColor = value!;
                });
              },
              items: Colors.primaries.map((color) {
                return DropdownMenuItem(
                  value: color,
                  child: Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: color,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}

