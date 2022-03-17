import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/invest_products/investment_fund%20_application/application_review_page.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/invest_products/widgets/application_steps_widget.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawalProceedButton.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ApplicationTermsPage extends StatefulWidget {
  ApplicationTermsPage({Key? key}) : super(key: key);

  @override
  _ApplicationTermsPage createState() => _ApplicationTermsPage();
}

class _ApplicationTermsPage extends State<ApplicationTermsPage> {

  bool? _checkedValue = false;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ApplicationStepsWidget(index: 2),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Precisa aceitar os termos abaixo:', style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 40),
                            Card(
                              color: Color(0xFFF5F5F9),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Declaro para os devidos fins que li os termos abaixo e estou de acordo com todos os termos estabelecidos nos presentes documentos, sendo certo que a validade dos mesmos deve ser considerada como iniciada da data da minha primeira aplicação na classe de produtos obtidos dos',
                                      style: TextStyle(color: Color(0xFF8F8F97)),
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.grey,
                                          value: _checkedValue, 
                                          onChanged: (value) {
                                            setState(() {
                                              _checkedValue = value;
                                            });
                                          },
                                        ),
                                        Text('Li e aceito os termos listados', style: TextStyle(color: Color(0xFF8F8F97)))
                                      ],
                                    ),
                                  ],
                                ),   
                              ),
                            ),
                            const SizedBox(height: 40),
                            Text('Faça o download para ler o arquivo.', style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 20),
                            ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 1
                              , 
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 5,
                                );
                              },  
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 50,
                                  color: Color(0xFFF5F5F9),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/document-icon.png', scale: 3.5),
                                        const SizedBox(width: 15),
                                        Text('Documento.PDF'.toUpperCase(), style: TextStyle(color: Color(0xFF8F8F97))),
                                        Spacer(),
                                        Icon(Icons.arrow_downward, color: primaryColor, size: 28),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: _checkedValue!,
            child: WithdrawalProceedButton(
              nextPage: ApplicationReviewPage(),
            ),  
          ),
        ],
      ),
    );
  }
}


