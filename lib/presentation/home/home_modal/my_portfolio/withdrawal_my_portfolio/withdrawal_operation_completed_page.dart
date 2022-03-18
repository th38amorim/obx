import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawalProceedButton.dart';
import 'package:obx_com_br_app/presentation/home/home_overview/home_overview_page.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class WithdrawalOperationCompletedPage extends StatefulWidget {
  WithdrawalOperationCompletedPage({Key? key}) : super(key: key);

  @override
  _WithdrawalOperationCompletedPage createState() => _WithdrawalOperationCompletedPage();
}

class _WithdrawalOperationCompletedPage extends State<WithdrawalOperationCompletedPage> {

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
                      const SizedBox(height: 30),
                      Image.asset('assets/checkmark-circle-outline.png', height: 80),
                      const SizedBox(height: 35),
                      Text('Operação concluída\ncom sucesso!', style: TextStyles.titles.copyWith(color: Colors.black, fontWeight: FontWeight.w800), textAlign: TextAlign.center),
                      const SizedBox(height: 30),
                      Text('O comprovante foi enviado para\n\no e-mail gabriela@alphacode.com', style: TextStyles.textConfirmPage.copyWith(color: Colors.black87, fontSize: 14)),
                      const SizedBox(height: 35),
                      Text('O comprovante ficará\n\ndisponível em Extrato', style: TextStyles.textConfirmPage.copyWith(color: Colors.black87, fontSize: 14)),
                      const SizedBox(height: 35),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all()
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: TextStyles.buttonStyle,
                          child: Text('Ir para Extrato', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              child: Card(
                                color: Color(0xFFEFEFEF),
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  child: Text('Obs.: Esta operação só será efetuada mediante a confirmação do saldo em conta. As operações serão executadas por ordem de solicitação.', style: TextStyle(color: Colors.black87, fontSize: 12),),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 90,
                            left: 154,
                            child: Icon(
                              Icons.fmd_bad,
                              color: Colors.black54,
                              size: 26,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
          WithdrawalProceedButton(
            buttonLabel: 'Finalizar',
            nextPage: HomeOverviewPage(),
          ),
        ],
      ),
    );
  }
}


