import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'core/init/product_context.dart';
import 'core/init/project_initialize.dart';
import 'core/theme/palette_primary_color.dart';
import 'features/onboarding/view/onboarding_view.dart';

void main() async {
  final IProjectInitialize appInitialize = ProjectInitialize();
  await appInitialize.setup();
  runApp(MultiProvider(
    providers: ProductContext().items,
    child: _MyApp(),
  ));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Number Puzzle',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: PalettePrimary.primaryColor),
          ),
          home: const OnboardingView(),
        );
      },
    );
  }
}
