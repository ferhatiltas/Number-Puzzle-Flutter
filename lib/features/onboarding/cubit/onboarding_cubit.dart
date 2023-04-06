import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/constants/app_consts.dart';
import '../../../core/constants/svg_constants.dart';
import '../model/onboarding_model.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  List<OnboardingModel> onboardModelList = [];
  OnboardingCubit() : super(OnboardingState(currentIndex: 0)) {
    init();
  }

  void changeCurrentIndex(int value) {
    emit(OnboardingState(currentIndex: value));
  }

  void init() {
    onboardModelList = [
      OnboardingModel(
          title: ApplicationConstants.instance.onboardTitle1,
          description: ApplicationConstants.instance.onboardDescription1,
          imagePath: SvgConstants.instance.onboard1),
      OnboardingModel(
          title: ApplicationConstants.instance.onboardTitle2,
          description: ApplicationConstants.instance.onboardDescription2,
          imagePath: SvgConstants.instance.onboard2),
      OnboardingModel(
          title: ApplicationConstants.instance.onboardTitle3,
          description: ApplicationConstants.instance.onboardDescription3,
          imagePath: SvgConstants.instance.onboard3),
    ];
  }

  Future<void> navigateToLoginView(BuildContext context) async {
    // await context.router.replaceNamed(NavigationConstants.instance.login);
  }
}
