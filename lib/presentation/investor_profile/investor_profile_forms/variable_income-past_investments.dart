import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/public_titles-past_investments.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';

class VariableIncomePastInvestments extends StatefulWidget {
  const VariableIncomePastInvestments({ Key? key }) : super(key: key);

  @override
  _VariableIncomePastInvestmentsState createState() => _VariableIncomePastInvestmentsState();
}

class _VariableIncomePastInvestmentsState extends State<VariableIncomePastInvestments> {

  int _group = 1;

  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      nextPage: PublicTitlesPastInvestments(),
      label: 'Você possui familiaridade ou já realizou investimentos de algum desses tipos no passado?',
      description: 'Renda Variável: Ações, Fundos, Mercado de Câmbio, Criptomoedas',
      optionsInvestorProfile: [
        OptionsInvestorProfile(
          label: 'Sim, mas não investi recentemente',
          value: 1,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Sim, investi nos últimos 12 meses',
          value: 2,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Não',
          value: 3,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
      ],
    );
  }
}

