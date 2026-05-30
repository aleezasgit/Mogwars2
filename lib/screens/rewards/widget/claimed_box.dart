import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mogwars/configs/configs.dart';

class ClaimSuccessDialog extends StatelessWidget {
  /// The only dynamic asset token passed to swap out the visual reward graphic
  final String imagePath;

  /// Dismissal configuration timing rule to automatically clear dialogue tracking context.
  /// Defaults to 3 seconds. Pass null to deactivate automatic closure behavior models.
  final Duration? autoDismissDuration;

  const ClaimSuccessDialog({
    super.key,
    required this.imagePath,
    this.autoDismissDuration = const Duration(seconds: 3),
  });

  /// Declarative helper method to trigger the dialogue implementation effortlessly
  static void show(
    BuildContext context, {
    required String imagePath,
    Duration? autoDismissDuration = const Duration(seconds: 3),
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      barrierDismissible: true,
      builder: (_) => ClaimSuccessDialog(
        imagePath: imagePath,
        autoDismissDuration: autoDismissDuration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    // Wire automatic routing state dismissal logic closures if valid configurations exist
    if (autoDismissDuration != null) {
      Future.delayed(autoDismissDuration!, () {
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      });
    }

    return Dialog(
      backgroundColor: Colors.transparent,
    //  insetPadding: Space.hf(24),
      elevation: 0,
      child: Container(
     //   width: double.infinity,
        padding: Space.all(16,24),
        decoration: BoxDecoration(
          color: AppTheme.c.background.shade100,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: AppTheme.c.lightGrey.main!.withValues(alpha: 0.15),
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Background Ray Burst Stack Graphic ───────────────────────────
            Image.asset(
              imagePath,
              width: 247.w,
              height: 201,
              fit: BoxFit.contain,
            
            ),

            Space.yf(34),

            // ── Static Title Header Label ────────────────────────────────────
            Text(
              'Claimed Successfully !',
              style: AppText.h4b!.cl(AppTheme.c.white!),
              textAlign: TextAlign.center,
            ),

            Space.yf(8),

            // ── Rich Text Subtitle split style formulation ───────────────────
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '1 Free ',
                    style: AppText.b1!.cl(AppTheme.c.white!), // Highlighted prominent text
                  ),
                  TextSpan(
                    text: 'Advertisement Video',
                    style: AppText.b1!.cl(AppTheme.c.text.main!), // Soft muted descriptive text
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),

            Space.yf(34),

            // ── Base Accent Target Meta Context Footer ───────────────────────
            Text(
              'You can rate 2 card with this reward',
              style: AppText.h5!.cl(AppTheme.c.text.shade100!),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}