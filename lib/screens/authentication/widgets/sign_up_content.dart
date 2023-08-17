import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_gradient_text.dart';
import '../../../core/widgets/custom_textfield.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              child: Text(
                '',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.colorPrimary,
                    ),
              ),
            ),
          ),
          const Spacer(),
          GradientText(
            'Inscrivez-vous',
            gradient: const LinearGradient(
                colors: [AppColors.colorPrimary2, AppColors.colorPrimary]),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.colorPrimary),
          ),
          // SizedBox(height: 35.h),
          const Spacer(),
          const CustomTextField(
              label: 'Nom complet', icon: Icons.person_outline),
          SizedBox(height: 15.h),
          const CustomTextField(
              label: 'Nom d\'utilisateur', icon: Icons.person_3_outlined),
          SizedBox(height: 15.h),
          const CustomTextField(
            label: 'Mot de passe',
            icon: Icons.lock_outline,
          ),

          SizedBox(height: 5.h),
          // const Spacer(),
          Align(
            alignment: Alignment.center,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pays actuel: ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14.5.sp),
                  ),
                  Text(
                    'TOGO 🇹🇬',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorPrimary,
                        ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 25.h),
          const Spacer(flex: 2),
          // if (progress == 1)
          CustomButton(
            label: 'S\'inscrire',
            backgroundColor: AppColors.colorPrimary,
            labelColor: Colors.white,
            onTap: () {},
          ),
          const Spacer(),
          // SizedBox(height: 15.h),
          // RichText(
          //   text: const TextSpan(text: 'Vous n\'avez pas de compte?'),
          // ),
        ],
      ),
    );
  }
}
