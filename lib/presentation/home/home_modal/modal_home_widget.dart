import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/widgets/modal_tabs_widget.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/widgets/user_investiments_widget.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/widgets/personal_data_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ModalHomeWidget extends StatelessWidget {
  ModalHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundDarkColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(50),
            topRight: const Radius.circular(50),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                ModalTabsWidget(),
                PersonalDataWidget(),
                UserInvestimentsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
