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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: Space.all(8),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.c.background.shade100!.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppTheme.c.text.shade100,
                size: 20.w,
              ),
            ),
          ),
        ),
        title: Text(
          'Subscription',
          style: AppText.h6b!.cl(AppTheme.c.text.shade800!),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // ── Scrollable Layout Content ──────────────────────────────────────
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 120.h, // Space for the floating CTA container
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: UI.padding!.top + 55.h),

                // ── Brand Header Logotype ────────────────────────────────────
                Padding(
                  padding: Space.hf(20),
                  child: Row(
                    children: [
                      Text(
                        'Mog',
                        style: AppText.h3b!.cl(AppTheme.c.text.shade800!),
                      ),
                      Text(
                        'Pro',
                        style: AppText.h3b!.cl(AppTheme.c.primary.main!),
                      ),
                      Space.xf(6),
                      Container(
                        padding: Space.all(4),
                        decoration: BoxDecoration(
                          color: AppTheme.c.primaryGradient.endColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/svgs/crown.svg",
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

                // ── Free vs Premium Header Labels ────────────────────────────
                Padding(
                  padding: Space.only(left: 20, right: 28, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Free',
                        style: AppText.b2bm!.cl(AppTheme.c.text.shade200!),
                      ),
                      Space.xf(32),
                      Container(
                        padding: Space.all(4),
                        decoration: BoxDecoration(
                          color: AppTheme.c.primaryGradient.endColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/svgs/crown.svg",
                          width: 10.w,
                          height: 10.w,
                          colorFilter: ColorFilter.mode(AppTheme.c.white!, BlendMode.srcIn),
                          placeholderBuilder: (_) => Icon(Icons.star, size: 10.w, color: AppTheme.c.white),
                        ),
                      ),
                    ],
                  ),
                ),

                Space.yf(8),

                // ── Combined Features & Matrix Column Layout ──────────────────
                Padding(
                  padding: Space.only(left: 20, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column: Feature Titles and Icons
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: _kPremiumFeatures.length,
                          itemBuilder: (context, index) {
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
                          },
                        ),
                      ),

                      Space.xf(8),

                      // Right Column: The strictly bounded vertical Container track
                      Container(
                        width: 96.w,
                        decoration: BoxDecoration(
                          color: AppTheme.c.background.shade100,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: AppTheme.c.lightGrey.main!.withValues(alpha: 0.15),
                            width: 1.w,
                          ),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          itemCount: _kPremiumFeatures.length,
                          itemBuilder: (context, index) {
                            final feature = _kPremiumFeatures[index];
                            final double fadeStep = (index / _kPremiumFeatures.length);
                            final double currentOpacity = (1.0 - (fadeStep * 0.65)).clamp(0.15, 1.0);

                            return Opacity(
                              opacity: currentOpacity,
                              child: Container(
                                height: 56.h,
                                padding: Space.hf(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Free Segment Column indicator
                                    SizedBox(
                                      width: 28.w,
                                      child: Center(
                                        child: feature.isAvailableInFree
                                            ? SvgPicture.asset(
                                                "assets/svgs/tick.svg",
                                                width: 14.w,
                                                height: 14.w,
                                                colorFilter: ColorFilter.mode(AppTheme.c.lightGrey.shade500!, BlendMode.srcIn),
                                              )
                                            : Text(
                                                '-',
                                                style: AppText.b1!.cl(AppTheme.c.lightGrey.main!),
                                              ),
                                      ),
                                    ),

                                    // Pro Segment Column indicator (With highlighted top capsule badge styling)
                                    Container(
                                      width: 32.w,
                                      height: 32.h,
                                      decoration: BoxDecoration(
                                        color: index == 0
                                            ? AppTheme.c.primaryGradient.endColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          index == 0 ? "assets/svgs/crown.svg" : "assets/svgs/tick.svg",
                                          width: index == 0 ? 14.w : 16.w,
                                          height: index == 0 ? 14.w : 16.w,
                                          colorFilter: ColorFilter.mode(
                                            index == 0 
                                                ? AppTheme.c.white! 
                                                : AppTheme.c.text.shade100!.withValues(alpha: 0.9),
                                            BlendMode.srcIn,
                                          ),
                                          placeholderBuilder: (_) => Icon(
                                            index == 0 ? Icons.king_bed_rounded : Icons.check,
                                            size: 14.w,
                                            color: AppTheme.c.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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
                    boxShadow: UIProps.buttonShadow,
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