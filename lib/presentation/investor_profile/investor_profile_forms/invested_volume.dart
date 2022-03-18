import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/investment_understading.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';

class InvestedVolume extends StatefulWidget {
  const InvestedVolume({ Key? key }) : super(key: key);

  @override
  _InvestedVolumeState createState() => _InvestedVolumeState();
}

class _InvestedVolumeState extends State<InvestedVolume> {

  int _group = 1;

  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      nextPage: InvestmentUnderstanding(),
      label: 'Qual volume você investiu\nnos últimos 12 meses?',
      optionsInvestorProfile: [
        OptionsInvestorProfile(
          label: 'Até R\$ 25.000',
          value: 1,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Entre R\$ 25.000 e R\$ 50.000',
          value: 2,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Entre R\$ 50.000 e R\$ 150.000',
          value: 3,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Acima de R\$ 150.000',
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

