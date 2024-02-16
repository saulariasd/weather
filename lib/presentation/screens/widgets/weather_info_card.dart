import 'package:flutter/material.dart';
import 'package:weather/presentation/utils.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth(context, 35),
      height: sizeHeight(context, 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(value,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(title,
              style: const TextStyle(fontSize: 14, color: Colors.white70)),
        ],
      ),
    );
  }
}
