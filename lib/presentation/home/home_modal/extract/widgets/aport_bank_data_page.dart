import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/home/home_overview/widgets/custom_bottomsheet_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class AportBankDataPage extends StatelessWidget {
  AportBankDataPage({Key? key}) : super(key: key);

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
                  Text('Dados Bancários', style: TextStyles.titles.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25),
                  Text('Confira aqui os nossos dados\nbancários para realizar os aportes', style: TextStyles.subtitles.copyWith(color: Colors.white70), textAlign: TextAlign.center),
                  const SizedBox(height: 15),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFF51515E),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Bradesco', style: TextStyle(color: Color(0xFFF5F5F9), fontWeight: FontWeight.bold)),
                                  Text('237', style: TextStyle(color: Color(0xFFF5F5F9),fontWeight: FontWeight.bold))
                                ],
                              ),
                              const SizedBox(height: 35),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nome da Conta', style: TextStyle(color: Color(0xFFF5F5F9))),
                                  Text('ObenX Investimentos LTDA', style: TextStyle(color: Color(0xFFF5F5F9)))
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('CNPJ', style: TextStyle(color: Color(0xFFF5F5F9))),
                                  Text('0000.0000.000/00-1.', style: TextStyle(color: Color(0xFFF5F5F9)))
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Conta Corrente', style: TextStyle(color: Color(0xFFF5F5F9))),
                                  Text('00000-00', style: TextStyle(color: Color(0xFFF5F5F9)))
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Agência', style: TextStyle(color: Color(0xFFF5F5F9))),
                                  Text('00000-00', style: TextStyle(color: Color(0xFFF5F5F9)))
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),                        
                      );
                    }, 
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 15);
                    }, 
                    itemCount: 2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
