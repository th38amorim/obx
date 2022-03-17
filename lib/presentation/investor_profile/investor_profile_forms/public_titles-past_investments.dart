import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/current_actives.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';

class PublicTitlesPastInvestments extends StatefulWidget {
  const PublicTitlesPastInvestments({ Key? key }) : super(key: key);

  @override
  _PublicTitlesPastInvestmentsState createState() => _PublicTitlesPastInvestmentsState();
}

class _PublicTitlesPastInvestmentsState extends State<PublicTitlesPastInvestments> {

  int _group = 1;

  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      nextPage: CurrentActives(),
      label: 'Você possui familiaridade ou já realizou investimentos de algum desses tipos no passado?',
      description: 'Renda Fixa: Títulos públicos, CDBs, Debêmtures e outros títulos privados',
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

