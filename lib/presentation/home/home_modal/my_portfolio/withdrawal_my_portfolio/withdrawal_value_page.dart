import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawalProceedButton.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawal_steps_widget.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/my_portfolio/withdrawal_my_portfolio/withdrawal_review_page.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class WithdrawalValuePage extends StatefulWidget {
  WithdrawalValuePage({Key? key}) : super(key: key);

  @override
  _WithdrawalValuePage createState() => _WithdrawalValuePage();
}

class _WithdrawalValuePage extends State<WithdrawalValuePage> {

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
                      WithdrawalStepsWidget(index: 2),
                      const SizedBox(height: 30),
                      Text('Valor do Saque', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              color: Color(0xFFF5F5F9),
                              child: Form(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'R\$',
                                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text('Data do Saque', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              color: Color(0xFFF5F5F9),
                              child: Form(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '00/00/0000',
                                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Produto', style: TextStyle(fontSize: 16)),
                              Text('Loren Ipsun'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text('Grau de risco do produto', style: TextStyle(fontSize: 16)),
                              Text('Loren Ipsun'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text('Saque mínimo', style: TextStyle(fontSize: 16)),
                              Text('R\$3.000,00'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text('Aplicação mínima inicial', style: TextStyle(fontSize: 16)),
                              Text('R\$'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
            nextPage: WithdrawalReviewPage(),
          ),
        ],
      ),
    );
  }
}


