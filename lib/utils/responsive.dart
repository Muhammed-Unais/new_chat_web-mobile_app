import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key, required this.desktopLayout, required this.mobileLayout});

  final Widget desktopLayout;
  final Widget mobileLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, constraints) {
        if (constraints.maxWidth > 900) {
          return desktopLayout;
        }
        return mobileLayout;
      },
    );
  }
}
