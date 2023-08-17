import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/splash_background.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/bank_card.png',
                    fit: BoxFit.scaleDown,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 40.h),
                RichText(
                  text: TextSpan(
                    text: 'Bienvenue sur Keaz. La banque à portée de doigt',
                    children: const [],
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.3,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Connectez-vous à MyKeaz et profitez d\'une expérience riche et intuitive 🚀.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white.withOpacity(.85),
                        height: 1.6,
                        fontSize: 16.sp,
                      ),
                ),
                const SizedBox(height: 34),
                CustomButton(
                  label: 'Se connecter',
                  onTap: () {
                    context.push('/authentication');
                  },
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
