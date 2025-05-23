import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// A circular loader widget with customizable foreground and background colors.
class TCircularLoader extends StatelessWidget {
  /// Default constructor for the TCircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const TCircularLoader({
    super.key,
    this.foregroundColor,
    this.backgroundColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(TSizes().lg),
      decoration: BoxDecoration(
          color: backgroundColor ?? TColors().primary,
          shape: BoxShape.circle), // Circular background
      child: Center(
        child: CircularProgressIndicator(
            color: foregroundColor ?? TColors().white,
            backgroundColor: Colors.transparent), // Circular loader
      ),
    );
  }
}
