import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key, required this.webLayout, required this.mobileLayout});

  final Widget webLayout;
  final Widget mobileLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, constraints) {
        if (constraints.maxWidth > 900) {
          return webLayout;
        }
        return mobileLayout;
      },
    );
  }
}
