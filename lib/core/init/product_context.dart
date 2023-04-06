import 'package:provider/provider.dart';

import '../../features/onboarding/cubit/onboarding_cubit.dart';


class ProductContext {
  final items = [Provider.value(value: OnboardingCubit())];
}
