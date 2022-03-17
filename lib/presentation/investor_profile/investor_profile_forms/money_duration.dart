import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/invested_volume.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_tabs.dart';

class MoneyDuration extends StatefulWidget {
  const MoneyDuration({ Key? key }) : super(key: key);

  @override
  _MoneyDurationState createState() => _MoneyDurationState();
}

class _MoneyDurationState extends State<MoneyDuration> {

  int _group = 1;

  @override
  Widget build(BuildContext context) {
    return InvestorProfileTabs(
      nextPage: InvestedVolume(),
      label: 'Por quanto tempo pretende deixar o dinheiro investido na ObenX?',
      optionsInvestorProfile: [
        OptionsInvestorProfile(
          label: 'Por até um ano porque devo precisar desses recursos',
          value: 1,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Entre 1 e 5 anos, pois quero alcançar um objetivo específico, mas posso precisar dos recursos antes do tempo',
          value: 2,
          groupValue: _group,
          onChanged: (changedValue) {
            setState(() {
              _group = changedValue;
            });
          },
        ),
        OptionsInvestorProfile(
          label: 'Por mais de 5 anos, já que tenho objetivos de longo prazo',
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

