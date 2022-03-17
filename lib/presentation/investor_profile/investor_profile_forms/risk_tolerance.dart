import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/lower_investments.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';

class RiskTolerance extends StatefulWidget {
  const RiskTolerance({ Key? key }) : super(key: key);

  @override
  _RiskToleranceState createState() => _RiskToleranceState();
}

class _RiskToleranceState extends State<RiskTolerance> {

  int _group = 1;

  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      nextPage: LowerInvestments(),
      label: 'Qual a melhor opção para\ndescrever sua tolerância ao risco?',
      optionsInvestorProfile: [
        OptionsInvestorProfile(
          label: 'Baixa: quero rentabilidade acima da poupança com preservação do poder',
          value: 1,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Regular: quero rentabilidade próxima à taxa de juros DI (CDI) e aceito eventuais riscos',
          value: 2,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Média: estou disposto a assumir riscos maiores para superar a taxa de juros DI (CDI)',
          value: 3,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Alta: estou disposto a assumir riscos elevados para alcançar retornos expressivos',
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

