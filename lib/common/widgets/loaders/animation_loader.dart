import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// A reusable widget to display an animated loader with optional text and an action button.
///
/// This widget can be used to indicate loading or empty states in the UI.
/// It supports animations, custom text, and an optional action button for user interaction.
class TAnimationLoader extends StatelessWidget {
  /// Creates a [TAnimationLoader].
  ///
  /// - [message] is the message displayed below the animation.
  /// - [animation] is the path to the animation asset (e.g., Lottie or image).
  /// - [isLottieAnimation] Weather this is a Lottie or simple gif/image.
  /// - [showAction] controls the visibility of the action button.
  /// - [actionChild] Optional Child widget for the actions at the bottom of animation.
  /// - [actionText] is the label for the action button (optional, required if [showAction] is true).
  /// - [onActionPressed] is the callback executed when the action button is pressed.
  /// - [height] and [width] set the size of the animation (default: 400x400).
  /// - [style] customizes the text style for the message.
  const TAnimationLoader({
    super.key,
    this.message,
    this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
    this.height = 200,
    this.width = 200,
    this.style,
    this.actionChild,
    this.isLottieAnimation = false,
  }) : assert(
          !showAction || (showAction && actionText != null),
          'actionText must be provided when showAction is true, in TAnimationLoader.',
        );

  /// The message displayed below the animation.
  final Widget? message;

  /// The message displayed below the animation.
  final Widget? actionChild;

  /// The style of the text message.
  final TextStyle? style;

  /// The path to the animation asset (Lottie or image).
  final String? animation;

  /// Whether to show the action button.
  final bool showAction;

  /// Whether a Lottie animation or simple gif.
  final bool isLottieAnimation;

  /// The label for the action button.
  final String? actionText;

  /// Callback executed when the action button is pressed.
  final VoidCallback? onActionPressed;

  /// The height of the animation.
  final double height;

  /// The width of the animation.
  final double width;

  @override
  Widget build(BuildContext context) {
    assert(
      !(isLottieAnimation && animation == null),
      'animation cannot be empty if isLottieAnimation is set to true in TAnimationLoader',
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the animation (can be replaced with Lottie or other formats).
          isLottieAnimation
              ? Lottie.asset(animation!, height: height, width: width, fit: BoxFit.contain)
              : Image(
                  image: AssetImage(animation ?? 'packages/t_utils/assets/riding.gif'), height: height, width: width, fit: BoxFit.contain),
          SizedBox(height: TSizes().defaultSpace),

          // Display the optional text message below the animation.
          DefaultTextStyle(
            style: style ?? Theme.of(context).textTheme.titleMedium!,
            textAlign: TextAlign.center,
            child: message ?? Text('Loading your data...'),
          ),
          SizedBox(height: TSizes().defaultSpace),

          // Show the action button if enabled.
          if (showAction)
            actionChild ??
                OutlinedButton(
                  onPressed: onActionPressed,
                  child: Text(
                    actionText ?? 'Action',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors().lightBackground),
                  ),
                ),
        ],
      ),
    );
  }
}
