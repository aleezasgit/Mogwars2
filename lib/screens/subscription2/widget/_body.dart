part of '../subscription2.dart';

class _Body extends StatelessWidget {
  const _Body();

  double _opacity(int index) {
    final fadeStart = _kFeatures.length - 3;
    return index < fadeStart
        ? 1.0
        : 1.0 - ((index - fadeStart + 1) / 4.0).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    // ── If subscribed → push to manage screen ─────────────────────────
    if (state.isSubscribed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        state.isSubscribed = false; // reset so back navigation works
        AppRoutes.manageSubscription.push(context);
      });
    }

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      appBar: CustomAppBar(
        title: 'Subscription',
        type: AppBarType.withTextCenter,
      ),
      body: Stack(
        children: [
          // ── Scrollable content ───────────────────────────────────
          SingleChildScrollView(
            padding: Space.only(bottom: 110),
            child: AppBackground(
              includeTopPadding: true,
              horizontalPadding: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.yf(16),

                  // ── MogPro title + crown ───────────────────────
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
                          padding: Space.all(6, 4),
                          decoration: BoxDecoration(
                            gradient: UIProps.diamondBlue,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SvgPicture.asset('assets/svgs/crown.svg'),
                        ),
                      ],
                    ),
                  ),

                  Space.yf(20),

                  // ── Preview image ──────────────────────────────
                  Image.asset(
                    'assets/pngs/Frame 2147229336.png',
                    height: 111.h,
                  ),

                  Space.yf(24),

                  // ── Become A MogPro Member Header ──────────────
                  Padding(
                    padding: Space.hf(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Become A ',
                                style: AppText.h4b!.cl(AppTheme.c.text.shade100!),
                              ),
                              TextSpan(
                                text: 'MogPro',
                                style: AppText.h4b!.cl(AppTheme.c.primary.main!),
                              ),
                              TextSpan(
                                text: ' Member',
                                style: AppText.h4b!.cl(AppTheme.c.text.shade100!),
                              ),
                            ],
                          ),
                        ),
                        Space.yf(8),
                        Text(
                          'Experience full potential of mogwar',
                          style: AppText.b1!.cl(AppTheme.c.text.main!),
                        ),
                      ],
                    ),
                  ),

                  Space.yf(8),

                  // ── Comparison table ───────────────────────────
                  Padding(
                    padding: Space.hf(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Features column
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 41.h),
                              ...List.generate(_kFeatures.length, (index) {
                                return Opacity(
                                  opacity: _opacity(index),
                                  child: Container(
                                    height: 56.h,
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          _kFeatures[index].iconPath,
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
                                                _kFeatures[index].title,
                                                style: AppText.b1bm!.cl(AppTheme.c.white!),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              if (_kFeatures[index].subtitle.isNotEmpty) ...[
                                                Space.yf(4),
                                                Text(
                                                  _kFeatures[index].subtitle,
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
                            ],
                          ),
                        ),

                        Space.xf(12),

                        // Free column
                        SizedBox(
                          width: 40.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 41.h,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: Space.only(bottom: 8),
                                    child: Text(
                                      'Free',
                                      style: AppText.b1!.cl(AppTheme.c.text.shade100!),
                                    ),
                                  ),
                                ),
                              ),
                              ...List.generate(_kFeatures.length, (index) {
                                return Opacity(
                                  opacity: _opacity(index),
                                  child: Container(
                                    height: 56.h,
                                    alignment: Alignment.center,
                                     child:Center(
                             child: Container(
                                width: 16.w,
                                height: 16.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.c.error.main,
                                ),
                               child: Icon(
                                Icons.close, 
                                size: 6.sp,
                               color: AppTheme.c.black,
                               ),
                             ),
                              ),
                                 
                                  ),
                                );  
                              }),
                            ],
                          ),
                        ),

                        Space.xf(12),

                        // Pro column
                        SizedBox(
                          width: 44.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Crown badge header
                              Container(
                                width: 44.w,
                                height: 41.h,
                                decoration: BoxDecoration(
                                  color: AppTheme.c.background.shade500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    topRight: Radius.circular(16.r),
                                  ),
                                  border: Border.all(
                                    color: AppTheme.c.lightGrey.main!,
                                    width: 1.w,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 24.w,
                                    height: 17.h,
                                    decoration: BoxDecoration(
                                      gradient: UIProps.diamondBlue,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/svgs/crown.svg',
                                        width: 12.w,
                                        height: 9.14.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Check items container
                              Container(
                                width: 44.w,
                                decoration: BoxDecoration(
                                  color: AppTheme.c.background.shade100,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.r),
                                    bottomRight: Radius.circular(16.r),
                                  ),
                                  border: Border.all(
                                    color: AppTheme.c.lightGrey.main!,
                                    width: 1.w,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(_kFeatures.length, (index) {
                                    return Opacity(
                                      opacity: _opacity(index),
                                      child: Container(
                                        height: 56.h,
                                        alignment: Alignment.center,
                                        child:  
                                      Container(
                                          width: 16.w,
                                          height: 16.h,
                                        //  padding: Space.all(4.3, 5.3),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppTheme.c.white,
                                          ),
                                         child: Center(
                                            child: Icon(
                                              Icons.check_rounded,
                                              size: 6.sp, // Scales inner icon asset cleanly like cancel vector matrix
                                              color: AppTheme.c.black, // Dynamic theme background shade
                                            ),
                                          ),
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

                  Space.yf(32),
                ],
              ),
            ),
          ),

          // ── Bottom fade overlay ──────────────────────────────────
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 140.h,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.c.background.main!.withOpacity(0),
                      AppTheme.c.background.main!.withOpacity(0.8),
                      AppTheme.c.background.main!,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // ── Subscribe button pinned at bottom ────────────────────
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 32.h,
            child: AppButton(
              label: 'Subscribe \$5.99/month',
              onPressed: state.subscribe,
              backgroundColor: AppTheme.c.primary.main,
            ),
          ),
        ],
      ),
    );
  }
}

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
        child: Icon(Icons.check_rounded, size: 13.sp, color: color),
      ),
    );
  }
}