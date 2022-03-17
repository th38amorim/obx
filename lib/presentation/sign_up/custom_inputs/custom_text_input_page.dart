import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obenx_com_br_app/presentation/sign_up/misc/sign_up_form_screen_config.dart';
import 'package:obenx_com_br_app/presentation/sign_up/widgets/input_label_widget.dart';
import 'package:obenx_com_br_app/presentation/sign_up/widgets/section_name_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class CustomTextInputPage extends StatefulWidget {
  const CustomTextInputPage(
      {Key? key, required this.index, required this.pageController})
      : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _CustomTextInputPageState createState() => _CustomTextInputPageState();
}
class _CustomTextInputPageState extends State<CustomTextInputPage> {
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
