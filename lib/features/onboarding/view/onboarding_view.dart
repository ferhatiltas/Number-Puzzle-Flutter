import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/extensions/responsive.dart';
import '../../../widgets/sizedBox/dynamic_veritical_space.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends BaseState<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 100.w,
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: state.currentIndex == 1 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      state.currentIndex == 0 ? const SizedBox.shrink() : _buildOnboardBackgroundImage(svgConstants.onboard2Background, 1, false),
                      state.currentIndex == 2
                          ? _buildOnboardBackgroundImage(svgConstants.onboard3Background, 2, false)
                          : Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: _buildSkipButton(),
                            )
                    ],
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [DynamicVerticalSpace(height: 6.h), _buildOnboardItems(context)],
            ),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return SizedBox(
                  height: ResponsivitiveManager.instance.isMobile(context)
                      ? 25.h
                      : state.currentIndex == 2
                          ? 25.h
                          : 19.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 6.h,
                          width: 100.w,
                          child: Align(
                            child: (state.currentIndex == context.read<OnboardingCubit>().onboardModelList.length - 1)
                                ? _buildLoginButton()
                                : _buildCircleIndicator(context),
                          )),
                      BlocBuilder<OnboardingCubit, OnboardingState>(
                        builder: (context, state) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: state.currentIndex == 0 ? MainAxisAlignment.end : MainAxisAlignment.center,
                            children: [
                              _buildOnboardBackgroundImage(svgConstants.onboard33Background, 2, true),
                              _buildOnboardBackgroundImage(svgConstants.onboard1Background, 0, false),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Align _buildSkipButton() {
    return Align(
      alignment: Alignment.topRight,
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Platform.isIOS
              ? CupertinoButton(
                  onPressed: (state.currentIndex == context.read<OnboardingCubit>().onboardModelList.length - 1)
                      ? null
                      : () => context.read<OnboardingCubit>().navigateToLoginView(context),
                  child: Text(
                    (state.currentIndex == context.read<OnboardingCubit>().onboardModelList.length - 1) ? '' : 'ATLA',
                    style: TextStyle(fontFamily: fontsConstants.AVENIR_BOOK, fontSize: 12.sp, color: Colors.black),
                  ),
                )
              : TextButton(
                  onPressed: (state.currentIndex == context.read<OnboardingCubit>().onboardModelList.length - 1)
                      ? null
                      : () => context.read<OnboardingCubit>().navigateToLoginView(context),
                  child: Text(
                    (state.currentIndex == context.read<OnboardingCubit>().onboardModelList.length - 1) ? '' : 'ATLA',
                    style: TextStyle(fontFamily: fontsConstants.AVENIR_BOOK, fontSize: 12.sp, color: Colors.black),
                  ));
        },
      ),
    );
  }

  Widget _buildOnboardItems(BuildContext context) {
    return SizedBox(
      height: ResponsivitiveManager.instance.isMobile(context) ? 60.h : 65.h,
      width: 100.w,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: context.read<OnboardingCubit>().onboardModelList.length,
          onPageChanged: (value) {
            context.read<OnboardingCubit>().changeCurrentIndex(value);
          },
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Image.asset(
                  context.read<OnboardingCubit>().onboardModelList[index].imagePath,
                  height: 30.h,
                  width: 50.w,
                ),
                DynamicVerticalSpace(height: 7.h),
                Text(
                  context.read<OnboardingCubit>().onboardModelList[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp, color: const Color(0XFF252525)),
                ),
                DynamicVerticalSpace(height: 2.h),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Text(
                    context.read<OnboardingCubit>().onboardModelList[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: fontsConstants.AVENIR_MEDIUM, fontSize: 14.sp, color: const Color(0XFF757575)),
                  ),
                )
              ],
            );
          })),
    );
  }

  SizedBox _buildLoginButton() {
    return Platform.isIOS
        ? SizedBox(
            width: 70.w,
            height: 30.h,
            child: CupertinoButton.filled(
              borderRadius: BorderRadius.all(Radius.circular(2.5.h)),
              onPressed: () => context.read<OnboardingCubit>().navigateToLoginView(context),
              child: Text(
                'OYUNA BAŞLA',
                style: TextStyle(fontSize: 15.sp, fontFamily: fontsConstants.AVENIR_MEDIUM),
              ),
            ),
          )
        : SizedBox(
            width: 70.w,
            height: 30.h,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.5.h)),
                )),
                elevation: MaterialStateProperty.resolveWith<double>(
                  (Set<MaterialState> states) {
                    return 0.0;
                  },
                ),
              ),
              onPressed: () => context.read<OnboardingCubit>().navigateToLoginView(context),
              child: Text(
                'OYUNA BAŞLA',
                style: TextStyle(fontSize: 15.sp, fontFamily: fontsConstants.AVENIR_MEDIUM),
              ),
            ),
          );
  }

  ListView _buildCircleIndicator(BuildContext context) {
    return ListView.builder(
        itemCount: context.read<OnboardingCubit>().onboardModelList.length - 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: ((context, state) {
              return Padding(
                padding: EdgeInsets.all(0.5.h),
                child: CircleAvatar(
                  backgroundColor: state.currentIndex == index ? customAppColors.primaryColor : customAppColors.grey,
                  radius: state.currentIndex == index ? 0.7.h : 0.5.h,
                ),
              );
            }),
          );
        });
  }

  Widget _buildOnboardBackgroundImage(
    String imagePath,
    int onboardIndex,
    bool? isLastAndEndPage,
  ) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Visibility(
            visible: state.currentIndex == onboardIndex,
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.fill,
              width: isLastAndEndPage == true ? 80.w : null,
            ));
      },
    );
  }
}
