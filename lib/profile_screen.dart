import 'package:dosaan/help_screen.dart';
import 'package:dosaan/history_screen.dart';
import 'package:dosaan/login_notifier.dart';
import 'package:dosaan/login_screen.dart';
import 'package:dosaan/my_profile_screen.dart';
import 'package:dosaan/screens/widgets/loading_dialog.dart';
import 'package:dosaan/services/local_storage_service.dart';
import 'package:dosaan/terms_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/user.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<User?>>(loginProvider, (previous, state) {
      state.when(
        data: (data) {
          ref.read(localStorageProvider).clearSession();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
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
          title: "Profile",
          onBackClick: () {
            Navigator.of(context).pop();
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 40),
            TileWidget(
              title: "My Profile",
              description: "Update your basic account information.",
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyProfileScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            TileWidget(
              title: "History",
              description: "Update & outlook your added surveys",
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            TextButton(
              child: const Text(
                "Terms & Conditions",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff26b23),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsConditionScreen(),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text(
                "Help",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff26b23),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpScreen(),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff26b23),
                ),
              ),
              onPressed: () {
                ref.read(loginProvider.notifier).logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onClick;

  const TileWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff808080),
            ),
          ),
        ],
      ),
    );
  }
}
