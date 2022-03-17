import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/common/saving_progress_overlay.dart';
import 'package:obenx_com_br_app/presentation/sign_up/documents_analysis/documents_analysis_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/misc/sign_up_form_screen_config.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class CustomBankConfirmPage extends StatelessWidget {
  CustomBankConfirmPage(
      {Key? key,
      required this.pageController,
      required this.configs,
      required this.returnSize,
      required this.index,
      required this.start})
      : super(key: key);

  final PageController pageController;
  final List<SignUpFormScreenConfig> configs;
  final int returnSize;
  final int start;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
        return Scaffold(
          backgroundColor: backgroundDarkColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Column(
                        children: [
                          Image.asset('assets/obenx_logo.png', width: 150),
                          const Divider(height: 100, thickness: 0.5, color: primaryColor,),
                          Icon(Icons.check, color: primaryColor, size: 40),
                          const SizedBox(height: 30),
                          Text(context.read<SignUpFormCubit>().getFieldValue('fullName') + ', ', style: TextStyles.titles),
                          const SizedBox(height: 10),
                          Text('Verifique os seus dados!', style: TextStyles.infoMessage,),
                          const SizedBox(height: 40),
                          Text('Para continuar seu cadastro,\nconfira os dados abaixo:', style: TextStyles.infoMessage, textAlign: TextAlign.center),
                          const SizedBox(height: 50),
                        ],
                      ),
                      Container(
                        height: 300,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 40, 25, 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Banco: ' + context.read<SignUpFormCubit>().getFieldValue('bank'), style: TextStyles.textConfirmPage),
                                    const SizedBox(height: 10),
                                    Text('Agência: ' + context.read<SignUpFormCubit>().getFieldValue('agency'), style: TextStyles.textConfirmPage),
                                    const SizedBox(height: 10),
                                    Text('Conta corrente: ' + context.read<SignUpFormCubit>().getFieldValue('numberAccount'), style: TextStyles.textConfirmPage),
                                    ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    pageController.animateToPage(
                                      start,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all<double>(2),
                                    fixedSize: MaterialStateProperty.all<Size>(Size(170, 45)),
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                                  ),
                                  child: Text('Editar', style: TextStyle(color: Colors.black)),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: TextStyles.gradientColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await context.read<SignUpFormCubit>().postData(start, returnSize - start);
                                      pushAndReplaceToPage(context, DocumentsAnalysis());
                                    },
                                    style: TextStyles.buttonStyle,
                                    child: Text('Confirmar', style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lock_outline, color: Colors.white60,),
                            const SizedBox(width: 10),
                            Text('Todos os dados preenchidos são seguros', style: TextStyle(color: Colors.white60),)
                          ],
                        ),
                      )
                    ],
                  ),
                  SavingInProgressOverlay(isEnabled: state.isSaving)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
