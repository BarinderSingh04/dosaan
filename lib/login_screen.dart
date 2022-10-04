import 'package:dosaan/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        onBackClick: () {},
        title: "Login",
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
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
              style: TextStyle(fontSize: 14, color: Color(0xff808080)),
            ),
            const SizedBox(height: 32),
            const Text(
              "Username",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Simranahitaan1997@gmail.com",
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xff808080)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(height: 16),
            const Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "********",
                suffixIcon:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.visibility)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 28),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                   Navigator.push(
                      context,
               MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),);
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text(
                  "Log in",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xfff26b23),
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 260),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "By continuing you will accept our Terms and conditions",
                style: TextStyle(
                  color: Color(0xff2587db),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      )),
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
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: SizedBox.fromSize(
        size: Size.fromHeight(padding + 46),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Row(
                children: [
                  IconButton(
                      color: Colors.white,
                      onPressed: onBackClick,
                      icon: Image.asset("assets/images/arrow-left.png")),
                  const SizedBox(width: 8.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
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
