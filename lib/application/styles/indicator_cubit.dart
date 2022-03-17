import 'package:flutter_bloc/flutter_bloc.dart';

class IndicatorCubit extends Cubit<int> {
  IndicatorCubit() : super(0);

  void updateState(int index) {
    emit(index);
  }
}
