import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';


// ─────────────────────────────────────────────────────────────────────────────
// LogoutBottomSheet
// ─────────────────────────────────────────────────────────────────────────────

class DeleteBottomSheet extends StatelessWidget {
  /// Callback triggered when the user confirms the action by tapping "Yes, Logout"
  final VoidCallback? onConfirmLogout;

  const DeleteBottomSheet({
    super.key,
    this.onConfirmLogout,
  });

  /// Utility static method to handle the declarative imperative presentation flow
  static void show(
    BuildContext context, {
    VoidCallback? onConfirmLogout,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => DeleteBottomSheet(
        onConfirmLogout: onConfirmLogout,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      margin: Space.all(10).copyWith(
        bottom: MediaQuery.of(context).padding.bottom + 10.h,
      ),
      decoration: BoxDecoration(
        color: AppTheme.c.background.shade100,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Upper Drag Handle/Pill
          Center(
            child: Container(
              margin: Space.only(top: 16),
              width: 48.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppTheme.c.white,
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
          ),

          Space.yf(16),

          Padding(
            padding: Space.hf(16),
            child: Column(
              children: [
                // ── Interactive Header Bar with back arrow icon ──────────────
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/svgs/Arrow Left.svg', // Vector asset path
                      width: 24.w,
                      height: 24.h,
                      
                    ),
                  ),
                ),

                Space.yf(16),

                // ── Centralized Logout Visual Icon Graphic ───────────────────
                Container(
                  width: 92.w,
                  height: 92.h,
                  decoration: BoxDecoration(
                    color: AppTheme.c.lightGrey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/Trash Bin 2.svg', // Vector asset path
                      width: 60.w,
                      height: 60.h,
                    ),
                  ),
                ),

                Space.yf(16),

                // ── Prompt Title ─────────────────────────────────────────────
                Text(
                  'Do you really want to Delete Account?',
                  style: AppText.h5bm!.cl(AppTheme.c.text.shade100!),
                  textAlign: TextAlign.center,
                ),

                Space.yf(24),

                // ── Contextual Warning Body Text ─────────────────────────────
                Padding(
                  padding: Space.hf(16),
                  child: Text(
                    'You will loose the mogwar app details and all the active mogwars',
                    style: AppText.b1!.cl(AppTheme.c.text.main!),
                    textAlign: TextAlign.center,
                  ),
                ),

                Space.yf(16),

                // ── Dual Control Action Buttons Matrix ───────────────────────
                Row(
                  children: [
                    // Negative Action: Dismiss Flow
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: Space.all(42,16),
                          height: 52.h,
                          decoration: BoxDecoration(
                           color: AppTheme.c.background.shade100,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: AppTheme.c.lightGrey.main!,
                              width: 1.w,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'No, Cancel',
                              style: AppText.b1b!.cl(AppTheme.c.white!),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Space.xf(10),

                    // Destructive Affirmative Action: Commit Logout Execution
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          onConfirmLogout?.call();
                        },
                        child: Container(
                          height: 52.h,
                          decoration: BoxDecoration(
                            color: AppTheme.c.primary.main,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: UIProps.buttonShadow,
                          ),
                          child: Center(
                            child: Text(
                              'Yes, Delete',
                              style: AppText.b1b!.cl(AppTheme.c.white!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                Space.yf(24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}