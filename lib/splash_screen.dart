
import 'package:dosaan/onboarding_screen.dart';
import 'package:dosaan/home_screen.dart';
import 'package:dosaan/login_screen.dart';
import 'package:dosaan/models/user.dart';
import 'package:dosaan/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff231f20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/Logo_Black.png"),
        ],
      ),
    );
  }

  void initialOnboarding() async {
    try {
      final token = await ref.read(localStorageProvider).getToken();
      final onBoarding = ref.read(localStorageProvider).getOnBoarding();
      final user = ref.read(localStorageProvider).getUserDetails();

      await Future.delayed(const Duration(milliseconds: 1200));
      if (!mounted) return;
      if (onBoarding != null) {
        if (token != null && user != null) {
          ref.read(userProvider.notifier).update((state) => state = user);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              settings: const RouteSettings(name: "/otp"),
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
        );
      }
    } catch (e) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          settings: const RouteSettings(name: "/otp"),
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }
}
