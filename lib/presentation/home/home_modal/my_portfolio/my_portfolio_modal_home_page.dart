import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/details_my_portfolio/my_portfolio_details_page.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/fields_label_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/portfolio_card_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/rows_with_fields_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/withdrawal_my_portfolio/withdrawal_type_page.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/withdrawal_my_portfolio/withdrawal_value_page.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/widgets/type_of_investor.dart';
import 'package:obx_com_br_app/presentation/home/home_overview/widgets/custom_bottomsheet_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class MyPortfolioModalHomePage extends StatelessWidget {
  MyPortfolioModalHomePage({Key? key}) : super(key: key);

  static DateTime now = DateTime.now();
  static List months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];
  final currentMonth = now.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Center(
                              child: Text('Meu portifólio', style: TextStyles.titles.copyWith(fontSize: 22)),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(Icons.arrow_back, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      RowTypesOfInvestorWidget(),
                      const SizedBox(height: 35),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return PortfolioCardWidget(
                            actionLabel: 'Sacar',
                            detailsPage: MyPortfolioDetailsPage(buttonLabel: 'Sacar', applyPage: WithdrawalValuePage()),
                            cashoutPage: WithdrawalMyPortfolioPage(),
                            gradientColor: TextStyles.gradientBlueColor,
                            label: 'Lore Ipsun',
                            subtitleLabel: 'Renda fixa',
                            rowsWithFields: [
                              RowsWithFields(
                                columnWidget: [
                                  FieldsLabel(
                                    label: '12 meses',
                                    labelValue: '5.68%',
                                  ),
                                  FieldsLabel(
                                    label: 'Aplicação inicial',
                                    labelValue: '1.000,00',
                                  ),
                                  FieldsLabel(
                                    label: 'Resgate em',
                                    labelValue: 'D+1',
                                  ),
                                ],
                              ),
                              RowsWithFields(
                                columnWidget: [
                                  FieldsLabel(
                                    label: 'Mês atual',
                                    labelValue: '5.68%',
                                  ),
                                  FieldsLabel(
                                    label: 'Ano',
                                    labelValue: '1.14%',
                                  ),
                                  FieldsLabel(
                                    label: 'Início do fundo',
                                    labelValue: '00/00/0000',
                                  ),
                                ],
                              ),
                              RowsWithFields(
                                columnWidget: [
                                  FieldsLabel(
                                    label: 'Patrimônio líquido',
                                    labelValue: '5.68%',
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
