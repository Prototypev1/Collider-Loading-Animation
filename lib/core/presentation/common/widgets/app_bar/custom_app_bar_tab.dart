import 'package:collider_loading/core/presentation/common/styles/custom_colors.dart';
import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarTab extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  const CustomAppBarTab({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: CustomColors.of(context).appBarTabSplash,
        onTap: onPressed,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 30, minWidth: MediaQuery.of(context).size.width / 20),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                maxLines: 1,
                text,
                style: CustomTextStyles.of(context).regular18.apply(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
