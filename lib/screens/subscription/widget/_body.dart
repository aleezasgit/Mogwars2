part of '../subscription.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Subscription',
        type: AppBarType.withTextCenter,
      ),
      body: Stack(
        children: [
          // ── Scrollable Layout Content ──────────────────────────────────────
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: UI.padding!.top + 20.h,
              bottom: 140.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.yf(40),

                // ── Brand Header Logotype ────────────────────────────────────
                Padding(
                  padding: Space.hf(16),
                  child: Row(
                    children: [
                      Text(
                        'Mog',
                        style: AppText.h3b!.cl(AppTheme.c.white!),
                      ),
                      Text(
                        'Pro',
                        style: AppText.h3b!.cl(AppTheme.c.primary.main!),
                      ),
                      Space.xf(4),
                      Container(
                        padding: Space.all(4),
                        decoration: BoxDecoration(
                          gradient: UIProps.diamondBlue,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/svgs/Vector.svg",
                          width: 12.w,
                          height: 12.w,
                          colorFilter: ColorFilter.mode(AppTheme.c.white!, BlendMode.srcIn),
                          placeholderBuilder: (_) => Icon(Icons.workspace_premium, size: 12.w, color: AppTheme.c.white),
                        ),
                      ),
                    ],
                  ),
                ),
                
                Space.yf(16),

                // ── Horizontal User Avatar Previews ──────────────────────────
                SizedBox(
                  height: 140.h,
                  child: ListView.separated(
                    padding: Space.hf(20),
                    scrollDirection: Axis.horizontal,
                    itemCount: _kProfilePreviews.length,
                    separatorBuilder: (_, __) => Container(
                      width: 1.5.w,
                      color: AppTheme.c.white!.withValues(alpha: 0.8),
                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: UI.width! / 4.4,
                        child: Image.asset(
                          _kProfilePreviews[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),

                Space.yf(24),

                // ── Core Headings ────────────────────────────────────────────
                Padding(
                  padding: Space.hf(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Become A ',
                            style: AppText.h4b!.cl(AppTheme.c.text.shade800!),
                          ),
                          Text(
                            'MogPro',
                            style: AppText.h4b!.cl(AppTheme.c.primary.main!),
                          ),
                          Text(
                            ' Member',
                            style: AppText.h4b!.cl(AppTheme.c.text.shade800!),
                          ),
                        ],
                      ),
                      Space.yf(4),
                      Text(
                        'Experience full potential of mogwar',
                        style: AppText.b1!.cl(AppTheme.c.text.main!),
                      ),
                    ],
                  ),
                ),

                Space.yf(12),

                // ── Free Column Header Label ─────────────────────────────────
                Padding(
                  padding: Space.only(left: 20, right: 78, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Free',
                        style: AppText.b2bm!.cl(AppTheme.c.text.shade200!),
                      ),
                    ],
                  ),
                ),

                Space.yf(8),

                // ── Combined Matrix Comparison Structure Layout ──────────────
                Padding(
                  padding: Space.only(left: 20, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Left Column: Feature Icons & Description Texts
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(_kPremiumFeatures.length, (index) {
                            final feature = _kPremiumFeatures[index];
                            final double fadeStep = (index / _kPremiumFeatures.length);
                            final double currentOpacity = (1.0 - (fadeStep * 0.65)).clamp(0.15, 1.0);

                            return Opacity(
                              opacity: currentOpacity,
                              child: Container(
                                height: 56.h,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      feature.iconSvg,
                                      width: 20.w,
                                      height: 20.w,
                                      colorFilter: ColorFilter.mode(
                                        AppTheme.c.text.shade200!,
                                        BlendMode.srcIn,
                                      ),
                                      placeholderBuilder: (_) => Icon(
                                        Icons.bolt_rounded,
                                        size: 20.w,
                                        color: AppTheme.c.text.shade200,
                                      ),
                                    ),
                                    Space.xf(12),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            feature.title,
                                            style: AppText.b1bm!.cl(AppTheme.c.text.shade100!),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Space.yf(2),
                                          Text(
                                            feature.subtitle,
                                            style: AppText.l2!.cl(AppTheme.c.text.main!),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
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

                      Space.xf(8),

                      // 2. Center Column: Free Status Column (Cross Icons Stack)
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(_kPremiumFeatures.length, (index) {
                            final double fadeStep = (index / _kPremiumFeatures.length);
                            final double currentOpacity = (1.0 - (fadeStep * 0.65)).clamp(0.15, 1.0);

                            return Opacity(
                              opacity: currentOpacity,
                              child: Container(
                                height: 56.h,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  "assets/svgs/cross.svg",
                                  width: 16.w,
                                  height: 16.w,
                                  colorFilter: ColorFilter.mode(
                                    AppTheme.c.error.main!,
                                    BlendMode.srcIn,
                                  ),
                                  placeholderBuilder: (_) => Icon(
                                    Icons.cancel,
                                    size: 16.w,
                                    color: AppTheme.c.error.main,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      Space.xf(8),

                      // 3. Right Column: Pro Track Container (Crown + Line + Checkboxes)
                      Container(
                        width: 54.w,
                        decoration: BoxDecoration(
                          color: AppTheme.c.background.shade100,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: AppTheme.c.lightGrey.main!.withValues(alpha: 0.15),
                            width: 1.w,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Top Crown Header Badge Element
                            Padding(
                              padding: Space.vf(12),
                              child: Container(
                                width: 28.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                  gradient: UIProps.diamondBlue,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/svgs/crown.svg",
                                    width: 14.w,
                                    height: 14.w,
                                    colorFilter: ColorFilter.mode(AppTheme.c.white!, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),

                            // Track Separation Line Divider
                            Container(
                              height: 1.h,
                              width: double.infinity,
                              color: AppTheme.c.lightGrey.main!.withValues(alpha: 0.15),
                            ),

                            // Sequential layout generation for Checkbox row indices
                            ...List.generate(_kPremiumFeatures.length, (index) {
                              final double fadeStep = (index / _kPremiumFeatures.length);
                              final double currentOpacity = (1.0 - (fadeStep * 0.65)).clamp(0.15, 1.0);

                              return Opacity(
                                opacity: currentOpacity,
                                child: Container(
                                  height: 56.h,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    "assets/svgs/tick.svg",
                                    width: 16.w,
                                    height: 16.w,
                                    colorFilter: ColorFilter.mode(
                                      AppTheme.c.text.shade100!.withValues(alpha: 0.9),
                                      BlendMode.srcIn,
                                    ),
                                    placeholderBuilder: (_) => Icon(
                                      Icons.check_circle,
                                      size: 16.w,
                                      color: AppTheme.c.white,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120.h),
              ],
            ),
          ),

          // ── Bottom Fixed CTA Container ─────────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: Space.only(left: 20, right: 20, top: 20, bottom: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppTheme.c.background.main!.withValues(alpha: 0.95),
                    AppTheme.c.background.main!,
                  ],
                  stops: const [0.0, 0.2, 1.0],
                ),
              ),
              child: GestureDetector(
                onTap: () => state.purchaseSubscription(context),
                child: Container(
                  height: 54.h,
                  decoration: BoxDecoration(
                    color: AppTheme.c.primary.main,
                    borderRadius: BorderRadius.circular(UIProps.radius),
                  ),
                  child: Center(
                    child: state.isLoading
                        ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: CircularProgressIndicator(
                              color: AppTheme.c.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Subscribre \$5.99/month',
                            style: AppText.b1b!.cl(AppTheme.c.white!),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}