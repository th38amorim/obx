import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/domain/model/user.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/address_form/address_form_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_bank_account_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_bank_confirm_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_birthplace_confirm_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_camera_input.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_confirm_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_consultant_input_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_document_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_finances_confirm_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_finances_input.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_select_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_text_input_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/custom_inputs/custom_birthplace_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/sections_confirmations/access_data/access_data_confirmation_page.dart';
import 'package:obenx_com_br_app/presentation/sign_up/misc/sign_up_form_screen_config.dart';
import 'package:obenx_com_br_app/presentation/sign_up/sections_confirmations/address/address_section_confirmation.dart';
import 'package:obenx_com_br_app/presentation/sign_up/sections_confirmations/finances/finances_section_confirmation.dart';
import 'package:obenx_com_br_app/presentation/sign_up/sections_confirmations/personal_data/personal_data_section_confirmation.dart';

class NumberFormController {

  static int currentForm = 0;
  static User user = User.empty();

}

class SignUpScaffoldPage extends StatelessWidget {
  SignUpScaffoldPage({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    return BlocProvider(
      create: (_) => SignUpFormCubit(NumberFormController.user,config: NumberFormController.currentForm,),
      child: BlocConsumer<SignUpFormCubit, SignUpFormState>(
        listener: (BuildContext context, SignUpFormState state) {
        },
        builder: (BuildContext context, SignUpFormState state) {
          int currentSize = 0;
            return Scaffold(
              body: SafeArea(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    pageIndex = index;
                  },
                  itemCount: state.configs.length,
                  itemBuilder: (BuildContext context, index) {
                    if(currentSize > index+1) {
                      currentSize = index;
                    }
                    currentSize++;
                    switch(state.configs[index].type) {
                      case SignUpFormScreenType.NORMAL:
                        return CustomTextInputPage(index: index, pageController: pageController);
                      case SignUpFormScreenType.CONSULTANT:
                        return CustomConsultantInputPage(index: index, pageController: pageController);
                      case SignUpFormScreenType.CONFIRM:
                        currentSize--;
                        CustomConfirmPage page = CustomConfirmPage(configs: state.configs, pageController: pageController, start: index - currentSize, returnSize: index, index: index,);
                        currentSize = 0;
                        return page;
                      case SignUpFormScreenType.BIRTHPLACECONFIRM:
                        currentSize--;
                        CustomBirthplaceConfirmPage page = CustomBirthplaceConfirmPage(index: index, configs: state.configs, pageController: pageController, start: index - currentSize, returnSize: index,);
                        currentSize = 0;
                        return page;
                      case SignUpFormScreenType.FINANCESCONFIRM:
                        currentSize--;
                        CustomFinancesConfirmPage page = CustomFinancesConfirmPage(index: index, configs: state.configs, pageController: pageController, start: index - currentSize, returnSize: index,);
                        currentSize = 0;
                        return page;
                      case SignUpFormScreenType.BANKCONFIRM:
                        currentSize--;
                        CustomBankConfirmPage page = CustomBankConfirmPage(index: index, configs: state.configs, pageController: pageController, start: index - currentSize, returnSize: index,);
                        currentSize = 0;
                        return page;
                      case SignUpFormScreenType.BIRTHPLACE:
                        return CustomBirthplacePage(index: index, pageController: pageController);
                      case SignUpFormScreenType.SELECT:
                        return CustomSelectPage(index: index, pageController: pageController);
                      case SignUpFormScreenType.ACCESSDATANEXT:
                        return AccessDataSectionConfirm();
                      case SignUpFormScreenType.PERSONALDATANEXT:
                        return PersonalDataSectionConfirm();
                      case SignUpFormScreenType.ADDRESSNEXT:
                        return AddressSectionConfirm();
                      case SignUpFormScreenType.FINANCESNEXT:
                        return FinancesSectionConfirm();
                      case SignUpFormScreenType.CAMERA:
                        return CustomCameraInput(index: index, pageController: pageController);
                      case SignUpFormScreenType.ADDRESS:
                        return AddressFormPage(index: index, pageController: pageController);
                      case SignUpFormScreenType.FINANCES:
                        return CustomFinancesPage(index: index, pageController: pageController);
                      case SignUpFormScreenType.BANKACCOUNT:
                        return CustomBankAccountPage(index: index, pageController: pageController);
                      case SignUpFormScreenType.DOCUMENT:
                        return CustomDocumentPage(index: index, pageController: pageController);
                    }
                  }
                ),
              ),
            );
        },
      ),
    );
  }
}
