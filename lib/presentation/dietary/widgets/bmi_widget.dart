import 'package:fit_quest/presentation/dietary/dietry_page.dart';
import 'package:flutter/material.dart';

class BMIWidgetCard extends StatefulWidget {
  const BMIWidgetCard({super.key});

  @override
  State<BMIWidgetCard> createState() => _BMIWidgetCardState();
}

class _BMIWidgetCardState extends State<BMIWidgetCard> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  String _bmiResult = '';
  String _category = '';

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    try {
      double weight = double.tryParse(_weightController.text) ?? 0;
      double height = double.tryParse(_heightController.text) ?? 0;

      if (weight < 20 || weight > 500 || height < 0.5 || height > 3.0) {
        setState(() {
          _bmiResult = 'Please enter realistic values:';
          _category = 'Weight: 20-500 kg\nHeight: 0.5-3.0 m';
        });
        return;
      }

      if (weight > 0 && height > 0) {
        BMICalculator bmiCalculator =
            BMICalculator(weight: weight, height: height);
        double bmi = bmiCalculator.calculateBMI();
        String category = bmiCalculator.getBMICategory();

        setState(() {
          _bmiResult = 'Your BMI is ${bmi.toStringAsFixed(1)}';
          _category = 'You fall under: $category';
        });
      } else {
        setState(() {
          _bmiResult = 'Please enter valid values.';
          _category = '';
        });
      }
    } catch (e) {
      setState(() {
        _bmiResult = 'Invalid input format';
        _category = 'Please enter numbers only';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xFF1D1D1D),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Use this tool to calculate your Body Mass Index (BMI) and determine your fitness level.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (m)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            if (_bmiResult.isNotEmpty) ...[
              Text(
                _bmiResult,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _category,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
