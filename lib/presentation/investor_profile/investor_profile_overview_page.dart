import 'package:flutter/material.dart';
import 'package:obx_com_br_app/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/main_objective.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class InvestorProfileOverviewPage extends StatefulWidget {
  const InvestorProfileOverviewPage({ Key? key }) : super(key: key);

  @override
  _InvestorProfileOverviewPageState createState() => _InvestorProfileOverviewPageState();
}

class _InvestorProfileOverviewPageState extends State<InvestorProfileOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundDarkColor,
        appBar: AppBar(
          backgroundColor: backgroundDarkColor,
          title: Text('Perfil do investidor', style: TextStyles.subtitles),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Divider(height: 10, thickness: 0.5, color: primaryColor),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/pencil-icon.png', scale: 2),
                  ),
                  const SizedBox(height: 50),
                  Text('Perfil do investidor', style: TextStyles.titles),
                  const SizedBox(height: 40),
                  Container(height: 2, width: 100, color: primaryColor),
                  const SizedBox(height: 40),
                  Text(
                    'Agora vamos traçar o seu perfil\nde investidor e descobrir qual\né o seu perfil e fazer bons\ninvestimentos', 
                    style: TextStyles.subtitles.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 180),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      gradient: TextStyles.gradientColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ElevatedButton(
                      onPressed: () => pushToPage(context, MainObjective()),
                      style: TextStyles.buttonStyle,
                      child: Text('Começar', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}