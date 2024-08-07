import 'package:flutter/material.dart';

class TheSummary extends StatelessWidget {
  const TheSummary({super.key, required this.allSummary});

  final List<Map<String, Object>> allSummary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: allSummary.map(
        (data) {
          return Row(
            children: [
              Text(((data["index_question"] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(data["questions"] as String),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(data["answers_picked"] as String),
                    Text(data["answers_correct"] as String),
                  ],
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }
}
