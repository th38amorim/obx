import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/variable_income-past_investments.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';

class LowerInvestments extends StatefulWidget {
  const LowerInvestments({ Key? key }) : super(key: key);

  @override
  _LowerInvestmentsState createState() => _LowerInvestmentsState();
}

class _LowerInvestmentsState extends State<LowerInvestments> {

  int _group = 1;

  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      nextPage: VariableIncomePastInvestments(),
      label: 'Como você reagiria a uma\nqueda de 30% em um dos\nseus investimentos?',
      optionsInvestorProfile: [
        OptionsInvestorProfile(
          label: 'Venderia imediatamente',
          value: 1,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Observaria por um tempo e, se as perdas continuassem, venderia',
          value: 2,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Buscaria mais informações para decidir se mantenho o investimento ou não',
          value: 3,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Avalio se a queda criou oportunidade para aumentar minha exposição ao investimento',
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

