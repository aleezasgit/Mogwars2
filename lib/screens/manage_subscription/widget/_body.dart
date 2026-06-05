part of '../manage.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
     // extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Subscription',
        type: AppBarType.withTextCenter,
      ),
      body: Stack(
        children: [
          // ── Scrollable Layout Content ──────────────────────────────────────
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              top: UI.padding!.top + 16.h,
              bottom: 140.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.yf(16),

                // ── MogPro title + crown ─────────────────────────────────────
                Padding(
                  padding: Space.hf(16),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Mog',
                              style: AppText.h3b!.cl(AppTheme.c.text.shade100!),
                            ),
                            TextSpan(
                              text: 'Pro',
                              style: AppText.h3b!.cl(AppTheme.c.primary.main!),
                            ),
                          ],
                        ),
                      ),
                      Space.xf(4),
                      Container(
                        padding: Space.all(6, 2),
                        decoration: BoxDecoration(
                          gradient: UIProps.diamondBlue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: SvgPicture.asset(
                          "assets/svgs/Vector.svg",
                        ),
                      ),
                    ],
                  ),
                ),
                
                Space.yf(20),

                // ── Horizontal preview images ────────────────────────────────
               Image.asset(
                    'assets/pngs/Frame 2147229336.png',
                    height: 111.h,
                   // width: double.infinity,
                  ),
                Space.yf(24),

                // ── Become A MogPro Member Header ────────────────────────────
                Padding(
                  padding: Space.hf(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome MogPro Member',
                        style: AppText.h4b!.cl(AppTheme.c.white!),
                      ),
                      Space.yf(8),
                      Text(
                        'Experience full potential of mogwar',
                        style: AppText.b1!.cl(AppTheme.c.text.main!),
                      ),
                    ],
                  ),
                ),

                Space.yf(24),

                // ── Combined Matrix Comparison Structure Layout ──────────────
                Padding(
                  padding: Space.hf(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Left Column: Feature Icons & Description Texts
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(_kFeatures.length, (index) {
                            final feature = _kFeatures[index];
                            final int fadeStartIndex = _kFeatures.length - 3;
                            final double currentOpacity = index < fadeStartIndex
                                ? 1.0
                                : 1.0 - ((index - fadeStartIndex + 1) / 4.0).clamp(0.0, 1.0);

                            return Opacity(
                              opacity: currentOpacity,
                              child: Container(
                                height: 56.h,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      feature.iconPath,
                                      width: 18.w,
                                      height: 18.h,
                                    ),
                                    Space.xf(10),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            feature.title,
                                            style: AppText.b1bm!.cl(AppTheme.c.white!),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          if (feature.subtitle.isNotEmpty) ...[
                                            Space.yf(4),
                                            Text(
                                              feature.subtitle,
                                              style: AppText.l1!.cl(AppTheme.c.text.main!),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Bottom fade overlay ────────────────────────────────────────────
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 160.h,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.c.background.main!.withOpacity(0),
                      AppTheme.c.background.main!.withOpacity(0.6),
                      AppTheme.c.background.main!,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),

          //
          // 
          //
    //       Positioned(
            
    //         left: 20.w,
    //         right: 20.w,
    //         bottom: 8.h,
    //         child: Text(
    //           "Manage Subscription",
    //           style: AppText.b1b!.cl(AppTheme.c.accent.red!).copyWith(
    // decoration: TextDecoration.underline,
    // decorationColor: AppTheme.c.accent.red, // Keeps underline color matching the text
    // decorationThickness: 1,),
            
    //         )
    //       ),
    //       //── Subscribe button pinned at bottom ──────────────────────────────
    //       Positioned(
            
    //         left: 20.w,
    //         right: 20.w,
    //         bottom: 32.h,
    //         child: AppButton(
    //           label: 'Activ until May24',
    //           onPressed: state.subscribe,
    //           backgroundColor: AppTheme.c.background.main,
    //           buttonType: ButtonType.outlined,
    //         ),
    //       ),

    // ── 2. Fixed Bottom Control Layer (The Combined Positioned Fix) ──────────────────
        Positioned(
          left: 20.w,
          right: 20.w,
          bottom: 32.h,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Wraps both elements tightly together
            children: [
              // ── Manage Subscription Text Link ──
              GestureDetector(
                onTap: () {
                  // Connects to your state subscription manager handler
                },
                child: Text(
                  "Manage Subscription",
                  style: AppText.b1b!.cl(AppTheme.c.accent.red!).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppTheme.c.accent.red, // Keeps underline color matching the text
                    decorationThickness: 1,
                  ),
                ),
              ),

              Space.yf(16), // Perfectly spaces the text above the button frame path

              // ── Main Action Button ──
             Padding(
                padding: Space.hf(0), // Ensures button doesn't stretch edge to edge
                child: AppButton(
                  label: 'Activ until May24',
                  onPressed: state.subscribe,
                  backgroundColor: AppTheme.c.background.main,
                  buttonType: ButtonType.outlined,
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CheckCircle Core Component
// ─────────────────────────────────────────────────────────────────────────────

// ignore: unused_element
class _CheckCircle extends StatelessWidget {
  final bool checked;
  final Color activeColor;
  final Color inactiveColor;

  const _CheckCircle({
    required this.checked,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = checked ? activeColor : inactiveColor;

    return Container(
      width: 16.w,
      height: 16.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 1.5.w),
      ),
      child: Center(
        child: Icon(
          Icons.check_rounded,
          size: 13.sp,
          color: color,
        ),
      ),
    );
  }
}