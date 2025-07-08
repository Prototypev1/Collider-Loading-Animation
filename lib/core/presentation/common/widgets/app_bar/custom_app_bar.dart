import 'package:collider_loading/core/presentation/common/styles/custom_colors.dart';
import 'package:collider_loading/core/presentation/common/widgets/app_bar/custom_app_bar_tab.dart';
import 'package:collider_loading/feature/contact/presentation/contact_page.dart';
import 'package:collider_loading/feature/home/presentation/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final int page;
  final void Function(int page) onPageChanged;
  const CustomAppBar({
    super.key,
    required this.page,
    required this.onPageChanged,
  });

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
          CustomAppBarTab(
            text: 'app_bar.home'.tr(),
            onPressed: () {
              context.pushNamed(HomePage.pageName);
              onPageChanged(0);
            },
            isActive: page == 0,
          ),
          const SizedBox(width: 8),
          CustomAppBarTab(
            text: 'app_bar.work'.tr(),
            onPressed: () {
              onPageChanged(1);
            },
            isActive: false,
          ),
          const SizedBox(width: 8),
          CustomAppBarTab(
            text: 'app_bar.about'.tr(),
            onPressed: () {
              onPageChanged(2);
            },
            isActive: false,
          ),
          const SizedBox(width: 8),
          CustomAppBarTab(
            text: 'app_bar.contact'.tr(),
            onPressed: () {
              context.pushNamed(ContactPage.pageName);
              onPageChanged(3);
            },
            isActive: page == 3,
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 12),
        ],
      ),
    );
  }
}
