import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/domain/model/investor_profile/investor_profile.dart';

class InvestorProfileFormState {
  InvestorProfile investorProfile;

  InvestorProfileFormState({required this.investorProfile});

  factory InvestorProfileFormState.initial() {
    return InvestorProfileFormState(
      investorProfile: InvestorProfile.empty(),
    );
  }

  InvestorProfileFormState copyWith({InvestorProfile? investorProfile}) {
    return InvestorProfileFormState(
      investorProfile: investorProfile ?? this.investorProfile,
    );
  }
}

class InvestorProfileFormCubit extends Cubit<InvestorProfileFormState> {
  InvestorProfile investorProfile;

  InvestorProfileFormCubit(this.investorProfile) : super(InvestorProfileFormState.initial());

   mainObjectiveChanged(String value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(mainObjective: value)));
  }

  void moneyDurationChanged(String value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(moneyDuration: value)));
  }

  void investedVolumeChanged(String value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(investedVolume: value)));
  }

  void investmentUnderstandingChanged(String value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(investmentUnderstanding: value)));
  }

  void riskToleranceChanged(String value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(riskTolerance: value)));
  }

  void lowerInvestimentsChanged(String value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(lowerInvestiments: value)));
  }

  void variableIncomePastInvestmentsChanged(String value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(variableIncomePastInvestments: value)));
  }

  void publicTitlesPastInvestmentsChanged(String value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(publicTitlesPastInvestments: value)));
  }

  void currentActivesChanged(List<String> value) {
    emit(state.copyWith(investorProfile: state.investorProfile.copyWith(currentActives: value)));
  }

  Future<void> saved() async {
      try {
        // InvestorProfile investorProfile = await _authRepository.signUp(state.authUser, address);
        emit(state.copyWith(investorProfile: investorProfile));
      } on Exception {}
  }

}
