import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:collider_loading/feature/contact/presentation/widgets/social_contact_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:collider_loading/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactPage extends StatelessWidget {
  static const pageName = 'contact';
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    void launchEmailWeb() async {
      final String recipientEmail = emailAddress;
      final String subject = 'Hello';
      final String body = 'I wanted to get in touch...';

      final String gmailUrl =
          'https://mail.google.com/mail/?view=cm&tf=1&to=$recipientEmail&su=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

      if (!await launchUrl(Uri.parse(gmailUrl), mode: LaunchMode.platformDefault)) {
        debugPrint('Could not launch Gmail URL: $gmailUrl');
      }
    }

    Future<void> launchLinkedInUrl() async {
      const String profileUrl = linkedInProfileUrl;

      if (await canLaunchUrlString(profileUrl)) {
        await launchUrlString(profileUrl);
      } else {
        debugPrint('Could not launch LinkedIn URL.');
      }
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
                  textAlign: TextAlign.center,
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
              const SizedBox(height: 120),
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth < 850 ? 1 : 2;

                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxWidth < 850
                          ? MediaQuery.of(context).size.height / 1.1
                          : MediaQuery.of(context).size.height / 3,
                    ),
                    child: GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 3 / 2,
                      children: [
                        SocialContactColumn(
                          imageUrl: 'assets/images/linkedin.png',
                          description: 'contact_page.description_linkedin'.tr(),
                          onPressed: launchLinkedInUrl,
                        ),
                        SocialContactColumn(
                          imageUrl: 'assets/images/email.png',
                          description: 'contact_page.description_email'.tr(),
                          onPressed: () {
                            launchEmailWeb();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              Center(
                child: Text(
                  'contact_page.description_form',
                  style: CustomTextStyles.of(context).regular16.apply(color: Colors.white),
                ).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
