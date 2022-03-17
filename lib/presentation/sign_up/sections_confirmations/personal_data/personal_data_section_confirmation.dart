import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/presentation/sign_up/sections_confirmations/personal_data/personal_data_section_status.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class PersonalDataSectionConfirm extends StatelessWidget {
  const PersonalDataSectionConfirm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {
      },
      builder: (BuildContext context, SignUpFormState state) {
        return Scaffold(
          backgroundColor: backgroundDarkColor,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 70),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/checkmark-circle-outline.png', height: 100),
                ),
                const SizedBox(height: 70),
                Text('Pronto!', style: TextStyles.titles),
                const SizedBox(height: 15),
                Text(
                  'Você completou a segunda etapa.\nAgora vamos partir para as próximas.',
                   style: TextStyles.subtitles,
                   textAlign: TextAlign.center,
                ),
                PersonalDataSectionsStatus(),
              ],
            ),
          ),
        );
      },
    );
  }
}