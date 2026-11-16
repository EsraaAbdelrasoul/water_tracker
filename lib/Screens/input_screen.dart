import 'package:flutter/material.dart';
import 'result_screen.dart';
import '../widgets/gender_card.dart';
import '../widgets/counter_card.dart';
import '../widgets/bottom_button.dart';
import '../utils/water_calculator.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  bool isMale = true;
  double activityHours = 2.0;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("💧"),
            SizedBox(width: 10),
            Text('Water Tracker', style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GenderCard(
                      icon: Icons.male,
                      label: 'MALE',
                      isSelected: isMale,
                      onPress: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                  ),
                  ),
               const SizedBox(width: 15),
                 Expanded(
                    child: GenderCard(
                      icon: Icons.female,
                      label: 'FEMALE',
                      isSelected: !isMale,
                      onPress: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
               decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'ACTIVITY (hours/day)',
                            style: TextStyle(color: Color(0xFFB0BEC5), fontSize: 12),
                          ),
                          Text(
                            '${activityHours.toStringAsFixed(0)} h',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00E5FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      value: activityHours,
                      min: 0,
                      max: 8,
                      activeColor: const Color(0xFF00E5FF),
                      inactiveColor: const Color(0xFFBB0BEC5),
                      onChanged: (newValue) {
                        setState(() {
                      activityHours = newValue;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('0', style: TextStyle(color: Color(0xFFB0BEC5))),
                          Text('8', style: TextStyle(color: Color(0xFFB0BEC5))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CounterCard(
                      title: 'WEIGHT (kg)',
                      value: weight,
                      onDecrement: () {
                        setState(() {
                          if (weight > 30) weight--;
                        });
                      },
                      onIncrement: () {
                        setState(() {
                          if (weight < 200) weight++;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: CounterCard(
                      title: 'AGE (years)',
                      value: age,
                      onDecrement: () {
                        setState(() {
                          if (age > 10) age--;
                        });
                      },
                      onIncrement: () {
                        setState(() {
                          if (age < 100) age++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            BottomButton(
              title: 'Calculate Water Intake',
              onTap: () {
                double finalResult = calculateWaterLitres(
                  weightKg: weight,
                  activityHours: activityHours,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      litres: finalResult,
                      weight: weight.toDouble(),
                      age: age,
                      activityHours: activityHours,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}