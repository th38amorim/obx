import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obx_com_br_app/presentation/sign_up/widgets/section_name_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class CustomConsultantInputPage extends StatefulWidget {
  CustomConsultantInputPage({
    Key? key, required this.index, required this.pageController,
  }) : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _CustomConsultantInputPageState createState() => _CustomConsultantInputPageState();
}

class _CustomConsultantInputPageState extends State<CustomConsultantInputPage> {

  final TextEditingController textEditingController = TextEditingController();

  bool _hasConsultant = false;
  bool _showConsultantField = false;

  void consultantSelect(bool hasConsultant) {
    setState(() {
      _hasConsultant = hasConsultant;
    });
  }

  void showHideConsultantField(bool showField) {
    setState(() {
      _showConsultantField = showField;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
    listener: (BuildContext context, SignUpFormState state) {},
    builder: (BuildContext context, SignUpFormState state) {
      textEditingController.text = context.read<SignUpFormCubit>().getFieldValue(state.configs[widget.index].modelName);
      return Scaffold(
        appBar: ObenxAppBar(),
        backgroundColor: backgroundDarkColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SectionNameWidget(index: widget.index, pageController: widget.pageController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Text(_showConsultantField ? state.configs[widget.index].label : 'Você já possui um Consultor Autônomo de investimento', style: TextStyles.titles, textAlign: TextAlign.center),
                      const SizedBox(height: 70),
                      Visibility(
                        visible: _showConsultantField,
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: textEditingController,
                                validator: (value) {
                                  return state.configs[widget.index].validator.call(value);
                                },
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: state.configs[widget.index].labelPlaceHolder,
                                  fillColor: Color(0xFF51515E),
                                  filled: true,
                                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: state.configs[widget.index].labelPlaceHolder == 'consultantCode' ? 0 : 50),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  showHideConsultantField(false);
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(2),
                                  fixedSize: MaterialStateProperty.all<Size>(Size(190, 45)),
                                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                                ),
                                child: Text('Cancelar', style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !_showConsultantField,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                color: !_hasConsultant ? Colors.grey : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  consultantSelect(true);
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(Size(190, 45)),
                                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                                ),
                                child: Text('Sim', style: TextStyle(color: Colors.black)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                color: _hasConsultant ? Colors.grey : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  consultantSelect(false);
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(2),
                                  fixedSize: MaterialStateProperty.all<Size>(Size(190, 45)),
                                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                                ),
                                child: Text('Não', style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    gradient: TextStyles.gradientColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if(_hasConsultant && !_showConsultantField) {
                        showHideConsultantField(true);
                      } else if(!_hasConsultant) {
                          widget.pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                      } else if(_formKey.currentState!.validate() && _showConsultantField) {
                        context.read<SignUpFormCubit>().fieldChanged(state.configs[widget.index].modelName, textEditingController.text);
                        widget.pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                      } 
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(2),
                      fixedSize: MaterialStateProperty.all<Size>(Size(190, 45)),
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                    ),
                    child: Text('Avançar', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
