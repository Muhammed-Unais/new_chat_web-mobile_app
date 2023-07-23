import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(error),
    );
  }
}
