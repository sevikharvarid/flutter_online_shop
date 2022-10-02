import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/drift/drift.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_state.dart';
import 'package:dependencies/bloc/bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(splashState: ViewData.initial()));

  void initialData() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashState(
        splashState: ViewData.noData(
      message: "",
    )));
  }
}
