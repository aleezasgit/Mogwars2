part of '../following.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      appBar: CustomAppBar(
        title: 'Following',type: AppBarType.withTextCenter,
        onBackPressed: () => Navigator.pop(context),
  
      ),
      body: Padding(
        padding: Space.hf(16),
        child: Column(
          children: [
            Space.yf(6),

            // ── Search field ─────────────────────────────────────────
            SearchField(
              name: 'follower_search',
              hint: 'Search by name or username',
          
            ),

            Space.yf(24),

            // ── Follower list ────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                itemCount: state.following.length,
                separatorBuilder: (_, __) => Space.yf(16),
                itemBuilder: (context, index) {
                  final following = state.following[index];
                  return FollowingTile(
                    follower: following ,
                    onFollowBack: () {},
                  );
                },
              ),
            ),

            Space.yf(16),
          ],
        ),
      ),
    );
  }
}

