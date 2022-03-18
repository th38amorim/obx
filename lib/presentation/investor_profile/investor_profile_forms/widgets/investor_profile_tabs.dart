import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/investor_profile/investor_profile_forms/widgets/investor_profile_options.dart';
import 'package:obx_com_br_app/presentation/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class InvestorProfileTabs extends StatelessWidget {
  InvestorProfileTabs({
    Key? key, required this.label, this.optionsInvestorProfile = const [], this.optionsCurrentActives = const [], required this.nextPage, this.description = '', 
  }) : super(key: key);
  
  final String label;
  final List<OptionsInvestorProfile> optionsInvestorProfile;
  final List<OptionsCurrentActives> optionsCurrentActives;
  final Widget nextPage;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundDarkColor,
        appBar: AppBar(
          backgroundColor: backgroundDarkColor,
          title: Text('Perfil do investidor', style: TextStyles.subtitles),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Divider(height: 10, thickness: 0.5, color: primaryColor),
                const SizedBox(height: 30),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(label, style: TextStyles.titles.copyWith(fontSize: 23, color: Colors.black), textAlign: TextAlign.center),
                          ),
                          Visibility(
                            visible: description != '',
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                              child: Text(description),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Column(
                            children: optionsInvestorProfile,
                          ),
                          Column(
                            children: optionsCurrentActives,
                          ),
                          Visibility(
                            visible: optionsCurrentActives.isNotEmpty,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text('Múltipla escolha*', style: TextStyles.textConfirmPage.copyWith(fontWeight: FontWeight.w600),),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 25 ,
              left: 100,
              child: Container(
                decoration: BoxDecoration(
                  gradient: TextStyles.gradientColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () async{
                    // await context.read<AddressFormCubit>().saved();
                    pushToPage(context, nextPage);
                  },
                  style: TextStyles.buttonStyle,
                  child: Text('Continuar', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}