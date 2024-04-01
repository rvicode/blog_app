import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginUpTap = 1;
  static const int signUpTap = 0;
  int selectTapIndex = loginUpTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Assets.img.icons.logo.svg(width: 150, height: 65),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28)),
                      color: Color(0xff376AED)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectTapIndex = loginUpTap;
                                });
                              },
                              child: Text(
                                'LOGIN',
                                style: themeData.textTheme.headlineMedium!
                                    .apply(
                                        color: selectTapIndex == loginUpTap
                                            ? Colors.white
                                            : Colors.white30,
                                        fontSizeFactor: 0.7),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectTapIndex = signUpTap;
                                });
                              },
                              child: Text(
                                'SIGN UP',
                                style: themeData.textTheme.headlineMedium!
                                    .apply(
                                        color: selectTapIndex == signUpTap
                                            ? Colors.white
                                            : Colors.white30,
                                        fontSizeFactor: 0.7),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 32, right: 32, top: 16),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: selectTapIndex == loginUpTap
                                ? _Login(themeData: themeData)
                                : _Signup(themeData: themeData),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          'Welcome back',
          style: themeData.textTheme.headlineMedium!.apply(fontWeightDelta: 1),
        ),
        const SizedBox(
          height: 12,
        ),
        Text('Sign in with your account',
            style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 1.1)),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(
            label: Text(
              'Username',
              style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 1.1),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        PasswordTextField(themeData: themeData),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff376AED)),
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 60)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()));
            },
            child: Text(
              'LOGIN',
              style: themeData.textTheme.headlineMedium!
                  .apply(color: Colors.white, fontSizeFactor: 0.7),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forgot your password?'),
            SizedBox(
              width: 8,
            ),
            Text(
              'Reset here',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'Or sign in with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 1.5),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _Signup extends StatelessWidget {
  const _Signup({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          'Welcome to blog club',
          style: themeData.textTheme.headlineMedium!.apply(fontWeightDelta: 1),
        ),
        const SizedBox(
          height: 12,
        ),
        Text('Please enter your information',
            style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 1.1)),
        const SizedBox(
          height: 4,
        ),
        TextField(
          decoration: InputDecoration(
            label: Text(
              'Email',
              style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 1.1),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          decoration: InputDecoration(
            label: Text(
              'Username',
              style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 1.1),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        PasswordTextField(themeData: themeData),
        const SizedBox(
          height: 36,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff376AED)),
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 60)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()));
            },
            child: Text(
              'Sign Up'.toUpperCase(),
              style: themeData.textTheme.headlineMedium!
                  .apply(color: Colors.white, fontSizeFactor: 0.7),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Center(
          child: Text(
            'Or sign up with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 1.5),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: Text(
            'Password',
            style: widget.themeData.textTheme.bodyMedium!
                .apply(fontSizeFactor: 1.1),
          ),
          suffix: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(
              obscureText == true ? 'Show' : 'Hide',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 14),
            ),
          )),
    );
  }
}
