import 'package:flutter/material.dart';
import 'package:obx_com_br_app/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/common/charts/points.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/portfolio_details_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class MyPortfolioDetailsPage extends StatelessWidget {
  MyPortfolioDetailsPage({Key? key, required this.applyPage, required this.buttonLabel}) : super(key: key);

  final Widget applyPage;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkColor,
      bottomSheet: BottomSheet(
        backgroundColor: backgroundDarkColor,
        onClosing: () {}, 
        builder: (BuildContext context) {
          return Container(
            height: 70,
            color: backgroundDarkColor,
            child: Center(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  gradient: TextStyles.gradientColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () => pushToPage(context, applyPage),
                  style: TextStyles.buttonStyle,
                  child: Text(buttonLabel, style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: backgroundDarkColor,
        elevation: 0,
        title: Text('Fundos de investimento | Detalhes', style: TextStyles.subtitles.copyWith(fontSize: 18, color: Colors.white70),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              PortfolioDetailsWidget(
                label: 'Aplicação',
                labelField: 'Loren Ipsun'.toUpperCase(),
              ),
              PortfolioDetailsWidget(
                label: 'Tipo',
                labelField: 'Fundo de investimento',
              ),
              PortfolioDetailsWidget(
                label: 'Perfil',
                labelField: 'Conservador',
              ),
              PortfolioDetailsWidget(
                label: 'Objetivo',
                labelField: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
              ),
              PortfolioDetailsWidget(
                label: 'Características',
                labelField: 'Movimentação mínima',
                description: 'R\$200,00',
                darkMode: false,
              ),
              PortfolioDetailsWidget(
                labelField: 'Aplicação inicial mínima',
                description: 'R\$5.000,00',
                darkMode: false,
              ),
              PortfolioDetailsWidget(
                labelField: 'Saldo mínimo de permanência',
                description: 'R\$5.000,00',
                darkMode: false,
              ),
              const SizedBox(height: 20),
              PortfolioDetailsWidget(
                labelField: 'Taxa de Administração',
                valueInEnd: '0,34%',
              ),
              PortfolioDetailsWidget(
                labelField: 'Taxa de Perfomance',
                valueInEnd: '0,34%',
              ),
              PortfolioDetailsWidget(
                labelField: 'Aplicação (Cotização)',
                valueInEnd: 'D+0',
              ),
              PortfolioDetailsWidget(
                labelField: 'Resgate (Cotização)',
                valueInEnd: '0,34%',
              ),
              PortfolioDetailsWidget(
                labelField: 'Horário (Aplicação e Resgate)',
                valueInEnd: '14:00',
              ),
              PortfolioDetailsWidget(
                labelField: 'Patrimônio Líquido',
                valueInEnd: 'R\$545.511,00',
              ),
              PortfolioDetailsWidget(
                labelField: 'Saque de Rendimento',
                valueInEnd: 'Disponível para saque\nde rendimento',
              ),
              const SizedBox(height: 20),
              SizedBox(height: 200, child: SimpleTimeSeriesChart.withSampleData()),
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50,
                      color: Color(0xFFF5F5F9),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/document-icon.png', scale: 3.5),
                            const SizedBox(width: 15),
                            Text('Documento.PDF'.toUpperCase(), style: TextStyle(color: Colors.black54)),
                            Spacer(),
                            Icon(Icons.arrow_downward, color: primaryColor, size: 28),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
