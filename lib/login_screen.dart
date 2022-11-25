import 'package:dosaan/forgot_password_screen.dart';
import 'package:dosaan/home_screen.dart';
import 'package:dosaan/login_notifier.dart';
import 'package:dosaan/models/user.dart';
import 'package:dosaan/screens/widgets/loading_dialog.dart';
import 'package:dosaan/terms_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<User?>>(loginProvider, (previous, state) {
      state.when(
        data: (data) {
          if (previous != null && previous is AsyncLoading) {
            Navigator.of(context).pop();
          }
          if (data != null) {
            ref.read(userProvider.notifier).update((state) => data);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
        error: (error, st) {
          if (previous != null && previous is AsyncLoading) {
            Navigator.of(context).pop();
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
            ),
          );
        },
        loading: () {
          showDialog(
            context: context,
            builder: (context) {
              return const LoadingDialog();
            },
          );
        },
      );
    });

    return Scaffold(
      appBar: AppbarWidget(
        onBackClick: () {
          Navigator.of(context).maybePop();
        },
        title: "Login",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              color: Color(0xff231f20)),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Enter your credentials to continue",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff808080)),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        TextFormField(
                          onSaved:
                              ref.read(loginProvider.notifier).onSaveUsername,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email field can't be empty";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Enter email address",
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          obscuringCharacter: "*",
                          onSaved:
                              ref.read(loginProvider.notifier).onSavePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password field can't be empty";
                            }
                            return null;
                          },
                          obscureText: obscured,
                          decoration: InputDecoration(
                            hintText: "********",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscured = !obscured;
                                });
                              },
                              icon: Icon(obscured
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordScreen()),
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xfff26b23),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width / 2, 50),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                ref.watch(loginProvider.notifier).login();
                              }
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TermsConditionScreen()),
                        );
                      },
                      child: const Text(
                        "By continuing you will accept our Terms and conditions",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff2587db),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackClick;
  const AppbarWidget({Key? key, required this.title, required this.onBackClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SizedBox.fromSize(
        size: Size.fromHeight(padding + 50),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              child: Row(
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: onBackClick,
                    icon: Image.asset(
                      "assets/images/arrow-left.png",
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
