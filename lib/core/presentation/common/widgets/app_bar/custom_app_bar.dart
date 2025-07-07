import 'package:collider_loading/core/presentation/common/styles/custom_colors.dart';
import 'package:collider_loading/core/presentation/common/widgets/app_bar/custom_app_bar_tab.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            CustomColors.of(context).appBarGradientFirst,
            CustomColors.of(context).appBarGradientSecond,
            CustomColors.of(context).appBarGradientThird,
            CustomColors.of(context).appBarGradientFourth,
            CustomColors.of(context).appBarGradientFifth,
          ],
          stops: [0.0, 0.2, 0.5, 0.85, 1.0],
        ),
      ),
      child: Row(
        children: [
          const Spacer(),
          CustomAppBarTab(text: 'app_bar.home'.tr(), onPressed: () {}),
          const SizedBox(width: 8),
          CustomAppBarTab(text: 'app_bar.work'.tr(), onPressed: () {}),
          const SizedBox(width: 8),
          CustomAppBarTab(text: 'app_bar.about'.tr(), onPressed: () {}),
          const SizedBox(width: 8),
          CustomAppBarTab(text: 'app_bar.contact'.tr(), onPressed: () {}),
          SizedBox(width: MediaQuery.of(context).size.width / 12),
        ],
      ),
    );
  }
}
