part of '../analytics.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return GestureDetector(
      onTap: state.dismissTooltips,
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Analytics',type: AppBarType.withTextCenter,),
        backgroundColor: AppTheme.c.background.main,
        body: SingleChildScrollView(
          padding: Space.hf(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // Space.yf(UI.padding!.top + 16),

              // ── Ranking section ────────────────────────────────
              _SectionHeader(
                title: 'Ranking',
                tooltip: 'Your position on global and local leaderboards based on your overall rating performance.',
                showTooltip: state.showRankingTooltip,
                onInfoTap: state.toggleRankingTooltip,
              ),

              Space.yf(12),

              // ── Global + Local Rank boxes ──────────────────────
              Row(
                children: [
                  Expanded(
                    child: _RankBox(
                      label: 'Global Rank',
                      value: '#15',
                      valueColor: AppTheme.c.primary.main!,
                    ),
                  ),
                  Space.xf(12),
                  Expanded(
                    child: _RankBox(
                      label: 'Local Rank',
                      value: '#12',
                      valueColor: AppTheme.c.accent.orange!,
                    ),
                  ),
                ],
              ),

              Space.yf(20),

              // ── Ascension History chart card ───────────────────
              _ChartCard(
                title: 'Ascension History',
                period: state.rankingPeriod,
                onPeriodTap: state.setRankingPeriod,
                topLabel: '9 / 10 Rating',
                topLabelStyle: AppText.h5b!.cl(AppTheme.c.text.shade100!),
              ),

              Space.yf(20),

              // ── Rating section ─────────────────────────────────
              _SectionHeader(
                title: 'Rating',
                tooltip: 'Your average score from users who rated your profile, shown overall and by gender.',
                showTooltip: state.showRatingTooltip,
                onInfoTap: state.toggleRatingTooltip,
              ),

              Space.yf(12),

              // ── Male + Female rating boxes ─────────────────────
              Row(
                children: [
                  Expanded(
                    child: _RankBox(
                      label: 'Male Rating',
                      value: '9.0',
                      valueColor: AppTheme.c.primary.main!,
                    ),
                  ),
                  Space.xf(12),
                  Expanded(
                    child: _RankBox(
                      label: 'Female Rating',
                      value: '2.0',
                      valueColor: AppTheme.c.accent.orange!,
                    ),
                  ),
                ],
              ),

              Space.yf(20),

              // ── Male Rating chart ──────────────────────────────
              _ChartCard(
                title: 'Male Rating',
                period: state.maleRatingPeriod,
                onPeriodTap: state.setMaleRatingPeriod,
              ),

              Space.yf(20),

              // ── Female Rating chart ────────────────────────────
              _ChartCard(
                title: 'Female Rating',
                period: state.femaleRatingPeriod,
                onPeriodTap: state.setFemaleRatingPeriod,
              ),

              Space.yf(32),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section Header with info tooltip
// ─────────────────────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final String tooltip;
  final bool showTooltip;
  final VoidCallback onInfoTap;

  const _SectionHeader({
    required this.title,
    required this.tooltip,
    required this.showTooltip,
    required this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: AppText.h6b!.cl(AppTheme.c.text.shade100!)),
            Space.xf(6),
            GestureDetector(
              onTap: onInfoTap,
              child: SvgPicture.asset(
                'assets/svgs/rating_info.svg',
                width: 16.w,
                height: 16.h,
             
              ),
            ),
          ],
        ),

        // Tooltip box
        if (showTooltip) ...[
          Space.yf(8),
          Container(
            width: double.infinity,
            padding: Space.all(12),
            decoration: BoxDecoration(
              color: AppTheme.c.background.shade100,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppTheme.c.lightGrey.main!,
                width: 1.w,
              ),
            ),
            child: Text(
              tooltip,
              style: AppText.b2!.cl(AppTheme.c.text.main!),
            ),
          ),
        ],
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Rank Box
// ─────────────────────────────────────────────────────────────────────────────

class _RankBox extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _RankBox({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      padding: Space.all(12,16),
      decoration: BoxDecoration(
        color: AppTheme.c.background.shade100,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppText.h4bm!.cl(valueColor),
          ),
          Space.yf(12),
          Text(
            label,
            style: AppText.l1!.cl(AppTheme.c.text.main!),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Chart Card (placeholder for chart)
// ─────────────────────────────────────────────────────────────────────────────

class _ChartCard extends StatelessWidget {
  final String title;
  final String period;
  final ValueChanged<String> onPeriodTap;
  final String? topLabel;
  final TextStyle? topLabelStyle;

  const _ChartCard({
    required this.title,
    required this.period,
    required this.onPeriodTap,
    this.topLabel,
    this.topLabelStyle,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      width: double.infinity,
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.background.shade100,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.b1b!.cl(AppTheme.c.text.shade100!)),
                  if (topLabel != null) ...[
                    Space.yf(4),
                    Text(topLabel!, style: topLabelStyle ?? AppText.b2!.cl(AppTheme.c.text.main!)),
                  ],
                ],
              ),
              // Period dropdown
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: Space.all(10, 6),
                  decoration: BoxDecoration(
                    color: AppTheme.c.background.shade200,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        period,
                        style: AppText.l1!.cl(AppTheme.c.text.shade100!),
                      ),
                      Space.xf(4),
                      SvgPicture.asset(
                        'assets/svgs/arrow-down.svg',
                        width: 12.w,
                        height: 12.w,
                        colorFilter: ColorFilter.mode(
                          AppTheme.c.text.main!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Space.yf(16),

          // Chart placeholder
          SizedBox(
            height: 160.h,
            child: Center(
              child: Text(
                '[ Chart goes here ]',
                style: AppText.l1!.cl(AppTheme.c.text.main!),
              ),
            ),
          ),

          Space.yf(8),

          // Day labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map((d) => Text(d, style: AppText.l2!.cl(AppTheme.c.text.main!)))
                .toList(),
          ),
        ],
      ),
    );
  }
}