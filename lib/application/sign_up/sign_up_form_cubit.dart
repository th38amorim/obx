import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/domain/core/value_validators.dart';
import 'package:obenx_com_br_app/domain/model/i_address_repository.dart';
import 'package:obenx_com_br_app/domain/model/user.dart';
import 'package:obenx_com_br_app/infrastructure/sign_up/address_repository.dart';
import 'package:obenx_com_br_app/presentation/sign_up/misc/sign_up_form_screen_config.dart';
import 'package:obenx_com_br_app/presentation/sign_up/sign_up_scaffold_page.dart';

class SignUpFormState {

  final List<SignUpFormScreenConfig> configs;
  final int currentConfig;
  final bool isSaving;
  final String failureOrSuccessMessage;
  final bool isCepLoading;

  SignUpFormState({required this.configs, required this.isSaving, required this.failureOrSuccessMessage, required this.currentConfig, required this.isCepLoading});

  factory SignUpFormState.initial() {
    return SignUpFormState(
      configs: [],
      isSaving: false,
      currentConfig: 0,
      failureOrSuccessMessage: '',
      isCepLoading: false,
    );
  }

  SignUpFormState copyWith({
    List<SignUpFormScreenConfig>? configs,
    int? currentConfig,
    bool? isSaving,
    String? failureOrSuccessMessage,
    bool? isCepLoading,
  }) {
    return SignUpFormState(
      configs: configs ?? this.configs,
      isSaving: isSaving ?? this.isSaving,
      failureOrSuccessMessage: failureOrSuccessMessage ?? this.failureOrSuccessMessage,
      currentConfig: currentConfig ?? this.currentConfig,
      isCepLoading: isCepLoading ?? this.isCepLoading,
    );
  }

}

class SignUpFormCubit extends Cubit<SignUpFormState> {


  final IAddressRepository addressRepository = AddressRepository();
  final formKey = GlobalKey<FormState>();

  User user;

  Map<int, List<SignUpFormScreenConfig>> screenConfig = {
    0 : [
      SignUpFormScreenConfig(label: 'Qual o seu nome completo?', previewLabel: 'Nome', modelName: 'fullName', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Ex: Gabriela Lima', textInputType: TextInputType.name, validator: ValueValidators.validateFullName, sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(label: 'Qual sua data de nascimento?', previewLabel: 'Data de Nascimento', modelName: 'birth', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Ex: 23/08/2021', textInputType: TextInputType.datetime, validator: ValueValidators.validateDate, inputMaskType: InputMaskType.BIRTH, sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(label: 'Qual o seu número de CPF?', previewLabel: 'CPF', modelName: 'cpf', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Ex: 545.427.688-95', textInputType: TextInputType.number, validator: ValueValidators.validateCpf, inputMaskType: InputMaskType.CPF, sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(label: 'Qual o seu E-mail?', previewLabel: 'E-mail', modelName: 'email', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Ex: gabriela@email.com', textInputType: TextInputType.emailAddress, validator: ValueValidators.validateEmail, sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(label: 'Qual o seu número\nde celular', previewLabel: 'Telefone', modelName: 'cellphone', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Ex: (11) 99999-9999', textInputType: TextInputType.phone, validator: ValueValidators.validatePhone, inputMaskType: InputMaskType.PHONE, sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(label: 'Digite o código\nde Consultor', previewLabel: '', modelName: 'consultantCode', type: SignUpFormScreenType.CONSULTANT, labelPlaceHolder: 'Ex: 124154', textInputType: TextInputType.number, validator: ValueValidators.validateStringEmpty, sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(label: 'Agora, crie sua\nsenha de acesso:', previewLabel: '', modelName: 'password', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Senha de 6 a 8 dígitos', textInputType: TextInputType.text, validator: ValueValidators.validatePassword, sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.CONFIRM, label: 'Seja bem vindo(a)!'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.ACCESSDATANEXT),
    ],
    1 : [
      SignUpFormScreenConfig(modelName: 'birthplace', type: SignUpFormScreenType.BIRTHPLACE, validator: ValueValidators.validateStringEmpty, sectionName: 'Dados pessoais'),
      SignUpFormScreenConfig(selectValues: ['Solteiro', 'Casado', 'Divorciado', 'Viúvo'], label: 'Selecione o seu\nestado civil:', modelName: 'civilStatus', type: SignUpFormScreenType.SELECT, sectionName: 'Dados pessoais'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.BIRTHPLACECONFIRM),
      SignUpFormScreenConfig(selectValues: ['CNH', 'RG'], label: 'Escolha um documento abaixo:', modelName: 'documentType', type: SignUpFormScreenType.SELECT, previewLabel: 'Documento', sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(label: 'Insira o número do documento', previewLabel: 'Número do documento', modelName: 'documentNumber', type: SignUpFormScreenType.DOCUMENT, labelPlaceHolder: 'Ex: 53628408080', sectionName: 'Dados de acesso', textInputType: TextInputType.number, validator: ValueValidators.validateDocument),
      SignUpFormScreenConfig(label: 'Insira o órgão de expedição', previewLabel: 'Órgão de expedição', modelName: 'documentExpedition', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Ex: Detran', sectionName: 'Dados de acesso'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.CAMERA, modelName: 'documentFrontImage', label: 'Fotografe a frente do seu documento'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.CAMERA, modelName: 'documentBackImage', label: 'Fotografe o verso do seu documento'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.CAMERA, modelName: 'faceImage', label: 'Tire uma foto do seu rosto. Segure o celular no nível dos olhos diretamente para a câmera'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.CONFIRM, label: 'Verifique seus dados!'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.PERSONALDATANEXT),
    ],
    2: [
      SignUpFormScreenConfig(type: SignUpFormScreenType.ADDRESS, sectionName: 'Endereço'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.ADDRESSNEXT),
    ],
    3: [
      SignUpFormScreenConfig(label: 'Qual é a sua profissão?', previewLabel: 'Profissão', modelName: 'profession', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Ex: Empresário', textInputType: TextInputType.text, validator: ValueValidators.validateStringEmpty, sectionName: 'Financeiro e profissional'),
      SignUpFormScreenConfig(label: 'Qual é a sua renda mensal?', previewLabel: 'Renda mensal', modelName: 'monthlyIncome', type: SignUpFormScreenType.NORMAL, labelPlaceHolder: 'Ex: R\$20.000,00', textInputType: TextInputType.number, validator: ValueValidators.validateStringEmpty, sectionName: 'Financeiro e profissional'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.FINANCES, sectionName: 'Financeiro e profissional', modelName: 'estimatedEquity', validator: ValueValidators.validateStringEmpty),
      SignUpFormScreenConfig(type: SignUpFormScreenType.FINANCESCONFIRM, label: 'Verifique seus dados!', modelName: 'finances'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.FINANCESNEXT),
    ],
    4: [
      SignUpFormScreenConfig(type: SignUpFormScreenType.BANKACCOUNT, validator: ValueValidators.validateStringEmpty, sectionName: 'Dados bancários'),
      SignUpFormScreenConfig(type: SignUpFormScreenType.BANKCONFIRM),
    ]
  };

  SignUpFormCubit(this.user, {int config = 0}) : super(SignUpFormState.initial()) {
    emit(state.copyWith(configs: screenConfig[config]));
  }

  Future<void> postData(int start, int currentSize) async {
    emit(state.copyWith(isSaving: true));
    await Future.delayed(const Duration(seconds: 1), () => "1");
    NumberFormController.currentForm++;
    NumberFormController.user = user;
    emit(state.copyWith(isSaving: false));
  }

  // Future<void> saved(AddressUser address) async {
  //   if (formKey.currentState!.validate()) {
  //     emit(state.copyWith(isSaving: true));
  //     try {
  //       User user = await _authRepository.signUp(state.authUser, address);
  //       emit(state.copyWith(failureOrSuccessMessage: '', isSaving: false, authUser: user));
  //     } on SignUpException catch(e) {
  //       emit(state.copyWith(failureOrSuccessMessage: e.toString(), isSaving: false));
  //     } on Exception {
  //       emit(state.copyWith(failureOrSuccessMessage: 'Ocorreu algum problema inesperado', isSaving: false));
  //     }
  //   }
  // }

  void cepChanged(String value) async {
    if(value.length == 9) {
      emit(state.copyWith(isCepLoading: true));
      User? address = await addressRepository.getCepData(value);
      if(address != null) {
        user = user.copyWith(
          state: address.state,
          city: address.city,
          street: address.street,
          district: address.district,
          cep: value
        );
      }
      emit(state.copyWith(isCepLoading: false));
    }
  }

  void fieldChanged(String field, dynamic value) {
    switch(field) {
      case 'fullName':
        user = user.copyWith(fullName: value);
        break;
      case 'birth':
        user = user.copyWith(birth: value);
        break;
      case 'cpf':
        user = user.copyWith(cpf: value);
        break;
      case 'email':
        user = user.copyWith(email: value);
        break;
      case 'cellphone':
        user = user.copyWith(cellphone: value);
        break;
      case 'consultantCode':
        user = user.copyWith(consultantCode: value);
        break;
      case 'password':
        user = user.copyWith(password: value);
        break;
      case 'birthCountry':
        user = user.copyWith(birthCountry: value);
        break;
      case 'birthState':
        user = user.copyWith(birthState: value);
        break;
      case 'birthCity':
        user = user.copyWith(birthCity: value);
        break;
      case 'civilStatus':
        user = user.copyWith(civilStatus: value);
        break;
      case 'documentBackImage':
        user = user.copyWith(documentBackImage: value);
        break;
      case 'documentFrontImage':
        user = user.copyWith(documentFrontImage: value);
        break;
      case 'faceImage':
        user = user.copyWith(faceImage: value);
        break;
      case 'documentType':
        user = user.copyWith(documentType: value);
        break;
      case 'documentNumber':
        user = user.copyWith(documentNumber: value);
        break;
      case 'documentExpedition':
        user = user.copyWith(documentExpedition: value);
        break;
      case 'cep':
        user = user.copyWith(cep: value);
        break;
      case 'district':
        user = user.copyWith(district: value);
        break;
      case 'city':
        user = user.copyWith(city: value);
        break;
      case 'state':
        user = user.copyWith(state: value);
        break;
      case 'country':
        user = user.copyWith(country: value);
        break;
      case 'street':
        user = user.copyWith(street: value);
        break;
      case 'number':
        user = user.copyWith(number: value);
        break;
      case 'complement':
        user = user.copyWith(complement: value);
        break;
      case 'profession':
        user = user.copyWith(profession: value);
        break;
      case 'monthlyIncome':
        user = user.copyWith(monthlyIncome: value);
        break;
      case 'movableProperty':
        user = user.copyWith(movableProperty: value);
        break;
      case 'immovableProperty':
        user = user.copyWith(immovableProperty: value);
        break;
      case 'investiments':
        user = user.copyWith(investiments: value);
        break;
      case 'insurance':
        user = user.copyWith(insurance: value);
        break;
      case 'othersIncomes':
        user = user.copyWith(othersIncomes: value);
        break;
      case 'estimatedEquity':
        user = user.copyWith(estimatedEquity: value);
        break;
      case 'bank':
        user = user.copyWith(bank: value);
        break;
      case 'agency':
        user = user.copyWith(agency: value);
        break;
      case 'numberAccount':
        user = user.copyWith(numberAccount: value);
        break;
    }
  }

  dynamic getFieldValue(String field) {
    switch(field) {
      case 'fullName':
        return user.fullName;
      case 'birth':
        return user.birth;
      case 'cpf':
        return user.cpf;
      case 'email':
        return user.email;
      case 'cellphone':
        return user.cellphone;
      case 'consultantCode':
        return user.consultantCode;
      case 'password':
        return user.password;
      case 'birthCountry':
        return user.birthCountry;
      case 'birthState':
        return user.birthState;
      case 'birthCity':
        return user.birthCity;
      case 'civilStatus':
        return user.civilStatus;
      case 'documentBackImage':
        return user.documentBackImage;
      case 'documentFrontImage':
        return user.documentFrontImage;
      case 'faceImage':
        return user.faceImage;
      case 'documentType':
        return user.documentType;
      case 'documentNumber':
        return user.documentNumber;
      case 'documentExpedition':
        return user.documentExpedition;
      case 'profession':
        return user.profession;
      case 'monthlyIncome':
        return user.monthlyIncome;
      case 'movableProperty':
        return user.movableProperty;
      case 'immovableProperty':
        return user.immovableProperty;
      case 'investiments':
        return user.investiments;
      case 'insurance':
        return user.insurance;
      case 'othersIncomes':
        return user.othersIncomes;
      case 'estimatedEquity':
        return user.estimatedEquity; 
      case 'bank':
        return user.bank;
      case 'agency':
        return user.agency;
      case 'numberAccount':
        return user.numberAccount;
    }
  }

}