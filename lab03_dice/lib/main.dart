import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice',
      theme: ThemeData(useMaterial3: true),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final Random _random = Random();

  int _leftDice = 1;
  int _rightDice = 1;

  void _rollDice() {
    setState(() {
      _leftDice = _random.nextInt(6) + 1;
      _rightDice = _random.nextInt(6) + 1;
    });
  }

  void _rollLeftDice() {
    setState(() {
      _leftDice = _random.nextInt(6) + 1;
    });
  }

  void _rollRightDice() {
    setState(() {
      _rightDice = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB71C1C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7F0000),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Dice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tap a dice or roll both!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: _rollLeftDice,
                      child: Image.asset('images/dice$_leftDice.png'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextButton(
                      onPressed: _rollRightDice,
                      child: Image.asset('images/dice$_rightDice.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 45),
              ElevatedButton.icon(
                onPressed: _rollDice,
                icon: const Icon(Icons.casino),
                label: const Text(
                  'ROLL DICE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 18,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '$_leftDice  +  $_rightDice  =  ${_leftDice + _rightDice}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
