class User {
  final String fullName;
  final String birth;
  final String cpf;
  final String email;
  final String cellphone;
  final String consultantCode;
  final String password;
  final String birthCountry;
  final String birthState;
  final String birthCity;
  final String civilStatus;
  final String documentFrontImage;
  final String documentBackImage;
  final String faceImage;
  final String documentType;
  final String documentNumber;
  final String documentExpedition;
  final String cep;
  final String district;
  final String city;
  final String state;
  final String country;
  final String street;
  final String number;
  final String complement;
  final String profession;
  final String monthlyIncome;
  final String movableProperty;
  final String immovableProperty;
  final String investiments;
  final String insurance;
  final String othersIncomes;
  final String estimatedEquity;
  final String bank;
  final String agency;
  final String numberAccount;

  User({
    required this.fullName,
    required this.birth,
    required this.cpf,
    required this.email,
    required this.cellphone,
    required this.consultantCode,
    required this.password,
    required this.birthCountry,
    required this.birthState,
    required this.birthCity,
    required this.civilStatus,
    required this.documentFrontImage,
    required this.documentBackImage,
    required this.faceImage,
    required this.documentType,
    required this.documentNumber,
    required this.documentExpedition,
    required this.cep,
    required this.district,
    required this.city,
    required this.state,
    required this.country,
    required this.street,
    required this.number,
    required this.complement,
    required this.profession,
    required this.monthlyIncome,
    required this.movableProperty,
    required this.immovableProperty,
    required this.investiments,
    required this.insurance,
    required this.othersIncomes,
    required this.estimatedEquity,
    required this.bank,
    required this.agency,
    required this.numberAccount,
  });

  factory User.empty() {
    return User(
      fullName: '',
      birth: '',
      cpf: '',
      email: '',
      cellphone: '',
      consultantCode: '',
      password: '',
      birthCountry: '',
      birthState: '',
      birthCity: '',
      civilStatus: 'Solteiro',
      documentFrontImage: '',
      documentBackImage: '',
      faceImage: '',
      documentType: 'CNH',
      documentNumber: '',
      documentExpedition: '',
      cep: '',
      district: '',
      city: '',
      state: 'AC',
      country: 'Brasil',
      street: '',
      number: '',
      complement: '',
      profession: '',
      monthlyIncome: '',
      movableProperty: '',
      immovableProperty: '',
      investiments: '',
      insurance: '',
      othersIncomes: '',
      estimatedEquity: '',
      bank: '',
      agency: '',
      numberAccount: '',
    );
  }

  User copyWith({
    String? fullName,
    String? birth,
    String? cpf,
    String? email,
    String? cellphone,
    String? consultantCode,
    String? password,
    String? birthCountry,
    String? birthState,
    String? birthCity,
    String? civilStatus,
    String? documentFrontImage,
    String? documentBackImage,
    String? faceImage,
    String? documentType,
    String? documentNumber,
    String? documentExpedition,
    String? cep,
    String? district,
    String? city,
    String? state,
    String? country,
    String? street,
    String? number,
    String? complement,
    String? profession,
    String? monthlyIncome,
    String? movableProperty,
    String? immovableProperty,
    String? investiments,
    String? insurance,
    String? othersIncomes,
    String? estimatedEquity,
    String? bank,
    String? agency,
    String? numberAccount,
    
  }) {
    return User(
      fullName: fullName ?? this.fullName,
      birth: birth ?? this.birth,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      cellphone: cellphone ?? this.cellphone,
      consultantCode: consultantCode ?? this.consultantCode,
      password: password ?? this.password,
      birthCountry: birthCountry ?? this.birthCountry,
      birthState: birthState ?? this.birthState,
      birthCity: birthCity ?? this.birthCity,
      civilStatus: civilStatus ?? this.civilStatus,
      documentFrontImage: documentFrontImage ?? this.documentFrontImage,
      documentBackImage: documentBackImage ?? this.documentBackImage,
      faceImage: faceImage ?? this.faceImage,
      documentType: documentType ?? this.documentType,
      documentNumber: documentNumber ?? this.documentNumber,
      documentExpedition: documentExpedition ?? this.documentExpedition,
      cep: cep ?? this.cep,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      street: street ?? this.street,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      profession: profession ?? this.profession,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      movableProperty: movableProperty ?? this.movableProperty,
      immovableProperty: immovableProperty ?? this.immovableProperty,
      investiments: investiments ?? this.investiments,
      insurance: insurance ?? this.insurance,
      othersIncomes: othersIncomes ?? this.othersIncomes,
      estimatedEquity: estimatedEquity ?? this.estimatedEquity,
      bank: bank ?? this.bank,
      agency: agency ?? this.agency,
      numberAccount: numberAccount ?? this.numberAccount,
    );
  }

  static List<String> states = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO',
  ];
}
