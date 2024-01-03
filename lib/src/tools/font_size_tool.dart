import 'package:flutter/material.dart';

class FontSizeTool extends StatelessWidget {
  final double fontSize;
  final double letterSpacing;
  final double letterHeight;
  final Function(
    double fontSize,
    double letterSpacing,
    double letterHeight,
  ) onFontSizeEdited;

  FontSizeTool({
    required this.onFontSizeEdited,
    this.fontSize = 0,
    this.letterSpacing = 0,
    this.letterHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    double _fontSize = fontSize;
    double _letterSpacing = letterSpacing;
    double _letterHeight = letterHeight;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          _ResizeBtn(
            value: _fontSize,
            icon: Icons.format_size,
            onChange: (value) {
              _fontSize = value;
              onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight);
            },
          ),
          Spacer(),
          // _ResizeBtn(
          //   value: _letterHeight,
          //   icon: Icons.format_line_spacing,
          //   max: 10,
          //   onChange: (value) {
          //     _letterHeight = value;
          //     onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight);
          //   },
          // ),

          _ResizeBtn(
            value: _letterSpacing,
            icon: Icons.settings_ethernet,
            max: 10,
            onChange: (value) {
              _letterSpacing = value;
              onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight);
            },
          ),
        ],
      ),
    );
  }
}

class _ResizeSlider extends StatefulWidget {
  final double value;
  final double? min;
  final double? max;
  final IconData icon;
  final Function(double) onChange;

  _ResizeSlider({
    required this.value,
    required this.icon,
    required this.onChange,
    this.min = 0,
    this.max = 100,
  });

  @override
  _ResizeSliderState createState() => _ResizeSliderState();
}

class _ResizeSliderState extends State<_ResizeSlider> {
  late double _value;

  @override
  void initState() {
    _value = widget.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: Theme.of(context).colorScheme.onBackground,
              inactiveTrackColor: Theme.of(context).colorScheme.secondary,
              thumbColor: Theme.of(context).colorScheme.onBackground,
              overlayColor:
                  Theme.of(context).colorScheme.background.withOpacity(0.2),
              trackHeight: 2,
            ),
            child: Slider(
              value: _value,
              onChanged: (value) {
                setState(() => _value = value);

                widget.onChange(value);
              },
              min: widget.min!,
              max: widget.max!,
            ),
          ),
        ),
        Text(_value.toStringAsFixed(1)),
      ],
    );
  }
}

class _ResizeBtn extends StatefulWidget {
  final double value;
  final double? min;
  final double? max;
  final IconData icon;
  final Function(double) onChange;

  _ResizeBtn({
    required this.value,
    required this.icon,
    required this.onChange,
    this.min = 0,
    this.max = 100,
  });

  @override
  _ResizeBtnState createState() => _ResizeBtnState();
}

class _ResizeBtnState extends State<_ResizeBtn> {
  late double _value;

  @override
  void initState() {
    _value = widget.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon),
        SizedBox(width: 14),
        InkWell(
            onTap: () {
              var v = _value + 1;
              if (v <= 30) {
                widget.onChange(v);
                _value = v;
                setState(() {});
              }
            },
            child: Icon(Icons.add)),
        SizedBox(width: 14),
        Text(_value.toStringAsFixed(1)),
        SizedBox(width: 14),
        InkWell(
            onTap: () {
              var v = _value - 1;
              if (v >= 8) {
                widget.onChange(v);
                _value = v;
                setState(() {});
              }
            },
            child: Icon(Icons.remove))
      ],
    );
  }
}
