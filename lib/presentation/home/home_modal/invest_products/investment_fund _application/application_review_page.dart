import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/invest_products/investment_fund%20_application/application_consultant_page.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/invest_products/widgets/application_steps_widget.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawalProceedButton.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ApplicationReviewPage extends StatelessWidget {
  ApplicationReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkColor,
      appBar: AppBar(
        backgroundColor: backgroundDarkColor,
        elevation: 0,
        title: Text(
          'Fundos de investimento | Saque',
          style: TextStyles.subtitles.copyWith(fontSize: 18, color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Divider(height: 10, thickness: 0.5, color: primaryColor),
              const SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ApplicationStepsWidget(index: 3),
                      const SizedBox(height: 30),
                      Text('Revise os dados da aplicação', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Aplicação em:', style: TextStyle(fontSize: 14)),
                              Text('Loren Ipsun'.toUpperCase(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text('Valor da aplicação', style: TextStyle(fontSize: 14)),
                              Text('R\$3.000,00'.toUpperCase(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text('Data do aplicação', style: TextStyle(fontSize: 14)),
                              Text('00/00/0000'.toUpperCase(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          WithdrawalProceedButton(
            nextPage: ApplicationConsultantPage(),
          ),
        ],
      ),
    );
  }
}


