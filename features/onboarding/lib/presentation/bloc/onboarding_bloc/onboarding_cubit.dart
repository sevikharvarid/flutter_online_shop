import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit()
      : super(
          OnBoardingState(
            onBoardingState: ViewData.initial(),
          ),
        );
  void saveOnBoardingStatus() async {
    emit(OnBoardingState(
      onBoardingState: ViewData.loaded(
        data: true,
      ),
    ));
  }
}
