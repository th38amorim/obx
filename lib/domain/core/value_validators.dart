import 'package:obenx_com_br_app/domain/core/cpf_validator.dart';
import 'package:obenx_com_br_app/domain/core/date_validator.dart';
import 'package:obenx_com_br_app/domain/core/email_validator.dart';

class ValueValidators {
  
  static String? emptyValidate(String value) {
    return null;
  }
  
  static String? validateStringEmpty(String input) {
    if (input.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? validateFullName(String input) {
    if(input.isEmpty) {
      return validateStringEmpty(input);
    }
    String value = "([A-Z][a-z]{3,} )([A-Z][a-z]{3,} )?([A-Z][a-z]{3,})";
    RegExp regex = RegExp(value, caseSensitive: false, multiLine: false);
    if (!regex.hasMatch(input))
      return 'Insira um nome válido';
    else
      return null;
  }

  static String? validateDate(String input) {
    if(input.isEmpty) {
      return validateStringEmpty(input);
    }
    if(input.length < 10) {
      return 'Insira uma data válida';
    }
    try {
      DateValidator.isValid(input);
    } catch (e) {
      return "Insira uma data válida";
    }
  }

  static String? validateCpf(String input) {
    if(input.isEmpty) {
      return validateStringEmpty(input);
    }
    if(!CPFValidator.isValid(input)) {
      return "CPF inválido";
    }
    return null;
  }

  static String? validateEmail(String input) {
    if(input.isEmpty) {
      return validateStringEmpty(input);
    }
    if(!EmailValidator.validate(input)) {
      return "Insira um e-mail válido";
    }
    return null;
  }
  
  static String? validatePhone(String phone) {
    if(phone.isEmpty) {
      return validateStringEmpty(phone);
    }
    if(phone.length < 15) {
      return "Insira um número de telefone válido";
    }
    
    var dddDigito1 = num.tryParse(phone[1]);
    var dddDigito2 = num.tryParse(phone[2]);
    
    if(dddDigito1 == 0 || dddDigito2 == 0) {
      return "Insira um número de telefone válido";
    }
    return null;
  }

  static String? validateDocument(String input) {
    if(input.isEmpty) {
      return validateStringEmpty(input);
    }
    if(input.length < 12) {
      return "Insira um documento válido";
    }
  }

  static String? validatePassword(String input) {
    if(input.isEmpty) {
      return validateStringEmpty(input);
    }
    if(input.length < 6 || input.length > 8) {
      return "Insira uma senha válida";
    }
    return null;
  }

}
