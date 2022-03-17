import 'package:charts_flutter/flutter.dart';
import 'package:obenx_com_br_app/presentation/common/charts/palettes/palette.dart';

class MaterialSalmon extends Palette {
  static const _shade200 = Color(r: 0xF8, g: 0x7A, b: 0x67); //#F87A67
  static const _shade500 = Color(r: 0xF5, g: 0x80, b: 0x80, darker: _shade700, lighter: _shade200); //#F58084
  static const _shade700 = Color(r: 0xF2, g: 0x87, b: 0xA2); //#F287A2

  const MaterialSalmon();

  @override
  Color get shadeDefault => _shade500;
}