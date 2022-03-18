import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class ComplementFieldWidget extends StatefulWidget {
  const ComplementFieldWidget({Key? key}) : super(key: key);

  @override
  _ComplementFieldWidgetState createState() => _ComplementFieldWidgetState();
}

class _ComplementFieldWidgetState extends State<ComplementFieldWidget> {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listenWhen: (previous, current) => previous.isCepLoading != current.isCepLoading && !current.isCepLoading,
      buildWhen: (previous, current) => previous.isCepLoading != current.isCepLoading && !current.isCepLoading,
      listener: (context, state) {
        setState(() {
        textEditingController.text = context.read<SignUpFormCubit>().user.complement;
        textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));
        });
      },
      builder: (context, state) {
        Widget field = Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Text('Complemento', style: TextStyles.titles, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                    controller: textEditingController,
                    onChanged: (value) => context.read<SignUpFormCubit>().fieldChanged('complement', value),
                    decoration: InputDecoration(
                      fillColor: Color(0xFF51515E),
                      filled: true,
                      hintText: 'Ex: Apto 20 Bloco 3',
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorStyle: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
        if(textEditingController.text.isEmpty && !state.isCepLoading) {
          textEditingController.text = context.watch<SignUpFormCubit>().user.complement;
        }
        return field;
      });
  }
}
