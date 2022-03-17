import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/home/home_overview/home_overview_page.dart';
import 'package:obenx_com_br_app/presentation/investor_profile/investor_profile_overview_page.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class InvestorProfileResult extends StatelessWidget {
  const InvestorProfileResult({ Key? key }) : super(key: key);

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
                  Text('Seu perfil de investidor é:', style: TextStyles.subtitles),
                  const SizedBox(height: 20),
                  Text('Conservador'.toUpperCase(), style: TextStyles.titles.copyWith(fontSize: 22)),
                  const SizedBox(height: 20),
                  Container(height: 2, width: 100, color: primaryColor),
                  const SizedBox(height: 40),
                  Text(
                    'Caso não se identifique com o perfil\nexibido, clique em "Refazer" para\nretomar ao questionári e alterar suas respostas.', 
                    style: TextStyles.subtitles.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      gradient: TextStyles.gradientColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ElevatedButton(
                      onPressed: () => popAllAndPush(context, HomeOverviewPage()),
                      style: TextStyles.buttonStyle,
                      child: Text('Continuar', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ElevatedButton(
                      onPressed: () => popAllAndPush(context, InvestorProfileOverviewPage()),
                      style: TextStyles.darkButtonStyle,
                      child: Text('Refazer'),
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