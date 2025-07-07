import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarTab extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomAppBarTab({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 30,
          minWidth: MediaQuery.of(context).size.width / 20,
        ),
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
    );
  }
}
