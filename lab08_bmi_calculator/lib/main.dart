import 'package:flutter/material.dart';

import 'calculator_brain.dart';
import 'result_page.dart';

void main() {
  runApp(const BmiApp());
}

enum Gender { male, female }

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(useMaterial3: true),
      home: const BmiInputPage(),
    );
  }
}

class BmiInputPage extends StatefulWidget {
  const BmiInputPage({super.key});

  @override
  State<BmiInputPage> createState() => _BmiInputPageState();
}

class _BmiInputPageState extends State<BmiInputPage> {
  Gender? _selectedGender;

  int _height = 170;
  int _weight = 65;
  int _age = 20;

  void _calculate() {
    final calculator = CalculatorBrain(height: _height, weight: _weight);

    final bmi = calculator.calculateBMI();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          bmiResult: bmi.toStringAsFixed(1),
          resultText: calculator.getResult(),
          interpretation: calculator.getInterpretation(),
        ),
      ),
    );
  }

  Widget _buildGenderCard({
    required Gender gender,
    required IconData icon,
    required String label,
  }) {
    final selected = _selectedGender == gender;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedGender = gender;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF30304A) : const Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(16),
            border: selected
                ? Border.all(color: const Color(0xFFEB1555), width: 2)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 70, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberCard({
    required String title,
    required int value,
    required VoidCallback onDecrease,
    required VoidCallback onIncrease,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 17),
            ),
            Text(
              '$value',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                  heroTag: '$title-minus',
                  onPressed: onDecrease,
                  backgroundColor: const Color(0xFF4C4F5E),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 12),
                FloatingActionButton.small(
                  heroTag: '$title-plus',
                  onPressed: onIncrease,
                  backgroundColor: const Color(0xFF4C4F5E),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _buildGenderCard(
                      gender: Gender.male,
                      icon: Icons.male,
                      label: 'MALE',
                    ),
                    const SizedBox(width: 12),
                    _buildGenderCard(
                      gender: Gender.female,
                      icon: Icons.female,
                      label: 'FEMALE',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: TextStyle(color: Colors.white70, fontSize: 17),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$_height',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            ' cm',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: _height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: const Color(0xFFEB1555),
                        inactiveColor: Colors.white24,
                        onChanged: (value) {
                          setState(() {
                            _height = value.round();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    _buildNumberCard(
                      title: 'WEIGHT',
                      value: _weight,
                      onDecrease: () {
                        if (_weight > 1) {
                          setState(() {
                            _weight--;
                          });
                        }
                      },
                      onIncrease: () {
                        setState(() {
                          _weight++;
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                    _buildNumberCard(
                      title: 'AGE',
                      value: _age,
                      onDecrease: () {
                        if (_age > 1) {
                          setState(() {
                            _age--;
                          });
                        }
                      },
                      onIncrease: () {
                        setState(() {
                          _age++;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEB1555),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
