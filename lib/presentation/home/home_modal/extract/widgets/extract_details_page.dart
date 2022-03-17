import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/new_password/new_password_page.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/extract/widgets/aport_bank_data_page.dart';
import 'package:obenx_com_br_app/presentation/home/home_overview/widgets/custom_bottomsheet_widget.dart';
import 'package:obenx_com_br_app/presentation/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ExtractDetailsPage extends StatelessWidget {
  ExtractDetailsPage({Key? key}) : super(key: key);

  static DateTime now = DateTime.now();
  static List months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];
  final currentMonth = now.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Image.asset('assets/obenx_logo.png', color: Colors.black, width: 150),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => menuBottomSheetWidget(context),
          child: Icon(Icons.list, color: Colors.black),
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Divider(height: 15, thickness: 0.5, color: Colors.black),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 45, 20, 25),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(now.day.toString() + ' de ' + months[(currentMonth - 1)].toString() + ', ' + now.year.toString())),
          ),
          Expanded(
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Container(height: 3, width: 150, color: primaryColor),
                      ],
                    ),
                  ),
                  Text('Extrato', style: TextStyles.titles.copyWith(fontWeight: FontWeight.w300)),
                  const SizedBox(height: 25),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFF51515E),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Aporte - Fundos de Investimento'.toUpperCase(), style: TextStyles.titles.copyWith(fontSize: 18, fontWeight: FontWeight.w900)),
                              const SizedBox(height: 25),
                              Text('Aplicação em:', style: TextStyles.titles.copyWith(fontSize: 18)),
                              const SizedBox(height: 5),
                              Text('Loren Ipsun'.toUpperCase(), style: TextStyles.subtitles),
                              const SizedBox(height: 40),
                              Text('Valor da aplicação', style: TextStyles.titles.copyWith(fontSize: 18)),
                              const SizedBox(height: 5),
                              Text('R\$3.000,00', style: TextStyles.subtitles),
                              const SizedBox(height: 40),
                              Text('Data da aplicação', style: TextStyles.titles.copyWith(fontSize: 18)),
                              const SizedBox(height: 5),
                              Text('00/00/0000', style: TextStyles.subtitles),
                              const SizedBox(height: 40),
                              Text('Consultor(a):', style: TextStyles.titles.copyWith(fontSize: 18)),
                              const SizedBox(height: 5),
                              Text('#1233 Gabriela Lima de Oliveira', style: TextStyles.subtitles),
                              const SizedBox(height: 40),
                              Text('Status', style: TextStyles.titles.copyWith(fontSize: 18)),
                              const SizedBox(height: 5),
                              Text('Liberado', style: TextStyle(color: Colors.yellow[300], fontSize: 16)),
                              const SizedBox(height: 40),
                              GestureDetector(
                                onTap: () => pushToPage(context, AportBankDataPage()),
                                child: Text('Dados Bancários para realizar aporte', style: TextStyle(decoration: TextDecoration.underline, color: Colors.white, fontSize: 16)),
                              ),
                              const SizedBox(height: 30),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      gradient: TextStyles.gradientColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () => pushToPage(context, NewPasswordPage()),
                                      style: TextStyles.buttonStyle,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.cloud_upload_outlined, color: Colors.black),
                                          const SizedBox(width: 10),
                                          Text('Anexar comprovante', style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
