import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/domain/core/value_validators.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class StreetFieldWidget extends StatefulWidget {
  const StreetFieldWidget({Key? key}) : super(key: key);

  @override
  _StreetFieldWidgetState createState() => _StreetFieldWidgetState();
}

class _StreetFieldWidgetState extends State<StreetFieldWidget> {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listenWhen: (previous, current) => previous.isCepLoading != current.isCepLoading && !current.isCepLoading,
      buildWhen: (previous, current) => previous.isCepLoading != current.isCepLoading && !current.isCepLoading,
      listener: (context, state) {
        setState(() {
        textEditingController.text = context.read<SignUpFormCubit>().user.street;
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
                  Text('Digite seu logradouro', style: TextStyles.titles, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                    controller: textEditingController,
                    validator: (value) => ValueValidators.validateStringEmpty(textEditingController.text),
                    onChanged: (value) => context.read<SignUpFormCubit>().fieldChanged('street', value),
                    decoration: InputDecoration(
                      fillColor: Color(0xFF51515E),
                      filled: true,
                      hintText: 'Ex: Av. Paulista',
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
          textEditingController.text = context.watch<SignUpFormCubit>().user.street;
        }
        return field;
      });
  }
}
