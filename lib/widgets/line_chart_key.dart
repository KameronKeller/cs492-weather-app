import 'package:flutter/material.dart';

class LineChartKey extends StatelessWidget {
  const LineChartKey({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.circle, color: Colors.amber),
          Text("Temperature"),
          SizedBox(width: 20),
          Icon(Icons.circle, color: Colors.blue),
          Text("Dewpoint"),
        ],
      );
  }
}
