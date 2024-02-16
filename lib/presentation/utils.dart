import 'package:flutter/material.dart';

sizeWidth(BuildContext context, double percent) {
  return MediaQuery.of(context).size.width * percent / 100;
}

sizeHeight(BuildContext context, double percent) {
  return MediaQuery.of(context).size.height * percent / 100;
}

getDayColors() {
  return [
    Colors.blue[700]!,
    Colors.blue[500]!,
    Colors.blue[400]!,
    Colors.blue[300]!,
    Colors.blue[100]!,
  ];
}

getNightColors() {
  return [
    Colors.purple[900]!,
    Colors.purple[800]!,
    Colors.purple[700]!,
    Colors.purple[400]!,
    Colors.purple[200]!,
  ];
}
