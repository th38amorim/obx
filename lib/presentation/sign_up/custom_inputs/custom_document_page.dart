import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obenx_com_br_app/presentation/sign_up/misc/sign_up_form_screen_config.dart';
import 'package:obenx_com_br_app/presentation/sign_up/widgets/section_name_widget.dart';
import 'package:obenx_com_br_app/presentation/sign_up/widgets/sign_up_proceed_button_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class CustomDocumentPage extends StatefulWidget {
  const CustomDocumentPage(
      {Key? key, required this.index, required this.pageController})
      : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _CustomDocumentPageState createState() => _CustomDocumentPageState();
}
class _CustomDocumentPageState extends State<CustomDocumentPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
        SignUpFormScreenConfig config = state.configs[widget.index];
        return Scaffold(
          appBar: ObenxAppBar(),
          backgroundColor: backgroundDarkColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  SectionNameWidget(index: widget.index, pageController: widget.pageController),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Text(config.label, style: TextStyles.titles, textAlign: TextAlign.center),
                        const SizedBox(height: 100),
                        InputLabelWidget(index: widget.index, pageController: widget.pageController,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

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
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
                keyboardType: state.configs[index].textInputType,
                controller: textEditingController,
                inputFormatters: [
                  TextInputMask(mask: context.read<SignUpFormCubit>().getFieldValue('documentType') == 'RG' ? '99.999.999-9' : '999999999-99')
                ],
                decoration: InputDecoration(
                  fillColor: Color(0xFF51515E),
                  filled: true,
                  hintText: context.read<SignUpFormCubit>().getFieldValue('documentType') == 'RG' ? 'Ex: 39.618.854-9' : 'Ex: 805570594-01',
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
            SizedBox(height: 150),
            SignUpProceedButtonWidget(formKey: _formKey, index: index, textEditingController: textEditingController, pageController: pageController,),
          ],
        );
      });
  }
}
