

import 'package:finamp/color_schemes.g.dart';
import 'package:flutter/material.dart';

enum IconPosition {
  start,
  end,
}

class SimpleButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconPosition? iconPosition;
  final double iconSize;
  final Color? iconColor;
  final void Function() onPressed;
  final bool disabled;

  const SimpleButton({super.key, required this.text, required this.icon, required this.onPressed, this.iconPosition = IconPosition.start, this.iconSize = 20.0, this.iconColor, this.disabled = false});

  @override
  Widget build(BuildContext context) {

    final contents = [
      Icon(
        icon,
        size: iconSize,
        color: disabled ? iconColor?.withOpacity(0.5) : iconColor,
        weight: 1.5,
      ),
      const SizedBox(width: 6,),
      Text(
        text,
        style: TextStyle(
          color: disabled ? Theme.of(context).disabledColor : Theme.of(context).textTheme.bodyMedium!.color!,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ];
    
    return Tooltip(
      message: disabled ? "$text (Disabled)" : text,
      child: TextButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: iconPosition == IconPosition.start ? contents : contents.reversed.toList(),
        ),
      ),
    );
  }
}
