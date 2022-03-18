import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/sign_up/sections_confirmations/access_data/access_data_sections_status.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class AccessDataSectionConfirm extends StatelessWidget {
  const AccessDataSectionConfirm({ Key? key }) : super(key: key);

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
                  'Você completou a primeira etapa.\nAgora vamos partir para as próximas.',
                   style: TextStyles.subtitles,
                   textAlign: TextAlign.center,
                ),
                AccessDataSectionsStatus(),
              ],
            ),
          ),
        );
      },
    );
  }
}