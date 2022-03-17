import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obenx_com_br_app/presentation/sign_up/widgets/input_select_widget.dart';
import 'package:obenx_com_br_app/presentation/sign_up/widgets/section_name_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class CustomSelectPage extends StatefulWidget {
  const CustomSelectPage(
      {Key? key, required this.index, required this.pageController})
      : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _CustomSelectPageState createState() => _CustomSelectPageState();
}

class _CustomSelectPageState extends State<CustomSelectPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
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
                  Column(
                    children: [
                      Text(state.configs[widget.index].label, style: TextStyles.titles, textAlign: TextAlign.center),
                      const SizedBox(height: 70),
                      InputSelectWidget(index: widget.index, pageController: widget.pageController),
                    ],
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
