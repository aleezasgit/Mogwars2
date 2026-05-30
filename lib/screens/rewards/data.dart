part of 'rewards.dart';

enum _RewardStatus { locked, claimable, claimed }

class _RewardItem {
  final String imagePath;
  final String claimedImagePath; // ⬅️ NEW: Customizable path for the claimed state image
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
    required this.claimedImagePath, // ⬅️ NEW
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

  _RewardItem copyWith({
    String? imagePath,
    String? claimedImagePath, // ⬅️ NEW
    String? title,
    String? subtitle,
    String? description,
    int? current,
    int? total,
    _RewardStatus? status,
    bool? isProOnly,
    String? proLabel,
  }) {
    return _RewardItem(
      imagePath: imagePath ?? this.imagePath,
      claimedImagePath: claimedImagePath ?? this.claimedImagePath, // ⬅️ NEW
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      current: current ?? this.current,
      total: total ?? this.total,
      status: status ?? this.status,
      isProOnly: isProOnly ?? this.isProOnly,
      proLabel: proLabel ?? this.proLabel,
    );
  }
}

/// Dynamic storage layer updated with specific custom post-claimed images for each item
List<_RewardItem> _kRewards = [
  const _RewardItem(
    imagePath: 'assets/pngs/image 24.png',
    claimedImagePath: 'assets/pngs/Property 1=Regular Frost Box _ Open.png', // Remains unchanged or specific to your needs
    title: 'Mog Crate',
    subtitle: '1 Successful Referral Invite',
    description: 'You can rate 1 card with this reward',
    current: 0,
    total: 1,
    status: _RewardStatus.locked,
  ),
  const _RewardItem(
    imagePath: 'assets/pngs/image 22.png',
    claimedImagePath: 'assets/pngs/Neon Core Box Open.png', // ⬅️ Custom claimed asset destination target
    title: 'Mega Mog Crate',
    subtitle: '1 Free Advertisement Video',
    description: 'You can rate 2 card with this reward',
    current: 0,
    total: 1,
    status: _RewardStatus.claimable,
  ),
  const _RewardItem(
    imagePath: 'assets/pngs/image 19.png',
    claimedImagePath: 'assets/pngs/image 21.png',
    title: 'GIGA Mog Crate',
    subtitle: '5 Successful Referral Invites',
    description: 'You can rate 5 card with this reward',
    current: 5,
    total: 5,
    status: _RewardStatus.claimable,
    proLabel: 'Pro Users will get 3 loot boxes free',
  ),
  const _RewardItem(
    imagePath: 'assets/pngs/image 19.png',
    claimedImagePath: 'assets/pngs/image 21.png', // Custom token path configuration layout
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