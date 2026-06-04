part of '../subscription2.dart';

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
            physics: const BouncingScrollPhysics(),
           padding:EdgeInsets.only(
              top: UI.padding!.top + 16.h, // ✅ FIXED: Safely maps touch layout view scrolling boundaries
              bottom: 140.h,),

         
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
                          // width: 12.w,
                          // height: 9.h,
                        )
                         
                      ),
                    ],
                  ),
                ),
                
                Space.yf(20),

                // ── Horizontal preview images ────────────────────────────────
                SizedBox(
                  height: 100.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _kPreviewImages.length,
                    separatorBuilder: (_, __) => Container(
                      width: 1.w,
                      color: AppTheme.c.white!,
                    ),
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _kPreviewImages[index],
                        width: 111.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),

                Space.yf(24),

                // ── Become A MogPro Member Header ────────────────────────────
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

                // ── Combined Header Row (Free text label and Premium badge side-by-side) ──
                Padding(
                  padding: Space.hf(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Free Label sizing aligned perfectly over the middle column width
                      Center(
                        child: Text(
                          'Free',
                          style: AppText.b1!.cl(AppTheme.c.text.shade100!),
                        ),
                      ),
                      Space.xf(13),
                      // Bounded Premium Column Crown Container matching Right track block structure dimensions
                //       Container(
                //         padding: Space.all(10, 12),
                //         width: 44.w,
                //         height: 41.h,
                //         decoration: BoxDecoration(
                //           color: AppTheme.c.background.shade500,
                //           borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(16.r), 
                //             topRight: Radius.circular(16.r),
                //           ),
                //           border: Border.all(
                //             color: AppTheme.c.lightGrey.main!,
                //             width: 1.w,
                //           ),
                //         ),
                //         child: Center(
                //           child: Container(
                //             width: 24.w,
                //             height: 17.h,
                //             decoration: BoxDecoration(
                //               gradient: UIProps.diamondBlue,
                //               borderRadius: BorderRadius.circular(8.r),
                //             ),
                //             child: Center(
                //               child: SvgPicture.asset(
                //                 'assets/svgs/Vector.svg',
                //                 width: 12.w,
                //                 height: 9.14.h,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                        padding: Space.all(10, 12),
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
                    ],
                  ),
                ),

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

                      Space.xf(35),

                      // 2. Center Column: Free Status CheckCircle Column
                     SizedBox(
                        width: 40.w,
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
                                height: 56.h, // ⬅️ Forces the row bounding block to match the text column height
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  
                                     
                                       "assets/svgs/cross.svg",
                                  width: 16.w,
                                  height: 16.h,
                                
                                  placeholderBuilder: (_) => Icon(
                                    feature.freeIncluded ? Icons.check_circle : Icons.cancel,
                                    size: 16.w,
                                    color: feature.freeIncluded ? AppTheme.c.white : AppTheme.c.error.main,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      Space.xf(19),

                      // 3. Right Column: Pro Track Container Box Wrapper
                      Container(
                        width: 44.w,
                       // padding: Space.all(14, 12),
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
                          
                            final feature = _kFeatures[index];
                            final int fadeStartIndex = _kFeatures.length - 3;
                            final double currentOpacity = index < fadeStartIndex
                                ? 1.0
                                : 1.0 - ((index - fadeStartIndex + 1) / 4.0).clamp(0.0, 1.0);

                            return Opacity(
                              opacity: currentOpacity,
                              child: Container(
                                height: 56.h, // ⬅️ Forces the row bounding block to match the text column height
                                alignment: Alignment.center,
                                child: Container(
                                  padding: Space.all(4.3,5.3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:  AppTheme.c.white,

                                  ),
                                  width: 16.w,
                                  height: 16.h,
                                  child: SvgPicture.asset(
                                    
                                       
                                    "assets/svgs/blacktick.svg",
                                  
                                  
                               
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

          // ── Subscribe button pinned at bottom ──────────────────────────────
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 32.h,
            child: AppButton(
              label: 'Subscribre \$5.99/month',
              onPressed: state.subscribe,
              backgroundColor: AppTheme.c.primary.main,
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