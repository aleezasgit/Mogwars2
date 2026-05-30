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
        type: AppBarType.withTextCenter,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: Space.all(16),
        child: ListView.separated(
          itemCount: _kRewards.length,
          separatorBuilder: (_, __) => Space.yf(16),
          itemBuilder: (context, index) {
            return RewardCard(
              reward: _kRewards[index],
              onClaim: () => state.claimReward(index, context),
            );
          },
        ),
      ),
    );
  }
}

