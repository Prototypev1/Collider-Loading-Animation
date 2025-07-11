import 'package:collider_loading/core/presentation/common/styles/custom_colors.dart';
import 'package:collider_loading/core/presentation/common/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class SendEmailForm extends StatelessWidget {
  const SendEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: Colors.black,
        // gradient: LinearGradient(
        //   colors: [
        //     CustomColors.of(context).appBarGradientFirst,
        //     CustomColors.of(context).appBarGradientSecond,
        //     CustomColors.of(context).appBarGradientThird,
        //     CustomColors.of(context).appBarGradientFourth,
        //     CustomColors.of(context).appBarGradientFifth,
        //   ],
        //   stops: [0.0, 0.2, 0.5, 0.85, 1.0],
        // ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInputField(
              initialValue: 'Your Email:',
              enabledBorderColor: Colors.white,
              filled: true,
              fillColor: Colors.white70,
              labelText: 'Email',
            ),
            CustomInputField(
              initialValue: 'Subject:',
              enabledBorderColor: Colors.white,
              filled: true,
              fillColor: Colors.white70,
              labelText: 'Subject',
            ),
          ],
        ),
      ),
    );
  }
}
