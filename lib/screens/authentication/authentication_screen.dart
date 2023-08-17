import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/app_colors.dart';
import 'widgets/password_forgot_content.dart';
import 'widgets/sign_in_content.dart';
import 'widgets/sign_up_content.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late PageController _pageController;
  double _progress = 0;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController()
      ..addListener(
        () {
          setState(() {
            _progress = _pageController.page ?? 0;
          });
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          // alignment: Alignment.topCenter,
          children: [
            Container(
              height: (size.height * 0.60) -
                  (_progress > 1 ? -1.5 : _progress * 140),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    AppColors.colorPrimary.withOpacity(.5),
                    BlendMode.darken,
                  ),
                  image: const AssetImage('assets/images/cover.jpg'),
                ),
              ),
              padding: EdgeInsets.all(90.w),
              child: Image.asset(
                'assets/images/keaz.png',
                height: 90.h,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: (size.height * 0.50) +
                  (_progress > 1 ? -1.5 : _progress * 110),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.h),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SignInContent(
                          progress: _progress,
                          onPasswordForgotPressed: () {
                            _pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                        ),
                        SignUpContent(progress: _progress),
                        const PasswordForgotContent(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (_currentPage == 0) {
                            _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          } else {
                            _pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.w, horizontal: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.w),
                            border: Border.all(color: AppColors.colorPrimary),
                          ),
                          child: Text(
                            _currentPage == 1 || _currentPage == 2
                                ? 'Se connecter'
                                : 'S\' inscrire',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.colorPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
