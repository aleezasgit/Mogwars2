part of 'subscription2.dart';

class _Feature {
  final String iconPath;
  final String title;
  final String subtitle;
  final bool freeIncluded;
  final bool proIncluded;

  const _Feature({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.freeIncluded,
    required this.proIncluded,
  });
}

const List<String> _kPreviewImages = [
  'assets/pngs/1660b1166dcdd28e81a3e5c2b25a8b1dbca70c41.png',
  'assets/pngs/1660b1166dcdd28e81a3e5c2b25a8b1dbca70c41.png',
  'assets/pngs/1660b1166dcdd28e81a3e5c2b25a8b1dbca70c41.png',
  'assets/pngs/1660b1166dcdd28e81a3e5c2b25a8b1dbca70c41.png',
];

const List<_Feature> _kFeatures = [
  _Feature(
    iconPath: 'assets/svgs/Round Graph.svg',
    title: 'Male & Female Rating Analytics',
    subtitle: 'Experience full potential of mogwar',
    freeIncluded: false,
    proIncluded: true,
  ),
  _Feature(
    iconPath: 'assets/svgs/Star.svg',
    title: 'Unlimited Ratings',
    subtitle: 'Rate without daily limits anytime.',
    freeIncluded: false,
    proIncluded: true,
  ),
  _Feature(
    iconPath: 'assets/svgs/rating.svg',
    title: 'Advanced Rating Analytics',
    subtitle: 'Compare male and female rating insights.',
    freeIncluded: false,
    proIncluded: true,
  ),
  _Feature(
    iconPath: 'assets/svgs/Running.svg',
    title: 'Faster Feed Access',
    subtitle: 'Get quicker access to rating feeds.',
    freeIncluded: false,
    proIncluded: true,
  ),
  _Feature(
    iconPath: 'assets/svgs/pre,iumm.svg',
    title: 'Premium Profile Badge',
    subtitle: 'Stand out across profiles & leaderboards.',
    freeIncluded: false,
    proIncluded: true,
  ),
  _Feature(
    iconPath: 'assets/svgs/Cup First.svg',
    title: 'Queue Boost Visibility',
    subtitle: 'Appear more often in global feeds.',
    freeIncluded: false,
    proIncluded: true,
  ),
  _Feature(
    iconPath: 'assets/svgs/rating.svg',
    title: 'Ad-Free Experience',
    subtitle: 'Enjoy MogWars without interruptions.',
    freeIncluded: false,
    proIncluded: true,
  ),
  _Feature(
    iconPath: 'assets/svgs/rating.svg',
    title: 'Weekly Loot Box Rewards',
    subtitle: 'Claim 3 free loot boxes every week.',
    freeIncluded: false,
    proIncluded: false,
  ),
  _Feature(
    iconPath: 'assets/svgs/rating.svg',
    title: 'Exclusive Premium Styling',
    subtitle: '',
    freeIncluded: false,
    proIncluded: false,
  ),
];