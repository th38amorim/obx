import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/registration_data/widgets/account_data_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class ProfessionalAndFinancialTab extends StatelessWidget {
  const ProfessionalAndFinancialTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: AccountDataTabs(
        label: 'Dados profissionais e\nFinanceiros',
        financesDataItens: [
          FinancesDataItens(subtitle: 'Dados Profissionais', field: 'Profissão', label: 'Desenvolvedor Mobile'),
          FinancesDataItens(subtitle: 'Dados Financeiros', field: 'Renda mensal', label: 'R\$00,00'),
          FinancesDataItens(field: 'Renda Anual Aproximada', label: 'R\$00,00'),
          FinancesDataItens(subtitle: 'Patrimônio Estimado por Categoria', field: 'Bens Móveis', label: 'R\$00,00'),
          FinancesDataItens(field: 'Bens Imóveis', label: 'R\$00,00'),
          FinancesDataItens(field: 'Previdência', label: 'R\$00,00'),
          FinancesDataItens(field: 'Outros', label: 'R\$00,00'),
          FinancesDataItens(field: 'Patrimônio Total Aproximado', label: 'R\$00,00'),
        ],
      ),
    );
  }
}

class FinancesDataItens extends StatelessWidget {
  const FinancesDataItens({
    Key? key,
    required this.field,
    required this.label, 
    this.subtitle = '',
  }) : super(key: key);

  final String field;
  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            color: backgroundDarkColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: subtitle != '',
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Text(subtitle, style: TextStyles.titles.copyWith(fontSize: 20)),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                Text(field, style: TextStyles.subtitles.copyWith(fontSize: 16, color: Colors.white)),
                const SizedBox(height: 7),
                Text(label, style: TextStyles.subtitles.copyWith(fontSize: 16)),
                Divider(height: 15, thickness: 0.5, color: primaryColor),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
