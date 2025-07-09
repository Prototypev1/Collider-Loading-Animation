import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:collider_loading/feature/contact/presentation/widgets/social_contact_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactPage extends StatelessWidget {
  static const pageName = 'contact';
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    void launchEmailWeb() {
      final String email = 'mradisavljevicmas@gmail.com';
      final String subject = 'Hello';
      final String body = 'I wanted to get in touch...';

      final String mailtoLink =
          'mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

      launchUrlString(mailtoLink);
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: kToolbarHeight + 16),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'contact_page.contact_data'.tr(),
                  style: CustomTextStyles.of(context).bold30.apply(color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'contact_page.description_first',
                  style: CustomTextStyles.of(context).regular16.apply(color: Colors.white),
                ).tr(),
              ),
              Center(
                child: Text(
                  'contact_page.description_second',
                  style: CustomTextStyles.of(context).regular16.apply(color: Colors.white),
                ).tr(),
              ),
              const SizedBox(height: 100),
              LayoutBuilder(
                builder: (context, constraints) {
                  final int crossAxisCount = constraints.maxWidth < 600 ? 1 : 2;

                  return GridView.count(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 60,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 3 / 2,
                    children: [
                      SocialContactColumn(
                        imageUrl: 'assets/images/linkedin.png',
                        description:
                            'Just tap on the LinkedIn icon and you will be sent to my profile, there we can connect, talk and discuss anything.',
                      ),
                      SocialContactColumn(
                        imageUrl: 'assets/images/email.png',
                        description:
                            'Click on the email icon and you will be sent to the default email app to send me an email.',
                        onPressed: () {
                          launchEmailWeb();
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
