import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const CounterCard({
    super.key,
    required this.title,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Color(0xFFBB0BEC5))),
          Text(
            value.toString(),
            style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: title + '_minus',
                backgroundColor: const Color(0xFF4C4F5E),
                onPressed: onDecrement,
                child: const Icon(Icons.remove, color: Colors.white),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                heroTag: title + '_plus',
                backgroundColor: const Color(0xFF4C4F5E),
                onPressed: onIncrement,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}