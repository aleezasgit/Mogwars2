part of '../followers.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      appBar: CustomAppBar(
        title: 'Followers',type: AppBarType.withTextCenter,
        onBackPressed: () => Navigator.pop(context),
    
      ),
      body: Padding(
        padding: Space.hf(16),
        child: Column(
          children: [
            Space.yf(6),

            // ── Search field to be fixed ─────────────────────────────────────────
            SearchField(
              name: 'follower_search',
              hint: 'Search by name or username',
             
            ),

            Space.yf(24),

            // ── Follower list ────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                itemCount: state.followers.length,
                separatorBuilder: (_, __) => Space.yf(16),
                itemBuilder: (context, index) {
                  final follower = state.followers[index];
                  return FollowerTile(
                    follower: follower,
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

