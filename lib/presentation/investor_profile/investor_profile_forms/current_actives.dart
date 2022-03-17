import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_result.dart';

class CurrentActives extends StatefulWidget {
  const CurrentActives({Key? key}) : super(key: key);

  @override
  _CurrentActivesState createState() => _CurrentActivesState();
}

class _CurrentActivesState extends State<CurrentActives> {
  bool hasAssets = false;
  bool privatePension = false;
  bool fixedIncome = false;
  bool variableIncome = false;
  bool derivatives = false;


  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      nextPage: InvestorProfileResult(),
      label: 'Selecione quais ativos você possui atualmente na carteira',
      optionsCurrentActives: [
        OptionsCurrentActives(
          label: 'Não possuo ativo', 
          onChanged: (value) {
            setState(() {
              hasAssets = !hasAssets;
            });
          },
          value: hasAssets,
        ),
        OptionsCurrentActives(
          label: 'Previdência Privada', 
          onChanged: (value) {
            setState(() {
              privatePension = !privatePension;
            });
          },
          value: privatePension,
        ),
        OptionsCurrentActives(
          label: 'Renda fixa (títulos públicos, CDBs, Debêntures e outros títulos privados)', 
          onChanged: (value) {
            setState(() {
              fixedIncome = !fixedIncome;
            });
          },
          value: fixedIncome,
        ),
        OptionsCurrentActives(
          label: 'Renda variável (Ações, Fundos, Mercado de Câmbio, Criptomoedas)', 
          onChanged: (value) {
            setState(() {
              variableIncome = !variableIncome;
            });
          },
          value: variableIncome,
        ),
        OptionsCurrentActives(
          label: 'Derivativos (opções, futuros, termos e COE)-', 
          onChanged: (value) {
            setState(() {
              derivatives = !derivatives;
            });
          },
          value: derivatives,
        ),
      ],
    );
  }
}
