part of 'rewards.dart';

enum _RewardStatus { locked, claimable, claimed }

class _RewardItem {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;
  final int current;
  final int total;
  final _RewardStatus status;
  final bool isProOnly;
  final String? proLabel;

  const _RewardItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.current,
    required this.total,
    required this.status,
    this.isProOnly = false,
    this.proLabel,
  });

  double get progress => total == 0 ? 0 : (current / total).clamp(0.0, 1.0);
}

const List<_RewardItem> _kRewards = [
  _RewardItem(
    imagePath: 'assets/pngs/image 24.png',
    title: 'Mog Crate',
    subtitle: '1 Successful Referral Invite',
    description: 'You can rate 1 card with this reward',
    current: 0,
    total: 1,
    status: _RewardStatus.locked,
  ),
  _RewardItem(
    imagePath: 'assets/pngs/image 22.png',
    title: 'Mega Mog Crate',
    subtitle: '1 Free Advertisement Video',
    description: 'You can rate 2 card with this reward',
    current: 0,
    total: 1,
    status: _RewardStatus.claimable,
  ),
  _RewardItem(
    imagePath: 'assets/pngs/image 21.png',
    title: 'GIGA Mog Crate',
    subtitle: '5 Successful Referral Invites',
    description: 'You can rate 5 card with this reward',
    current: 5,
    total: 5,
    status: _RewardStatus.claimed,
    proLabel: 'Pro Users will get 3 loot boxes free',
  ),
  _RewardItem(
    imagePath: 'assets/pngs/image 19.png',
    title: 'GIGA Mog Crate',
    subtitle: '',
    description: 'You can rate 6 card with each reward',
    current: 5,
    total: 5,
    status: _RewardStatus.locked,
    isProOnly: true,
  
    proLabel: 'Pro Users will get 3 loot boxes free',
  ),
];