import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obx_com_br_app/presentation/sign_up/widgets/section_name_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class CustomFinancesPage extends StatefulWidget {
  const CustomFinancesPage(
      {Key? key, required this.index, required this.pageController})
      : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _CustomFinancesPageState createState() => _CustomFinancesPageState();
}

  final _formKey = GlobalKey<FormState>();

  final movablePropertyEditingController = MoneyMaskedTextController(leftSymbol: 'R\$', );
  final immovablePropertyEditingController = MoneyMaskedTextController(leftSymbol: 'R\$', );
  final investimentsEditingController = MoneyMaskedTextController(leftSymbol: 'R\$', );
  final insuranceEditingController = MoneyMaskedTextController(leftSymbol: 'R\$', );
  final othersEditingController = MoneyMaskedTextController(leftSymbol: 'R\$', );

  final formatter = NumberFormat.simpleCurrency(locale: 'pt_Br');
  
  double totalEquity() {
    double total = movablePropertyEditingController.numberValue + immovablePropertyEditingController.numberValue +
     investimentsEditingController.numberValue + insuranceEditingController.numberValue + othersEditingController.numberValue;
    return total;
  }

class _CustomFinancesPageState extends State<CustomFinancesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
        return Scaffold(
          appBar: ObenxAppBar(),
          backgroundColor: backgroundDarkColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  SectionNameWidget(index: widget.index, pageController: widget.pageController),
                  const SizedBox(height: 40),
                  Text('Preencha com os valores do seu\npatrimônio estimado em cada', style: TextStyles.subtitles.copyWith(color: Colors.white70), textAlign: TextAlign.center),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Text('Bens móveis', style: TextStyles.titles, textAlign: TextAlign.center),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        totalEquity();
                                      });
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                    controller: movablePropertyEditingController,
                                    validator: (value) {
                                      return state.configs[widget.index].validator.call(value);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFF51515E),
                                      filled: true,
                                      hintText: 'Ex: Automóveis, eletrodomésticos, etc',
                                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Bons imóveis', style: TextStyles.titles, textAlign: TextAlign.center),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        totalEquity();
                                      });
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                    controller: immovablePropertyEditingController,
                                    validator: (value) {
                                      return state.configs[widget.index].validator.call(value);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFF51515E),
                                      filled: true,
                                      hintText: 'Ex: Apartamento, casas, etc',
                                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Investimentos', style: TextStyles.titles, textAlign: TextAlign.center),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        totalEquity();
                                      });
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                    controller: investimentsEditingController,
                                    validator: (value) {
                                      return state.configs[widget.index].validator.call(value);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFF51515E),
                                      filled: true,
                                      hintText: 'Ex: Fundos de investimento, renda fixa, etc',
                                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Previdência', style: TextStyles.titles, textAlign: TextAlign.center),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        totalEquity();
                                      });
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                    controller: insuranceEditingController,
                                    validator: (value) {
                                      return state.configs[widget.index].validator.call(value);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFF51515E),
                                      filled: true,
                                      hintText: 'Ex: Considere apenas planos de Previdência Privada',
                                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Outros', style: TextStyles.titles, textAlign: TextAlign.center),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        totalEquity();
                                      });
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                    controller: othersEditingController,
                                    validator: (value) {
                                      return state.configs[widget.index].validator.call(value);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFF51515E),
                                      filled: true,
                                      hintText: 'Ex: Saldo em conta corrente, etc',
                                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height:  25),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Patrimônio total\naproximado:', style: TextStyles.subtitles.copyWith(fontSize: 15)),
                                  Text(formatter.format(totalEquity()), style: TextStyles.subtitles.copyWith(fontSize: 15))
                                ],
                              ),
                            ),
                            const SizedBox(height:  30),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                gradient: TextStyles.gradientColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ElevatedButton(
                                onPressed: () {                                      
                                  if(_formKey.currentState!.validate()) {
                                      context.read<SignUpFormCubit>().fieldChanged('movableProperty', movablePropertyEditingController.text);
                                      context.read<SignUpFormCubit>().fieldChanged('immovableProperty', immovablePropertyEditingController.text);
                                      context.read<SignUpFormCubit>().fieldChanged('investiments', investimentsEditingController.text);
                                      context.read<SignUpFormCubit>().fieldChanged('insurance', insuranceEditingController.text);
                                      context.read<SignUpFormCubit>().fieldChanged('othersIncomes', othersEditingController.text);
                                      context.read<SignUpFormCubit>().fieldChanged('estimatedEquity', totalEquity().toString());
                                      widget.pageController.nextPage(
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                                style: TextStyles.buttonStyle,
                                child: Text('Avançar', style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xff26262B),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock_outline, color: Colors.white60,),
                          const SizedBox(width: 10),
                          Text('Todos os dados preenchidos são seguros', style: TextStyle(color: Colors.white60))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
