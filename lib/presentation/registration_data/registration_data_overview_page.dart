import 'package:flutter/material.dart';
import 'package:obx_com_br_app/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/registration_data/tabs/address_tab.dart';
import 'package:obx_com_br_app/presentation/registration_data/tabs/bank_data_tab.dart';
import 'package:obx_com_br_app/presentation/registration_data/tabs/contact_informations_tab.dart';
import 'package:obx_com_br_app/presentation/registration_data/tabs/personal_data_tab.dart';
import 'package:obx_com_br_app/presentation/registration_data/tabs/professional_and_financial_tab.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class RegistrationDataOverviewPage extends StatelessWidget {
  const RegistrationDataOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          const SizedBox(height: 100),
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
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Dados cadastrais', style: TextStyles.titles.copyWith(fontSize: 22)),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(Icons.arrow_back, color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 70),
                      RegistrationDataOptions(
                        nextPage: ContactInformationTab(),
                        label: 'Informações de contato', 
                        personalDatas: [
                          Text('gabriela@gmail.com', style: TextStyles.subtitles),
                          const SizedBox(height: 3),
                          Text('(15) 99693471', style: TextStyles.subtitles),
                        ],
                      ),
                      RegistrationDataOptions(
                        nextPage: PersonalDataTab(),
                        label: 'Dados pessoais', 
                        personalDatas: [
                          Text('Gabriela Lima', style: TextStyles.subtitles),
                          const SizedBox(height: 3),
                          Text('Solteiro(a)', style: TextStyles.subtitles),
                        ],
                      ),
                      RegistrationDataOptions(
                        nextPage: AddressTab(),
                        label: 'Endereço', 
                        personalDatas: [
                          Text('Brasil', style: TextStyles.subtitles),
                          const SizedBox(height: 3),
                          Text('18077-430', style: TextStyles.subtitles),
                          const SizedBox(height: 3),
                          Text('Rua Pedro Carrasco Montalban', style: TextStyles.subtitles),
                        ],
                      ),
                      RegistrationDataOptions(
                        nextPage: ProfessionalAndFinancialTab(),
                        label: 'Dados profissionais e financeiro', 
                        personalDatas: [
                          Text('Desenvolvedor Mobile', style: TextStyles.subtitles),
                        ],
                      ),
                      RegistrationDataOptions(
                        nextPage: BankDataTab(),
                        label: 'Dados bancários', 
                        personalDatas: [
                          Text('Bradesco', style: TextStyles.subtitles),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegistrationDataOptions extends StatelessWidget {
  const RegistrationDataOptions({
    Key? key, required this.label, required this.personalDatas, required this.nextPage,
  }) : super(key: key);

  final String label;
  final List<Widget> personalDatas;
  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () => pushToPage(context, nextPage),
            child: Container(
              color: backgroundDarkColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyles.titles.copyWith(fontSize: 18)),
                  const SizedBox(height: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: personalDatas,
                  ),
                Divider(height: 15, thickness: 0.5, color: primaryColor),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
