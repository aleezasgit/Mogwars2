part of '../rewards.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      appBar: CustomAppBar(
        title: 'Rewards',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView.separated(
        padding: Space.all(16),
        itemCount: _kRewards.length,
        separatorBuilder: (_, __) => Space.yf(12),
        itemBuilder: (context, index) {
          return RewardCard(
            reward: _kRewards[index],
            onClaim: () => state.claimReward(index),
          );
        },
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final _RewardItem reward;
  final VoidCallback onClaim;

  const RewardCard({
    required this.reward,
    required this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final Color accentColor = switch (reward.status) {
      _RewardStatus.claimable => AppTheme.c.primary.main!,
      _RewardStatus.claimed => AppTheme.c.background.shade100!,
      _RewardStatus.locked => AppTheme.c.background.shade100!,
    };

    final Color progressColor = switch (reward.status) {
      _RewardStatus.claimable => const Color(0xffD617F5),
      _RewardStatus.claimed => AppTheme.c.primary.main!,
      _RewardStatus.locked => AppTheme.c.accent.green!,//blue
    };

    return Stack(
      children: [

        // ── Right Gradient Border ─────────────────────────────
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          child: Container(
            width: 2.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color(0xffD617F5),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),

        // ── Main Card ─────────────────────────────────────────
        Container(
          width: double.infinity,
          padding: Space.all(16),
          decoration: BoxDecoration(
            color: AppTheme.c.background.shade100,
            borderRadius: BorderRadius.circular(16.r),
            // border: Border.all(
            //   color: accentColor.withOpacity(0.15),
            //   width: 1.w,
            
          ),
          child: Column(
            children: [

              // ── Crate image ──────────────────────────────────────
              Image.asset(
                reward.imagePath,
                width: 101.w,
                height: 90.h,
              ),

              Space.yf(16),

              // ── Title ────────────────────────────────────────────
              Text(
                reward.title,
                style: AppText.h4b!.cl(AppTheme.c.white!),
              ),

              Space.yf(8),

              // ── Subtitle / Pro label ────────────────────────────
              if (reward.isProOnly && reward.proLabel != null)
                RichText(//text.rich
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pro Users ',
                        style: AppText.b1b!.cl(AppTheme.c.white!),
                      ),
                      TextSpan(
                        text: reward.proLabel!
                            .replaceFirst('Pro Users ', ' '),
                        style: AppText.b1b!.cl(
                          AppTheme.c.text.main!,
                        ),
                      ),
                    ],
                  ),
                )
              else if (reward.subtitle.isNotEmpty)
                Text(
                  reward.subtitle,
                  style: AppText.b1!.cl(
                    AppTheme.c.text.main!,
                  ),
                  textAlign: TextAlign.center,
                ),

              Space.yf(16),

              // ── Progress bar + count in same row ────────────────
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
                          borderRadius:
                              BorderRadius.circular(66.r),
                          child: Stack(
                            children: [

                              // Track
                              Container(
                                height: 8.h,
                                width: totalWidth,
                                color:
                                    AppTheme.c.background.main,
                              ),

                              // Fill
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 400,
                                ),
                                curve: Curves.easeOut,
                                height: 8.h,
                                width: fillWidth,
                                decoration: BoxDecoration(
                                  color: progressColor,
                                  borderRadius:
                                      BorderRadius.circular(
                                    37.r,
                                  ),
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
                    style: AppText.b1!.cl(
                      AppTheme.c.text.main!,
                    ),
                  ),
                ],
              ),

              Space.yf(10),

              // ── Centered Description ───────────────────────────
              Center(
                child: Text(
                  reward.description,
                  textAlign: TextAlign.center,
                  style: AppText.b1!.cl(
                    AppTheme.c.text.main!,
                  ),
                ),
              ),

              Space.yf(16),

              // ── Action button ──────────────────────────────────
              if (reward.status ==
                  _RewardStatus.claimable)
                Container(
                  width: 95.w,
                  decoration: 
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(79.r),
                  ),
                  child: AppButton(
                    verticalPadding: 8.h,
                    horizontalPadding: 25.w,
                    label: 'Claim Reward',
                    onPressed: onClaim,
                    backgroundColor:
                        AppTheme.c.primary.main,
                  ),
                )
              else if (reward.status ==
                  _RewardStatus.claimed)
                Container(
                    width: 95.w,
                  decoration: 
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(79.r),
                    color: AppTheme.c.background.shade100,
                    border: Border.all(color: const Color(0xff414141), width: 1.w),
                  ),
                  child: AppButton(
                    verticalPadding: 8.h,
                    horizontalPadding: 10.w,
                    label: 'Claimed',
                    onPressed: () {},
                    buttonType: ButtonType.outlined,
                    borderColor:
                        const Color(0xff414141),
                    textColor:
                        AppTheme.c.white,
                    isDisabled: true,
                    backgroundColor:
                        AppTheme.c.background.shade100,
                  ),
                )
         
            ],
          ),
        ),
      ],
    );
  }
}

//blue clr , claimed and locked , button, extra space in first item ,border.main, apptheme.c.gradient.diamond.blue/uiprops if title mog crate then linear else 
