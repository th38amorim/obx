import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class SignUpProceedButtonWidget extends StatelessWidget {
  const SignUpProceedButtonWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.index,
    required this.textEditingController,
    required this.pageController,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final int index;
  final TextEditingController textEditingController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            gradient: TextStyles.gradientColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                  context.read<SignUpFormCubit>().fieldChanged(state.configs[index].modelName, textEditingController.text);
                  pageController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
              }
            },
            style: TextStyles.buttonStyle,
            child: Text('Avançar', style: TextStyle(color: Colors.black)),
          ),
        );
      },
    );
  }
}
