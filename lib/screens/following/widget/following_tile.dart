part of '../following.dart';
class FollowingTile extends StatelessWidget {
  final Following follower;
  final VoidCallback onFollowBack;

  const FollowingTile({
    super.key,
    required this.follower,
    required this.onFollowBack,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Row(
      children: [
        // ── Avatar with optional unseen story badge ───────────
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: follower.hasUnseenBadge
                    ? Border.all(
                        color: AppTheme.c.accent.orange!,
                        width: 2.w,
                      )
                    : null,
              ),
              child: ClipRect(
                child: Image.asset(
                  follower.imagePath,
                 //fit: BoxFit.cover,
                ),
              ),
            ),

            // Unseen badge
            if (follower.hasUnseenBadge)
              Positioned(
                bottom: -5,
                left: 15,
                child: Container(
                  width: 26.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    color: AppTheme.c.accent.orange,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svgs/Simplification.svg",
                      width: 14.w,
                      height: 14.h,
                    ),
                  ),
                ),
              ),
          ],
        ),

        Space.xf(10),

        // ── Name + username ──────────────────────────────────────────
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                follower.name,
                style: AppText.b1bm!.cl(AppTheme.c.text.shade100!),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Space.yf(4),
              Text(
                follower.username,
                style: AppText.l1!.cl(AppTheme.c.text.main!),
              ),
            ],
          ),
        ),

        Space.xf(12),

        // ── Follow Back button ───────────────────────────────────────
        GestureDetector(
          onTap: onFollowBack,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 7.5.h,
            ),
            decoration: BoxDecoration(
              color: AppTheme.c.background.main,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
            ),
            child: Text(
              'Unfollow',
              style: AppText.l1bm!.cl(AppTheme.c.white!),
            ),
          ),
        ),
      ],
    );
  }
}