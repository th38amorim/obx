class InvestorProfile {
  final String mainObjective;
  final String moneyDuration;
  final String investedVolume;
  final String investmentUnderstanding;
  final String riskTolerance;
  final String lowerInvestiments;
  final String variableIncomePastInvestments;
  final String publicTitlesPastInvestments;
  final List<String> currentActives;

  InvestorProfile({
    required this.mainObjective,
    required this.moneyDuration,
    required this.investedVolume,
    required this.investmentUnderstanding,
    required this.riskTolerance,
    required this.lowerInvestiments,
    required this.variableIncomePastInvestments,
    required this.publicTitlesPastInvestments,
    required this.currentActives,
  });

  factory InvestorProfile.empty() {
    return InvestorProfile(
      mainObjective: '',
      moneyDuration: '',
      investedVolume: '',
      investmentUnderstanding: '',
      riskTolerance: '',
      lowerInvestiments: '',
      variableIncomePastInvestments: '',
      publicTitlesPastInvestments: '',
      currentActives: [],
    );
  }

  InvestorProfile copyWith({
    String? mainObjective,
    String? moneyDuration,
    String? investedVolume,
    String? investmentUnderstanding,
    String? riskTolerance,
    String? lowerInvestiments,
    String? variableIncomePastInvestments,
    String? publicTitlesPastInvestments,
    List<String>? currentActives,
    
  }) {
    return InvestorProfile(
      mainObjective: mainObjective ?? this.mainObjective,
      moneyDuration: moneyDuration ?? this.moneyDuration,
      investedVolume: investedVolume ?? this.investedVolume,
      investmentUnderstanding: investmentUnderstanding ?? this.investmentUnderstanding,
      riskTolerance: riskTolerance ?? this.riskTolerance,
      lowerInvestiments: lowerInvestiments ?? this.lowerInvestiments,
      variableIncomePastInvestments: variableIncomePastInvestments ?? this.variableIncomePastInvestments,
      publicTitlesPastInvestments: publicTitlesPastInvestments ?? this.publicTitlesPastInvestments,
      currentActives: [],
    );
  }
}