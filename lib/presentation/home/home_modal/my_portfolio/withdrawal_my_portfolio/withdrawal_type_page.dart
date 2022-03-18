import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawalProceedButton.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawal_steps_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawn_options_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/withdrawal_my_portfolio/withdrawal_value_page.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class WithdrawalMyPortfolioPage extends StatefulWidget {
  WithdrawalMyPortfolioPage({Key? key}) : super(key: key);

  @override
  _WithdrawalMyPortfolioPageState createState() => _WithdrawalMyPortfolioPageState();
}

class _WithdrawalMyPortfolioPageState extends State<WithdrawalMyPortfolioPage> {

  int? val = 1;
  
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
                      WithdrawalStepsWidget(index: 1),
                      const SizedBox(height: 50),
                      Text('Selecione o tipo de saque que\ndeseja realizar', textAlign: TextAlign.center, style: TextStyles.titles.copyWith(color: Colors.black87, fontSize: 16)),
                      const SizedBox(height: 50),
                      WithdrawalOptionsWidget(
                        label: 'Saque total',
                        description: 'Total aportado ' + 'R\$123.000,00',
                        onPressed: (value) {
                          setState(() {
                            val = value;
                          });
                        }, 
                        groupValue: val, 
                        value: 1, 
                      ),
                      WithdrawalOptionsWidget(
                        label: 'Saque de Rendimento',
                        description: 'Rendimento total ' + 'R\$123,00',
                        onPressed: (value) {
                          setState(() => val = value);
                        }, 
                        groupValue: val, 
                        value: 2, 
                      ),
                      WithdrawalOptionsWidget(
                        label: 'Saque Parcial',
                        onPressed: (value) {
                          setState(() => val = value);
                        }, 
                        groupValue: val, 
                        value: 3, 
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          WithdrawalProceedButton(
            nextPage: WithdrawalValuePage(),
          ),
        ],
      ),
    );
  }
}


