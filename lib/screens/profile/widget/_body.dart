part of '../profile.dart';

class _Body extends StatelessWidget {
  const _Body();



  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
   
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Hero section (bg image + avatar + top actions) ───────────
            _HeroSection(),

            // ── Body content ─────────────────────────────────────────────
            Padding(
              padding: Space.hf(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.yf(12),

                  // ── Name + badge + rating ──────────────────────────────
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Alex Hedy',
                        style: AppText.h5b!.cl(AppTheme.c.text.shade100!),
                      ),
                      Space.xf(8),
                      // True Eve badge
                      Container(
                        padding: Space.all(8, 4),
                        decoration: BoxDecoration(
                          color: AppTheme.c.accent.orange ?? const Color(0xFF1E90FF),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/Simplification.svg",
                              width: 12.w,
                              height: 12.w,
                            ),
                            Space.xf(4),
                            Text(
                              'True Eve',
                              style: AppText.l2b!.cl(AppTheme.c.white!),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '9',
                              style: AppText.h5b!.cl(AppTheme.c.text.shade100!),
                            ),
                            TextSpan(
                              text: ' / 10 Rating',
                              style: AppText.l1!.cl(AppTheme.c.text.main!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Space.yf(4),

                  // ── Streak ────────────────────────────────────────────
                  Row(
                    children: [
                      Text(
                        'Streak : ',
                        style: AppText.l1!.cl(AppTheme.c.text.main!),
                      ),
                      SvgPicture.asset(
                        "assets/svgs/Simplification.svg",
                        width: 14.w,
                        height: 14.w,
                      ),
                      Space.xf(2),
                      Text('1', style: AppText.l1b!.cl(AppTheme.c.primary.main!)),
                    ],
                  ),

                  Space.yf(12),

                  // ── Bio ───────────────────────────────────────────────
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                    style: AppText.b2!.cl(AppTheme.c.text.main!),
                  ),

                  Space.yf(20),

                  // ── Stats row ─────────────────────────────────────────
                  _StatsRow(),

                  Space.yf(20),

                  // ── Ascension History card ────────────────────────────
                  Container(
                    width: double.infinity,
                    padding: Space.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.c.background.shade100,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: AppTheme.c.lightGrey.main!,
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ascension History',
                              style: AppText.b1b!.cl(AppTheme.c.text.shade100!),
                            ),
                            // Period dropdown
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: Space.all(10, 6),
                                decoration: BoxDecoration(
                                  color: AppTheme.c.background.shade200,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: AppTheme.c.lightGrey.main!,
                                    width: 1.w,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      state.selectedPeriod,
                                      style: AppText.l1!.cl(AppTheme.c.text.shade100!),
                                    ),
                                    Space.xf(4),
                                    SvgPicture.asset(
                                      "assets/svgs/Simplification.svg",
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

                        Space.yf(12),

                        // ── Chart placeholder ────────────────────────────
                        SizedBox(
                          height: 140.h,
                          child: Center(
                            child: Text(
                              '[ Chart goes here ]',
                              style: AppText.l1!.cl(AppTheme.c.text.main!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Space.yf(20),

                  // ── Menu grid ─────────────────────────────────────────
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 2.6,
                    children: _menuItems.map((item) {
                      return _MenuTile(
                        iconPath: item['icon']!,
                        label: item['label']!,
                        onTap: () {},
                      );
                    }).toList(),
                  ),

                  Space.yf(20),

                  // ── Delete Account ────────────────────────────────────
                  AppButton(
                    label: 'Delete Account',
                    onPressed: () {
                      DeleteBottomSheet.show(context);
                    },
                    buttonType: ButtonType.outlined,
                    iconPath: "assets/svgs/Simplification.svg",
                    iconColor: AppTheme.c.text.shade100,
                    borderColor: AppTheme.c.lightGrey.main,
                  ),

                  Space.yf(12),

                  // ── Logout ────────────────────────────────────────────
                  AppButton(
                    label: 'Logout',
                    onPressed: () {
                      LogoutBottomSheet.show(context);
                    },
                    backgroundColor: AppTheme.c.primary.main,
                    iconPath: "assets/svgs/Simplification.svg",
                    iconColor: AppTheme.c.white,
                    buttonType: ButtonType.primaryWithIconLeft,
                  ),

                  Space.yf(32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Hero Section
// ─────────────────────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return SizedBox(
      height: 220.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/pngs/Type=Default, Component=Avatar.png',
              fit: BoxFit.cover,
            ),
          ),

          // Dark gradient overlay at bottom
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppTheme.c.background.main!.withOpacity(0.85),
                    AppTheme.c.background.main!,
                  ],
                  stops: const [0.3, 0.8, 1.0],
                ),
              ),
            ),
          ),

          // Top row: Subscription + settings
          Positioned(
            top: 20.h,
           // left: 45.w,
           right: -10,
            child: Padding(
              padding: Space.hf(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  // Subscription badge
                  Container(
                    padding: Space.all(6, 2),
                    decoration: BoxDecoration(
                      color: AppTheme.c.accent.red,
                      borderRadius: BorderRadius.circular(8.r),
                     
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/Group 1242.svg",
                          width: 10.w,
                          height: 10.h,
                          
                        ),
                        Space.xf(5),
                        Text(
                          'Subscription',
                          style: AppText.b1b!.cl(AppTheme.c.white!),
                        ),
                      ],
                    ),
                  ),
                  Space.xf(8.67),
                  // Settings icon
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                    
                   
                    child: Center(
                        child: SvgPicture.asset(
                          "assets/svgs/Subtract.svg",
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Avatar + Pro badge (bottom-left of hero)
          Positioned(
            bottom: 12.h,
            left: 20.w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Story ring + avatar
                Container(
                  width: 76.w,
                  height: 76.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.c.primary.main!,
                      width: 2.5.w,
                    ),
                  ),
                  padding: EdgeInsets.all(2.5.w),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/pngs/1660b1166dcdd28e81a3e5c2b25a8b1dbca70c41.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Camera icon overlay (bottom right of avatar)
                Positioned(
                  bottom: 30,
                  right: 0,
                  top: 30,
                  left: 0,
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svgs/Group 1242.svg",
                      width: 24.w,
                      height: 24.h,
                      colorFilter: ColorFilter.mode(
                        AppTheme.c.white!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),

                // Pro badge (top left of avatar)
                Positioned(
                //  top: 0,
                  left: 10,
                  bottom:-5,
                right: 10,
                  child: Container(
                    padding: Space.all(6, 3),
                    decoration: BoxDecoration(
                      color: AppTheme.c.accent.red,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'Pro',
                      style: AppText.l2b!.cl(AppTheme.c.black!),
                    ),
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
// Stats Row
// ─────────────────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _StatItem(label: 'Global Rank', value: '#15'),
        _StatDivider(),
        _StatItem(label: 'Followers', value: '5,450'),
        _StatDivider(),
        _StatItem(label: 'Following', value: '4,890'),
        _StatDivider(),
        _StatItem(label: 'Local Rank', value: '#12'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppText.b1b!.cl(AppTheme.c.text.shade100!)),
        Space.yf(2),
        Text(label, style: AppText.l2!.cl(AppTheme.c.text.main!)),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.w,
      height: 28.h,
      color: AppTheme.c.lightGrey.main,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Menu Tile
// ─────────────────────────────────────────────────────────────────────────────

class _MenuTile extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const _MenuTile({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.all(14, 10),
        decoration: BoxDecoration(
          color: AppTheme.c.background.shade100,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: AppTheme.c.lightGrey.main!,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22.w,
              height: 22.w,
            ),
            Space.xf(10),
            Expanded(
              child: Text(
                label,
                style: AppText.b2b!.cl(AppTheme.c.text.shade100!),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Bottom Nav
// ─────────────────────────────────────────────────────────────────────────────

