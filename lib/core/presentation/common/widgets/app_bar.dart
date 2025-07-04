import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  final VoidCallback onTap;
  const AppBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('app_bar.home', style: CustomTextStyles.of(context).regular16.apply(color: Colors.white)).tr(),
        Text('app_bar.work', style: CustomTextStyles.of(context).regular16.apply(color: Colors.white)).tr(),
        Text('app_bar.about', style: CustomTextStyles.of(context).regular16.apply(color: Colors.white)).tr(),
        Text('app_bar.contact', style: CustomTextStyles.of(context).regular16.apply(color: Colors.white)).tr(),
      ],
    );
  }
}
