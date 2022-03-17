import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/sign_up/sign_up_scaffold_page.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class AddressSectionsStatus extends StatelessWidget {
  const AddressSectionsStatus(
      {Key? key,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {
      },
      builder: (BuildContext context, SignUpFormState state) {
        return Column(
          children: [
            const SizedBox(height: 50),
            Container(
              height: 55,
              color: Color(0xFF26262B),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [  
                    Text('Dados de acesso', style: TextStyles.subtitles.copyWith(fontSize: 15, color:  Colors.white60)),
                    Spacer(),
                    Icon(Icons.check, color: Colors.white54),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF26262B),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text('Dados pessoais', style: TextStyles.subtitles.copyWith(fontSize: 15, color:  Colors.white60)),
                      Spacer(),
                      Icon(Icons.check, color: Colors.white54),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF26262B),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text('Dados pessoais', style: TextStyles.subtitles.copyWith(fontSize: 15, color:  Colors.white60)),
                      Spacer(),
                      Icon(Icons.check, color: Colors.white54),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  NumberFormController.currentForm++;
                  pushAndReplaceToPage(context, SignUpScaffoldPage());
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Text('Financeiro e profissional', style: TextStyles.subtitles.copyWith(fontSize: 15, color:  Colors.black)),
                          Spacer(),
                          Text('Avançar', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 7),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF26262B),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text('Dados bancários', style: TextStyles.subtitles.copyWith(fontSize: 15, color:  Colors.white12)),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
