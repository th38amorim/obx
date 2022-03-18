import 'package:easy_mask/easy_mask.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/sign_up/misc/sign_up_form_screen_config.dart';
import 'package:obx_com_br_app/presentation/sign_up/widgets/sign_up_proceed_button_widget.dart';

class InputLabelWidget extends StatelessWidget {
  InputLabelWidget({
    Key? key,
    required this.index,
    required this.pageController,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final int index;
  final PageController pageController;
  final TextEditingController textEditingController = TextEditingController();

  final currencyController = MoneyMaskedTextController(leftSymbol: 'R\$', );


  List<TextInputFormatter> getTextInputFormatter(InputMaskType inputMaskType) {
    switch(inputMaskType) {
      
      case InputMaskType.CPF:
        return [TextInputMask(mask: '999.999.999-99')];
      case InputMaskType.PHONE:
        return [TextInputMask(mask: '(99) 99999-9999')];
      case InputMaskType.BIRTH:
        return [TextInputMask(mask: '99/99/9999')];
      case InputMaskType.CURRENCY:
        return [TextInputMask(mask: 'R!\$! !9+,999.99')];
      case InputMaskType.EMPTY:
        return [];
    }
  } 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
        textEditingController.text = context.read<SignUpFormCubit>().getFieldValue(state.configs[index].modelName);
        return Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  return state.configs[index].validator.call(value);
                },
                inputFormatters: getTextInputFormatter(state.configs[index].inputMaskType),
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
                keyboardType: state.configs[index].textInputType,
                controller: state.configs[index].modelName == 'monthlyIncome' ? currencyController : textEditingController,
                obscureText: state.configs[index].modelName == 'password' ? true : false,
                decoration: InputDecoration(
                  fillColor: Color(0xFF51515E),
                  filled: true,
                  hintText: state.configs[index].labelPlaceHolder,
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorStyle: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: state.configs[index].modelName == 'cellphone' ? 120 : 150),
            SignUpProceedButtonWidget(formKey: _formKey, index: index, textEditingController: state.configs[index].modelName == 'monthlyIncome' ? currencyController : textEditingController, pageController: pageController,),
          ],
        );
      });
  }
}
