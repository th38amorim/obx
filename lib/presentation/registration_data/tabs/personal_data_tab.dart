import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/registration_data/widgets/account_data_itens_widget.dart';
import 'package:obenx_com_br_app/presentation/registration_data/widgets/account_data_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class PersonalDataTab extends StatelessWidget {
  const PersonalDataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: AccountDataTabs(
        label: 'Informações de contato',
        personalDataItens: [
          AccountDataItens(field: 'Nome', label: 'Gabriela Lima de Oliveira'),
          AccountDataItens(field: 'Estado civil', label: 'Solteiro(a)'),
        ],
      ),
    );
  }
}
