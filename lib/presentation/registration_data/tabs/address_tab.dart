import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/registration_data/widgets/account_data_itens_widget.dart';
import 'package:obx_com_br_app/presentation/registration_data/widgets/account_data_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class AddressTab extends StatelessWidget {
  const AddressTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: AccountDataTabs(
        label: 'Informações de contato',
        personalDataItens: [
          AccountDataItens(field: 'CEP', label: '18077-430'),
          AccountDataItens(field: 'Logradouro', label: 'Rua Pedro Carrasco Montalban'),
          AccountDataItens(field: 'Número', label: '191'),
          AccountDataItens(field: 'Bairro', label: 'Parque das Laranjeiras'),
          AccountDataItens(field: 'Cidade', label: 'Sorocaba'),
          AccountDataItens(field: 'Estado', label: 'SP'),
          AccountDataItens(field: 'País', label: 'Brasil'),
          AccountDataItens(field: 'Complemento', label: ''),
        ],
      ),
    );
  }
}
