import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/invest_products/widgets/application_steps_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/withdrawalProceedButton.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/withdrawal_my_portfolio/withdrawal_operation_completed_page.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class ApplicationConsultantPage extends StatefulWidget {
  ApplicationConsultantPage({Key? key}) : super(key: key);

  @override
  _ApplicationConsultantPageState createState() => _ApplicationConsultantPageState();
}

class _ApplicationConsultantPageState extends State<ApplicationConsultantPage> {

  bool _switchValue = false;

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
                      ApplicationStepsWidget(index: 4),
                      const SizedBox(height: 30),
                      Text('Seu Consultor participará\ndeste investimento?', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Consultor(a):', style: TextStyles.titles.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('#1233'),
                                  const SizedBox(width: 10),
                                  Text('Gabriela Lima de Oliveira'),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () => consultantCodeBottomSheet(context),
                                    child: Icon(Icons.edit_outlined, size: 28),
                                  )
                                ],
                              ),
                              Divider(height: 15, thickness: 1),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Switch(
                                      value: _switchValue, 
                                      onChanged: (value) {
                                        setState(() {
                                          _switchValue = value;
                                        });
                                      },
                                      activeColor: primaryColor,
                                      
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  Expanded(
                                    child: Text(
                                      'O consultor poderá acompanhar o desempenho desse investimento', 
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          WithdrawalProceedButton(
            nextPage: WithdrawalOperationCompletedPage(),
          ),
        ],
      ),
    );
  }
}

consultantCodeBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: backgroundDarkColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(50),
        topRight: const Radius.circular(50),
      ),
    ),
    context: context,
    builder: (BuildContext c) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 3, 
                width: 100, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 50),
              Text('Digite o código\nde Consultor', style: TextStyles.titles, textAlign: TextAlign.center),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                  color: Color(0xFF51515E),
                  child: Form(
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Ex: 11111',
                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: TextStyles.gradientColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextStyles.buttonStyle,
                    child: Text('Adicionar', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


