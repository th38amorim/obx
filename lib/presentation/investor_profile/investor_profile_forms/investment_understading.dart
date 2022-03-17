import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/risk_tolerance.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';

class InvestmentUnderstanding extends StatefulWidget {
  const InvestmentUnderstanding({ Key? key }) : super(key: key);

  @override
  _InvestmentUnderstandingState createState() => _InvestmentUnderstandingState();
}

class _InvestmentUnderstandingState extends State<InvestmentUnderstanding> {

  int _group = 1;

  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      nextPage: RiskTolerance(),
      label: 'Como você avalia o seu\nconhecimento sobre\n investimentos?',
      optionsInvestorProfile: [
        OptionsInvestorProfile(
          label: 'Não tenho conhecimento',
          value: 1,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Razoável',
          value: 2,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Bom',
          value: 3,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Excelente',
          value: 4,
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

