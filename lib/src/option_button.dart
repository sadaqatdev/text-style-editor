import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final bool isActive;
  final Function() onPressed;
  final Widget child;
  final Size? size;

  OptionButton({
    required this.onPressed,
    required this.child,
    this.isActive = false,
    this.size,
  });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(size ?? Size(45, 45)),
      highlightColor: Theme.of(context).colorScheme.secondary,
      splashColor: Theme.of(context).colorScheme.secondary,
      fillColor: isActive ? Theme.of(context).colorScheme.onBackground : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.surface),
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}
