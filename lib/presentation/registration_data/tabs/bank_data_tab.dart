import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/registration_data/widgets/account_data_itens_widget.dart';
import 'package:obx_com_br_app/presentation/registration_data/widgets/account_data_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class BankDataTab extends StatelessWidget {
  const BankDataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: AccountDataTabs(
        label: 'Dados Bancários',
        personalDataItens: [
          AccountDataItens(field: 'Banco', label: 'Bradesco'),
          AccountDataItens(field: 'Agência', label: '0000'),
          AccountDataItens(field: 'Conta Corrente', label: '0000000-0'),
        ],
      ),
    );
  }
}
