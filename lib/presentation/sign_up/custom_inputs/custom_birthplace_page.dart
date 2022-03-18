import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obx_com_br_app/presentation/sign_up/widgets/section_name_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class CustomBirthplacePage extends StatefulWidget {
  const CustomBirthplacePage(
      {Key? key, required this.index, required this.pageController})
      : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _CustomBirthplacePageState createState() => _CustomBirthplacePageState();
}

  final _formKey = GlobalKey<FormState>();

  final TextEditingController countryEditingController = TextEditingController();
  final TextEditingController stateEditingController = TextEditingController();
  final TextEditingController cityEditingController = TextEditingController();

class _CustomBirthplacePageState extends State<CustomBirthplacePage> {
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
                  SectionNameWidget(index: widget.index, pageController: widget.pageController),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Text('Em qual país você nasceu?', style: TextStyles.titles, textAlign: TextAlign.center),
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
                                    controller: countryEditingController,
                                    validator: (value) {
                                      return state.configs[widget.index].validator.call(value);
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFF51515E),
                                      filled: true,
                                      hintText: 'Ex: Brasil',
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
                                  Text('Em qual estado você nasceu?', style: TextStyles.titles, textAlign: TextAlign.center),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                    controller: stateEditingController,
                                    validator: (value) {
                                      return state.configs[widget.index].validator.call(value);
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFF51515E),
                                      filled: true,
                                      hintText: 'Ex: São Paulo',
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
                                  Text('Em qual cidade você nasceu?', style: TextStyles.titles, textAlign: TextAlign.center),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                    controller: cityEditingController,
                                    validator: (value) {
                                      return state.configs[widget.index].validator.call(value);
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFF51515E),
                                      filled: true,
                                      hintText: 'Ex: Sorocaba',
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
                                          context.read<SignUpFormCubit>().fieldChanged('birthCountry', countryEditingController.text);
                                          context.read<SignUpFormCubit>().fieldChanged('birthState', stateEditingController.text);
                                          context.read<SignUpFormCubit>().fieldChanged('birthCity', cityEditingController.text);
                                          widget.pageController.nextPage(
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
                            // SignUpProceedButtonWidget(formKey: _formKey, index: widget.index, textEditingController: countryEditingController, pageController: widget.pageController,),
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
      },
    );
  }
}
