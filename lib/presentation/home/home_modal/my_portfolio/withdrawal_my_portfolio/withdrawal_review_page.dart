import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawalProceedButton.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawal_steps_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/withdrawal_my_portfolio/withdrawal_operation_completed_page.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class WithdrawalReviewPage extends StatefulWidget {
  WithdrawalReviewPage({Key? key}) : super(key: key);

  @override
  _WithdrawalReviewPage createState() => _WithdrawalReviewPage();
}

class _WithdrawalReviewPage extends State<WithdrawalReviewPage> {

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
                      WithdrawalStepsWidget(index: 3),
                      const SizedBox(height: 30),
                      Text('Revise os dados do Saque', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sacar em:', style: TextStyle(fontSize: 16)),
                              Text('Loren Ipsun'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text('Valor do saque', style: TextStyle(fontSize: 16)),
                              Text('R\$3.000,00'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text('Data do saque', style: TextStyle(fontSize: 16)),
                              Text('00/00/0000'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
            nextPage: WithdrawalOperationCompletedPage(),
          ),
        ],
      ),
    );
  }
}


