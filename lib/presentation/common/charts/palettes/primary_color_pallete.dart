import 'package:charts_flutter/flutter.dart';
import 'package:obx_com_br_app/presentation/common/charts/palettes/palette.dart';

class PrimaryColorViolet extends Palette {
  static const _shade200 = Color(r: 0xDA, g: 0xC9, b: 0x99); //#DAC999
  static const _shade500 = Color(r: 0xDA, g: 0xC9, b: 0x99, darker: _shade700, lighter: _shade200); //#DAC999
  static const _shade700 = Color(r: 0xDA, g: 0xC9, b: 0x99); //#DAC999

  const PrimaryColorViolet();

  @override
  Color get shadeDefault => _shade500;
}