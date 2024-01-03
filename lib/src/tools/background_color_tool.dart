import 'package:flutter/material.dart';
import 'package:text_style_editor/src/color_palette.dart';
import 'package:text_style_editor/text_style_editor.dart';

class BackgroundColorTool extends StatelessWidget {
  final List<Color> colors;
  final Color? activeColor;
  final Function(Color?) onColorPicked;
  final EditorToolbarAction backgroundColorTool;
  BackgroundColorTool(
      {required this.colors,
      required this.onColorPicked,
      this.activeColor,
      required this.backgroundColorTool});

  @override
  Widget build(BuildContext context) {
    return ColorPalette(
      activeColor: activeColor,
      onColorPicked: onColorPicked,
      colors: colors,
      editorToolbarAction: backgroundColorTool,
    );
  }
}
