import 'package:flutter/material.dart';
import 'package:text_style_editor/text_style_editor.dart';

class ColorPalette extends StatefulWidget {
  final Color? activeColor;
  final List<Color> colors;
  final Function(Color?) onColorPicked;
  final EditorToolbarAction? editorToolbarAction;
  ColorPalette(
      {this.activeColor,
      required this.onColorPicked,
      required this.colors,
      required this.editorToolbarAction});

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  late Color _activeColor;

  @override
  void initState() {
    _activeColor = widget.activeColor ?? widget.colors[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          widget.editorToolbarAction == EditorToolbarAction.backgroundColorTool
              ? InkWell(
                  onTap: () {
                    widget.onColorPicked(null);
                  },
                  child: Container(
                    height: 39,
                    width: 39,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(
                          color: Theme.of(context).colorScheme.secondary)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          ...widget.colors
              .map(
                (color) => _ColorHolder(
                  color: color,
                  active: color == _activeColor,
                  onTap: (color) {
                    setState(() => _activeColor = color);
                    widget.onColorPicked(color);
                  },
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class _ColorHolder extends StatelessWidget {
  final Color color;
  final Function(Color) onTap;
  final bool active;

  _ColorHolder({
    required this.color,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: active
            ? Border.fromBorderSide(
                BorderSide(color: Theme.of(context).colorScheme.onBackground))
            : null,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () => onTap(color),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.fromBorderSide(
                  BorderSide(color: Theme.of(context).colorScheme.secondary)),
              borderRadius: BorderRadius.circular(50),
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
