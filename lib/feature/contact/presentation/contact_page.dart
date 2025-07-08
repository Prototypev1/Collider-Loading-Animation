import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:collider_loading/feature/contact/presentation/widgets/image_layers_combination.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  static const pageName = 'contact';
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: kToolbarHeight + 16),
        child: Column(
          children: [
            Text(
              'contact_page.contact_data'.tr(),
              style: CustomTextStyles.of(context).bold30.apply(color: Colors.white),
            ),
            ImageLayersCombination(),
          ],
        ),
      ),
    );
  }
}
