import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/sign_up/documents_analysis/widgets/social_networks.dart';
import 'package:obx_com_br_app/presentation/sign_up/sign_up_scaffold_page.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class DocumentsAnalysis extends StatelessWidget {
  const DocumentsAnalysis({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpFormCubit(NumberFormController.user,config: NumberFormController.currentForm),
      child: BlocConsumer<SignUpFormCubit, SignUpFormState>(
        listener: (BuildContext context, SignUpFormState state) {},
        builder: (BuildContext context, SignUpFormState state) {
          return Scaffold(
            backgroundColor: backgroundDarkColor,
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/obenx_logo.png', scale: 3),
                  ),
                  const SizedBox(height: 60),
                  Image.asset('assets/document-icon.png', height: 70),
                  const SizedBox(height: 30),
                  Text(context.read<SignUpFormCubit>().getFieldValue('fullName') + ',', style: TextStyles.titles),
                  const SizedBox(height: 20),
                  Text('Agora falta pouco!', style: TextStyles.subtitles),
                  const SizedBox(height: 50),
                  Text('Para abrir sua conta com segurança,\nprecisamos analisar os seus\ndocumentos.', style: TextStyles.subtitles, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Text('Assim que a análise for feita,\nvamos te enviar um email com os\npróximos passos.', style: TextStyles.subtitles, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Text('Se tiver alguma dúvida, entre em contato:\nAtendimento@obenx.com', style: TextStyles.subtitles, textAlign: TextAlign.center),
                  const SizedBox(height: 90),
                  SocialNetworksWidget(),
                  Spacer(),
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
            ),
          );
        }
      )
    );
  }
}