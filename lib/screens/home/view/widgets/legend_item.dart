import 'package:flutter/material.dart';

class LegendItem extends StatelessWidget {
  const LegendItem({super.key, required this.title, required this.percent, required this.color});
final String title;
final  String percent;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 12, height: 12, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 13,color: Colors.white))),
          Text(
            percent,
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
        ],
      ),
    );
  }
}