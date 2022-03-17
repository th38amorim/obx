import 'package:charts_flutter/flutter.dart' show Color;

/// A color palette.
abstract class Palette {
  const Palette();

  /// The default shade.
  Color get shadeDefault;

  /// Returns a list of colors for this color palette.
  List<Color> makeShades(int colorCnt) {
    final colors = <Color>[shadeDefault];

    // If we need more than 2 colors, then [unselected] collides with one of the
    // generated colors. Otherwise divide the space between the top color
    // and white in half.
    final lighterColor = colorCnt < 3
        ? shadeDefault.lighter
        : _getSteppedColor(shadeDefault, (colorCnt * 2) - 1, colorCnt * 2);

    // Divide the space between 255 and c500 evenly according to the colorCnt.
    for (var i = 1; i < colorCnt; i++) {
      colors.add(_getSteppedColor(shadeDefault, i, colorCnt,
          darker: shadeDefault.darker, lighter: lighterColor));
    }

    colors.add(Color.fromOther(color: shadeDefault, lighter: lighterColor));
    return colors;
  }

  Color _getSteppedColor(Color color, int index, int steps,
      {Color? darker, Color? lighter}) {
    final fraction = index / steps;
    return Color(
      r: color.r + ((255 - color.r) * fraction).round(),
      g: color.g + ((255 - color.g) * fraction).round(),
      b: color.b + ((255 - color.b) * fraction).round(),
      a: color.a + ((255 - color.a) * fraction).round(),
      darker: darker,
      lighter: lighter,
    );
  }
}
