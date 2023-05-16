import 'package:flutter/material.dart';

import '../widgets/l_elevated_button.dart';
import '../widgets/l_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 300,
              height: 44,
              child: Text(
                'Enter your email and we will send you instructions on how to reset it',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            LTextField(
              controller: emailController,
              labelText: 'Email',
            ),
            const SizedBox(
              height: 24,
            ),
            LElevatedButton(
              text: 'Send',
              onPressed: () {
                print(emailController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
