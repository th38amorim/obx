import 'package:charts_flutter/flutter.dart';
import 'package:obx_com_br_app/presentation/common/charts/palettes/palette.dart';

class MaterialViolet extends Palette {
  static const _shade200 = Color(r: 0x53, g: 0x58, b: 0x95); //#535895
  static const _shade500 = Color(r: 0x65, g: 0x6B, b: 0xB5, darker: _shade700, lighter: _shade200); //#656BB5
  static const _shade700 = Color(r: 0x73, g: 0x7A, b: 0xCF); //#737ACF

  const MaterialViolet();

  @override
  Color get shadeDefault => _shade500;
}