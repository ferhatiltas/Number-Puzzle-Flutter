import 'package:flutter/material.dart';

import '../../constants/animation_constants.dart';
import '../../constants/app_consts.dart';
import '../../constants/font_constants.dart';
import '../../constants/image_constants.dart';
import '../../constants/svg_constants.dart';
import '../../theme/custom_colors.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ApplicationConstants get applicationConstants => ApplicationConstants.instance;
  AnimationConstants get animationConstants => AnimationConstants.instance;
  FontsConstants get fontsConstants => FontsConstants.instance;
  ImageConstants get imageConstants => ImageConstants.instance;
  SvgConstants get svgConstants => SvgConstants.instance;
  CustomAppColors get customAppColors => CustomAppColors.instance;
}
