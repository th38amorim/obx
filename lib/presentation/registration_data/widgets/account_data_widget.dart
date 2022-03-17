import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/registration_data/tabs/professional_and_financial_tab.dart';
import 'package:obenx_com_br_app/presentation/registration_data/widgets/account_data_itens_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class AccountDataTabs extends StatelessWidget {
  const AccountDataTabs({
    Key? key,
    required this.label,
    this.personalDataItens = const [], 
    this.financesDataItens = const [],
  }) : super(key: key);

  final String label;
  final List<AccountDataItens> personalDataItens;
  final List<FinancesDataItens> financesDataItens;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                label, 
                                style: TextStyles.titles.copyWith(fontSize: 20), 
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: personalDataItens,
                    ),
                    Column(
                      children: financesDataItens,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
