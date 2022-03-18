import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obx_com_br_app/presentation/sign_up/custom_inputs/address_form/widgets/cep_field_widget.dart';
import 'package:obx_com_br_app/presentation/sign_up/custom_inputs/address_form/widgets/city_field_widget.dart';
import 'package:obx_com_br_app/presentation/sign_up/custom_inputs/address_form/widgets/complement_field_widget.dart';
import 'package:obx_com_br_app/presentation/sign_up/custom_inputs/address_form/widgets/country_field_widget.dart';
import 'package:obx_com_br_app/presentation/sign_up/custom_inputs/address_form/widgets/district_field_widget.dart';
import 'package:obx_com_br_app/presentation/sign_up/custom_inputs/address_form/widgets/number_field_widget.dart';
import 'package:obx_com_br_app/presentation/sign_up/custom_inputs/address_form/widgets/state_field_widget.dart';
import 'package:obx_com_br_app/presentation/sign_up/custom_inputs/address_form/widgets/street_field_widget.dart';
import 'package:obx_com_br_app/presentation/sign_up/widgets/section_name_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class AddressFormPage extends StatelessWidget {
  AddressFormPage({Key? key, required this.index, required this.pageController}) : super(key: key);

  final int index;
  final PageController pageController;
  final formKey = GlobalKey<FormState>();

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
                  SectionNameWidget(index: index, pageController: pageController),
                  const SizedBox(height: 25),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          CepFieldWidget(),
                          StreetFieldWidget(),
                          NumberFieldWidget(),
                          DistrictFieldWidget(),
                          ComplementFieldWidget(),
                          CityFieldWidget(),
                          StateFieldWidget(),
                          CountryFieldWidget(),
                          SizedBox(height: 40),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              gradient: TextStyles.gradientColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if(formKey.currentState!.validate()) {
                                  pageController.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn,
                                  );
                                }
                              },
                              style: TextStyles.buttonStyle,
                              child: Text('Avançar', style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        );
      });
  }
}
