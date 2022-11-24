import 'package:dosaan/login_screen.dart';
import 'package:dosaan/models/user.dart';
import 'package:dosaan/update_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppbarWidget(
          title: "My Profile",
          onBackClick: () {
            Navigator.of(context).pop();
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 36),
            const Text(
              "Username",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              initialValue: user?.name,
              decoration: const InputDecoration(
                hintText: "SimranAhitaan",
                hintStyle: TextStyle(color: Color(0xfff26b23)),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Email Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              initialValue: user?.email,
              decoration: const InputDecoration(
                hintText: "Simranahitaan1997@gmail.com",
                hintStyle: TextStyle(color: Color(0xfff26b23)),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Contact No.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "91 3874 374 243",
                hintStyle: TextStyle(color: Color(0xfff26b23)),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "********",
                suffixIcon: Icon(Icons.visibility),
                hintStyle: TextStyle(color: Color(0xfff26b23)),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 34),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdatePasswordScreen(),
                  ),
                );
              },
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "CHANGE PASSWORD",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                // ignore: sort_child_properties_last
                child: const Text(
                  "Edit Password",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xfff26b23),
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdatePasswordScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
