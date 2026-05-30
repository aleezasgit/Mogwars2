part of '../rewards.dart';
class RewardCard extends StatelessWidget {
  final _RewardItem reward;
  final VoidCallback onClaim;

  const RewardCard({
    super.key,
    required this.reward,
    required this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final bool isMogCrate = reward.title == 'Mog Crate';
    final bool isMegaMogCrate = reward.title == 'Mega Mog Crate';

    // ── Fixed Logic: Explicitly assign stable layout colors based on reward tier type so status changes don't override them ──
    final Color progressColorStyle = isMegaMogCrate 
        ? const Color(0xffD617F5) // Mega Mog Crate stays explicitly purple regardless of claimed status
        : AppTheme.c.primary.main!; // Default fallback tracks stay red

    // Determine primary functional LinearGradient decoration sets
    final LinearGradient dynamicGradientTrack = isMogCrate
        ? UIProps.diamondBlue!
        : LinearGradient(
            colors: [progressColorStyle, progressColorStyle],
          );

    // Determine dynamic asset string to display based on runtime state
    final String activeDisplayImage = reward.status == _RewardStatus.claimed 
        ? reward.claimedImagePath 
        : reward.imagePath;

    return Stack(
      children: [
        // ── Main Card Structure Wrapper ─────────────────────────────────────
        Container(
          width: double.infinity,
          padding: Space.all(16),
          decoration: BoxDecoration(
            color: AppTheme.c.background.shade100,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              // ── Animated Crate Asset Renderer ─────────────────────────────
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Image.asset(
                  activeDisplayImage,
                  key: ValueKey<String>(activeDisplayImage),
                  width: 101.w,
                  height: 90.h,
                ),
              ),

              Space.yf(16),

              // ── Title Header ───────────────────────────────────────────────
              Text(
                reward.title,
                style: AppText.h4b!.cl(AppTheme.c.white!),
              ),

              Space.yf(8),

              // ── Dynamic Metadata Subtitle Row (Nested Text.rich execution) ─
              if (reward.isProOnly && reward.proLabel != null)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pro Users ',
                        style: AppText.b1!.cl(AppTheme.c.white!),
                      ),
                      TextSpan(
                        text: reward.proLabel!.replaceFirst('Pro Users ', ' '),
                        style: AppText.b1!.cl(AppTheme.c.text.main!),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                )
              else if (reward.subtitle.isNotEmpty)
                Text.rich(
                  TextSpan(
                    children: [
                      if (reward.subtitle.startsWith('1 Free')) ...[
                        TextSpan(
                          text: '1 Free ',
                          style: AppText.b1!.cl(AppTheme.c.white!),
                        ),
                        TextSpan(
                          text: reward.subtitle.replaceFirst('1 Free ', ''),
                          style: AppText.b1!.cl(AppTheme.c.text.main!),
                        ),
                      ] else if (reward.subtitle.startsWith('5 Successful')) ...[
                        TextSpan(
                          text: '5 ',
                          style: AppText.b1!.cl(AppTheme.c.white!),
                        ),
                        TextSpan(
                          text: reward.subtitle.replaceFirst('5 ', ''),
                          style: AppText.b1!.cl(AppTheme.c.text.main!),
                        ),
                      ] else ...[
                        TextSpan(
                          text: reward.subtitle,
                          style: AppText.b1!.cl(AppTheme.c.text.main!),
                        ),
                      ]
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

              Space.yf(16),

              // ── Continuous Progress Slider Matrix Row ──────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final totalWidth = constraints.maxWidth;
                        final fillWidth = reward.progress == 0
                            ? 8.w
                            : totalWidth * reward.progress;

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(66.r),
                          child: Stack(
                            children: [
                              // Track channel background
                              Container(
                                height: 8.h,
                                width: totalWidth,
                                color: AppTheme.c.background.main,
                              ),

                              // Progress filled volume
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeOut,
                                height: 8.h,
                                width: fillWidth,
                                decoration: BoxDecoration(
                                  gradient: dynamicGradientTrack,
                                  borderRadius: BorderRadius.circular(37.r),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Space.xf(8),
                  Text(
                    '${reward.current}/${reward.total}',
                    style: AppText.b1!.cl(AppTheme.c.text.main!),
                  ),
                ],
              ),

              Space.yf(10),

              // ── Description Notice ─────────────────────────────────────────
              Center(
                child: Text(
                  reward.description,
                  textAlign: TextAlign.center,
                  style: AppText.b1!.cl(AppTheme.c.text.main!),
                ),
              ),

              Space.yf(16),

              // ── Action Buttons Control Matrix ──────────────────────────────
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: reward.status == _RewardStatus.claimable
                    ? Container(
                        key: const ValueKey('btn_claimable'),
                        width: 95.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(79.r),
                        ),
                        child: AppButton(
                          verticalPadding: 8.h,
                          horizontalPadding: 10.h,
                          label: 'Claim Reward',
                          onPressed: onClaim,
                          backgroundColor: AppTheme.c.primary.main,
                        ),
                      )
                    : reward.status == _RewardStatus.claimed
                        ? Container(
                            key: const ValueKey('btn_claimed'),
                            width: 95.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(79.r),
                              color: AppTheme.c.background.shade100,
                              border: Border.all(
                                color: const Color(0xff414141),
                                width: 1.w,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Claimed',
                                style: AppText.l1bm!.cl(AppTheme.c.white!),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(key: ValueKey('btn_hidden')),
              ),
            ],
          ),
        ),

        // ── Bounded Corner Line Highlight Accent ─────────────────────────────
        Positioned.fill(
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.transparent,
                      dynamicGradientTrack.colors.first,
                      dynamicGradientTrack.colors.last,
                      Colors.transparent,
                    ],
                    stops: const [0, 0.2, 0.6, 0.8],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcIn,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide(width: 1.w, color: Colors.white),
                      bottom: BorderSide(width: 1.w, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}