import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/registration_data/widgets/account_data_itens_widget.dart';
import 'package:obx_com_br_app/presentation/registration_data/widgets/account_data_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class ContactInformationTab extends StatelessWidget {
  const ContactInformationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: AccountDataTabs(
        label: 'Informações de contato',
        personalDataItens: [
          AccountDataItens(field: 'E-mail', label: 'gabriela@gmail.com'),
          AccountDataItens(field: 'Telefone', label: '(15) 99639-5401'),
        ],
      ),
    );
  }
}
