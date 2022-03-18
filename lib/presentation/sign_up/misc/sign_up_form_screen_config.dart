import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obx_com_br_app/domain/core/value_validators.dart';

enum SignUpFormScreenType {

    NORMAL,
    CONSULTANT,
    CONFIRM,
    ACCESSDATANEXT,
    PERSONALDATANEXT,
    ADDRESSNEXT,
    FINANCESNEXT,
    SELECT,
    DOCUMENT,
    BIRTHPLACE,
    BANKACCOUNT,
    FINANCES,
    BIRTHPLACECONFIRM,
    FINANCESCONFIRM,
    BANKCONFIRM,
    CAMERA,
    ADDRESS,

}

enum InputMaskType {
  
  CPF,
  PHONE,
  BIRTH,
  CURRENCY,
  EMPTY,
  
}


class SignUpFormScreenConfig {
    
  final InputMaskType inputMaskType;
  final String label;
  final String previewLabel;
  final String modelName;
  final String labelPlaceHolder;
  final SignUpFormScreenType type;
  final int size;
  final TextInputType textInputType;
  final Function validator;
  final String sectionName;

  final List<dynamic> selectValues;

  SignUpFormScreenConfig({
    this.label = '', 
    this.modelName = '', 
    required this.type,
    this.inputMaskType = InputMaskType.EMPTY, 
    this.size = 0,
    this.previewLabel = '', 
    this.labelPlaceHolder = '', 
    this.textInputType = TextInputType.text,
    this.validator = ValueValidators.emptyValidate,
    this.selectValues = const <dynamic>[],
    this.sectionName = '',
  });

  SignUpFormScreenConfig copyWith({
    InputMaskType? inputMaskType,
    String? label,
    String? previewLabel,
    String? modelName,
    String? labelPlaceHolder,
    SignUpFormScreenType? type,
    int? size,
    TextInputType? textInputType,
    Function? validator,
    List<dynamic>? selectValues
  }) {
    return SignUpFormScreenConfig(
      inputMaskType: inputMaskType ?? this.inputMaskType,
      label: label ?? this.label,
      previewLabel: previewLabel ?? this.previewLabel,
      modelName: modelName ?? this.modelName,
      labelPlaceHolder: labelPlaceHolder ?? this.labelPlaceHolder,
      type: type ?? this.type,
      size: size ?? this.size,
      textInputType: textInputType ?? this.textInputType,
      validator: validator ?? this.validator,
      selectValues: selectValues ?? this.selectValues,
    );
  }

}