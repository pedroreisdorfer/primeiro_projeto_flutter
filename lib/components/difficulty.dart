import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;

  const Difficulty({
    super.key,
    required this.difficultyLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 1
              ? Colors.blue
              : const Color.fromARGB(69, 33, 149, 243),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 2
              ? Colors.blue
              : const Color.fromARGB(69, 33, 149, 243),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 3
              ? Colors.blue
              : const Color.fromARGB(69, 33, 149, 243),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 4
              ? Colors.blue
              : const Color.fromARGB(69, 33, 149, 243),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 5
              ? Colors.blue
              : const Color.fromARGB(69, 33, 149, 243),
        ),
      ],
    );
  }
}
