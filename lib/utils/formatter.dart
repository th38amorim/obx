import 'package:intl/intl.dart';

/// Classe com métodos de formatação padrões do sistema.
/// Por exemplo: dinheiro, telefone, CPF.
abstract class Formatter {

  static String currencyFormatter(num value, {bool showCipher = true}) {
    var currency = showCipher ? 'R\$ ' : '';
    return currency + NumberFormat('#,##0.00', 'pt_BR').format(value);
  }
}
