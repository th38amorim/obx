import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/money_duration.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';

class MainObjective extends StatefulWidget {
  const MainObjective({ Key? key }) : super(key: key);

  @override
  _MainObjectiveState createState() => _MainObjectiveState();
}

class _MainObjectiveState extends State<MainObjective> {

  int _group = 1;

  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      label: 'Qual seu principal\nobjetivo ao investir?',
      nextPage: MoneyDuration(),
      // valueChanged: context.read<InvestorProfileFormCubit>().saved(),
      optionsInvestorProfile: [
        OptionsInvestorProfile(
          label: 'Preservação de patrimônio',
          value: 1,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Combinação entre preservação e valorização do patrimônio, assumindo um risco mediano',
          value: 2,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Maximizar o meu potencial de ganhos assumindo um maior risco',
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

