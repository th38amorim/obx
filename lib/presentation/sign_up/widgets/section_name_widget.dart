import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class SectionNameWidget extends StatefulWidget {
  const SectionNameWidget({
    Key? key,
    required this.index,
    required this.pageController,
  }) : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _SectionNameWidgetState createState() => _SectionNameWidgetState();
}

class _SectionNameWidgetState extends State<SectionNameWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: primaryColor,
              ),
            ),
            Container(
              width: 200,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: primaryColor,
              ),
              child: Text(state.configs[widget.index].sectionName,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
