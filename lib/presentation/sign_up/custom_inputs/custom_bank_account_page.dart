import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obenx_com_br_app/presentation/sign_up/widgets/section_name_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class CustomBankAccountPage extends StatelessWidget {
  CustomBankAccountPage({
    Key? key, 
    required this.index, 
    required this.pageController,
  }): super(key: key);

  final int index;
  final PageController pageController;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController bankEditingController = TextEditingController();
  final TextEditingController agencyEditingController = TextEditingController();
  final TextEditingController accountNumberEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
        listener: (BuildContext context, SignUpFormState state) {},
        builder: (BuildContext context, SignUpFormState state) {
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
                    SectionNameWidget(index: index, pageController: pageController),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Text('Infome-nos seus dados bancários\npara Aportes e Resgates', style: TextStyles.subtitles, textAlign: TextAlign.center),
                          const SizedBox(height: 25),
                          Text('Banco', style: TextStyles.titles, textAlign: TextAlign.center),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: TextStyle(color: Colors.grey),
                                      textAlign: TextAlign.center,
                                      controller: bankEditingController,
                                      validator: (value) {
                                        return state.configs[index].validator.call(value);
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Color(0xFF51515E),
                                        filled: true,
                                        hintText: 'Ex: Bradesco',
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
                                    Text('Agência', style: TextStyles.titles, textAlign: TextAlign.center),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      style: TextStyle(color: Colors.grey),
                                      textAlign: TextAlign.center,
                                      controller: agencyEditingController,
                                      validator: (value) {
                                        return state.configs[index].validator.call(value);
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Color(0xFF51515E),
                                        filled: true,
                                        hintText: 'Ex: 0000',
                                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorStyle: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                    const SizedBox(height: 20),
                                    Text('Conta corrente', style: TextStyles.titles, textAlign: TextAlign.center),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      style: TextStyle(color: Colors.grey),
                                      textAlign: TextAlign.center,
                                      controller: accountNumberEditingController,
                                      validator: (value) {
                                        return state.configs[index].validator.call(value);
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Color(0xFF51515E),
                                        filled: true,
                                        hintText: 'Ex: 0000000-0',
                                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorStyle: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height:  70),
                              BlocConsumer<SignUpFormCubit, SignUpFormState>(
                                listener: (BuildContext context, SignUpFormState state) {},
                                builder: (BuildContext context, SignUpFormState state) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      gradient: TextStyles.gradientColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if(_formKey.currentState!.validate()) {
                                            context.read<SignUpFormCubit>().fieldChanged('bank', bankEditingController.text);
                                            context.read<SignUpFormCubit>().fieldChanged('agency', agencyEditingController.text);
                                            context.read<SignUpFormCubit>().fieldChanged('numberAccount', accountNumberEditingController.text);
                                            pageController.nextPage(
                                            duration: Duration(milliseconds: 400),
                                            curve: Curves.easeIn,
                                          );
                                        }
                                      },
                                      style: TextStyles.buttonStyle,
                                      child: Text('Avançar', style: TextStyle(color: Colors.black)),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  );
}
}