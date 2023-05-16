import 'package:flutter/material.dart';
import 'package:lentil/pages/login_page.dart';
import 'package:lentil/pages/onboarding_page.dart';

import '../widgets/checkbox_text.dart';
import '../widgets/l_elevated_button.dart';
import '../widgets/l_icon_button.dart';
import '../widgets/l_text_button.dart';
import '../widgets/l_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool agreeToTOSIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  Text(
                    'Welcome user',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign up to join',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                height: 440,
                width: 375,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFEFEFF4),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 85,
                      height: 85,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 86,
                            backgroundColor: Color(0xFFC8C7CC),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: LIconButton(
                              radius: 15,
                              iconSize: 20,
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 20,
                              ),
                              onPressed: () {
                                print('object');
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    LTextField(
                      controller: nameController,
                      labelText: 'Name',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
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
                    CheckboxText(
                      value: agreeToTOSIsChecked,
                      label: Row(
                        children: [
                          Text(
                            'I agree to the',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                          LTextButton(
                            text: 'Terms of Service',
                            onPressed: () {
                              print('go to terms of service');
                            },
                          ),
                        ],
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          agreeToTOSIsChecked = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    LElevatedButton(
                      text: 'Sign Up',
                      onPressed: () {
                        print(emailController.text);
                        print(passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingPage(),
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
                    "Have an account?",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  LTextButton(
                    text: 'Sign In',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
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
