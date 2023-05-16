import 'package:flutter/material.dart';
import 'package:lentil/pages/home_page.dart';
import 'package:lentil/pages/registration_page.dart';

import '../widgets/checkbox_text.dart';
import '../widgets/l_elevated_button.dart';
import '../widgets/l_text_button.dart';
import '../widgets/l_text_field.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMeIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  Text(
                    'Welcome back',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign in to continue',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                height: 280,
                width: 375,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFEFEFF4),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LTextField(
                      controller: emailController,
                      labelText: 'Email',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    LTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxText(
                          value: rememberMeIsChecked,
                          label: Text(
                            'Remember me',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                          onChanged: (bool? value) {
                            setState(
                              () {
                                rememberMeIsChecked = value!;
                              },
                            );
                          },
                        ),
                        LTextButton(
                          text: 'Forgot Password?',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    LElevatedButton(
                      text: 'Sign In',
                      onPressed: () {
                        print(emailController.text);
                        print(passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  LTextButton(
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
