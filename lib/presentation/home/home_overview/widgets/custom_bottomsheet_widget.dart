import 'package:flutter/material.dart';
import 'package:obx_com_br_app/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/home/home_overview/home_overview_page.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_overview_page.dart';
import 'package:obx_com_br_app/presentation/registration_data/registration_data_overview_page.dart';
import 'package:obx_com_br_app/presentation/sign_in/sign_in_form_page.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class MenuOptionsWidget extends StatefulWidget {
  const MenuOptionsWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.icon = const Icon(Icons.arrow_forward, color: Colors.white70),
  }) : super(key: key);

  final String label;
  final Icon icon;
  final GestureTapCallback onTap;

  @override
  _MenuOptionsWidgetState createState() => _MenuOptionsWidgetState();
}

class _MenuOptionsWidgetState extends State<MenuOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            height: 55,
            color: Color(0XFF26262B),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(widget.label, style: TextStyles.subtitles.copyWith(color: Colors.white70, fontSize: 16)),
                  Spacer(),
                 widget.icon
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

menuBottomSheetWidget(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: backgroundDarkColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(50),
        topRight: const Radius.circular(50),
      ),
    ),
    context: context,
    builder: (BuildContext c) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.78,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 50, 0, 50),
              child: Row(
                children: [
                  Icon(Icons.camera_alt_outlined, color: Colors.white),
                  const SizedBox(width: 20),
                  Text('Gabriela Lima', style: TextStyles.titles)
                ],
              ),
            ),
            MenuOptionsWidget(label: 'Home', onTap: () => pushToPage(context, HomeOverviewPage())),
            MenuOptionsWidget(label: 'Perfil do investidor', onTap: () => pushToPage(context, InvestorProfileOverviewPage())),
            MenuOptionsWidget(label: 'Dados cadastrais', onTap: () => pushToPage(context, RegistrationDataOverviewPage())),
            MenuOptionsWidget(label: 'Encerrar conta', onTap: () {}),
            MenuOptionsWidget(label: 'Suporte', onTap: () {}),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: ElevatedButton(
                  onPressed: () => popAllAndPush(context, SignInFormPage()),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(270, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(backgroundDarkColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(side: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                  ),
                  child: Text('Sair', style: TextStyle(color: primaryColor, fontSize: 16)),
              ),
            ),
          ],
        ),
      );
    },
  );
}
