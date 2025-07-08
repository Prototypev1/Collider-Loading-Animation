import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactPage extends StatelessWidget {
  static const pageName = 'contact';
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            'sdjfnasjdf',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
