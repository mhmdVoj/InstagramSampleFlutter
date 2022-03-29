import 'package:blog_application/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUTab = 1;
  int selectedTabIndex= 0;

  @override
  Widget build(BuildContext context) {

    final tabTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w700);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Assets.img.icons.logo.svg(width: 120),
          ),
          Expanded(
            child: Container(
              child: Column(children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: (){
                          setState(() {
                            selectedTabIndex = loginTab;
                          });
                        },
                        child: Text(
                          "Login".toUpperCase(),
                          style: tabTextStyle.apply(
                            color: selectedTabIndex==loginTab?Colors.white:Colors.white54
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          setState(() {
                            selectedTabIndex = signUTab;
                          });
                        },
                        child: Text(
                          "Sign Up".toUpperCase(),
                          style: tabTextStyle.apply(
                            color: selectedTabIndex==signUTab?Colors.white:Colors.white54
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                        child: selectedTabIndex==loginTab?const _Login():const _SignUp(),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                  ),
                )
              ]),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
            ),
          )
        ]),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Welcome Back',
        style: Theme.of(context).textTheme.headline4,
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        'Sing in with your account',
        style:
            Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
      ),
      const SizedBox(
        height: 16,
      ),
      const TextField(
        decoration: InputDecoration(label: Text('Username')),
      ),
      const PasswordTextField(),
      const SizedBox(
        height: 24,
      ),
      ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60))),
          onPressed: () {},
          child: const Text('LOGIN')),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Forgot your password?'),
          TextButton(onPressed: () {}, child: const Text('Reset Here'))
        ],
      ),
      const SizedBox(
        height: 32,
      ),
      const Center(
        child: Text(
          'OR SIGN IN WITH',
          style: TextStyle(letterSpacing: 2),
        ),
      ),
      const SizedBox(
        height: 8,
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
          Assets.img.icons.twitter.image(width: 36, height: 36)
        ],
      )
    ]);
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Welcome to Blog Club',
        style: Theme.of(context).textTheme.headline4,
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        'please enter your infromation',
        style:
            Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
      ),
      const SizedBox(
        height: 16,
      ),
      const TextField(
        decoration: InputDecoration(label: Text('Full name')),
      ),
      const TextField(
        decoration: InputDecoration(label: Text('Username')),
      ),
      const PasswordTextField(),
      const SizedBox(
        height: 24,
      ),
      ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60))),
          onPressed: () {},
          child: const Text('SIGN UP')),
      const SizedBox(
        height: 32,
      ),
      const Center(
        child: Text(
          'OR SIGN UP WITH',
          style: TextStyle(letterSpacing: 2),
        ),
      ),
      const SizedBox(
        height: 8,
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
          Assets.img.icons.twitter.image(width: 36, height: 36)
        ],
      )
    ]);
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

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
          label: const Text('Password'),
          suffix: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(
              obscureText ? 'Show' : 'Hide',
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.primary),
            ),
          )),
    );
  }
}
