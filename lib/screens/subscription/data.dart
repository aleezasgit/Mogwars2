part of 'subscription.dart';

class _FeatureItem {
  final String iconSvg;
  final String title;
  final String subtitle;
  final bool isAvailableInFree;

  const _FeatureItem({
    required this.iconSvg,
    required this.title,
    required this.subtitle,
    this.isAvailableInFree = false,
  });
}

/// Profile preview items displayed in the top horizontal slider
const List<String> _kProfilePreviews = [
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
  'assets/images/user4.png',
];

/// Exact listing of subscription features from your design mockup
const List<_FeatureItem> _kPremiumFeatures = [
  _FeatureItem(
    iconSvg: 'assets/svgs/rating_analytics.svg',
    title: 'Male & Female Rating Analytics',
    subtitle: 'Experience full potential of mogwar',
  ),
  _FeatureItem(
    iconSvg: 'assets/svgs/unlimited_ratings.svg',
    title: 'Unlimited Ratings',
    subtitle: 'Rate without daily limits anytime.',
  ),
  _FeatureItem(
    iconSvg: 'assets/svgs/advanced_analytics.svg',
    title: 'Advanced Rating Analytics',
    subtitle: 'Compare male and female rating insights.',
  ),
  _FeatureItem(
    iconSvg: 'assets/svgs/faster_feed.svg',
    title: 'Faster Feed Access',
    subtitle: 'Get quicker access to rating feeds.',
  ),
  _FeatureItem(
    iconSvg: 'assets/svgs/premium_badge.svg',
    title: 'Premium Profile Badge',
    subtitle: 'Stand out across profiles & leaderboards.',
  ),
  _FeatureItem(
    iconSvg: 'assets/svgs/queue_boost.svg',
    title: 'Queue Boost Visibility',
    subtitle: 'Appear more often in global feeds.',
  ),
  _FeatureItem(
    iconSvg: 'assets/svgs/ad_free.svg',
    title: 'Ad-Free Experience',
    subtitle: 'Enjoy MogWars without interruptions.',
  ),
  _FeatureItem(
    iconSvg: 'assets/svgs/loot_box.svg',
    title: 'Weekly Loot Box Rewards',
    subtitle: 'Claim 3 free loot boxes every week.',
  ),
  _FeatureItem(
    iconSvg: 'assets/svgs/premium_styling.svg',
    title: 'Exclusive Premium Styling',
    subtitle: 'Unlock premium cosmetics and effects.',
  ),
];