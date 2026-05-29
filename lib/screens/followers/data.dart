part of 'followers.dart';

class Follower {
  final String name;
  final String username;
  final String imagePath;

  final bool hasUnseenBadge;

  const Follower({
    required this.name,
    required this.username,
    required this.imagePath,

    this.hasUnseenBadge = false,
  });
}

const List<Follower>kFollowers = [
 Follower(name: 'Calire Alloy',  username: '@jsmith456',  imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: false),
 Follower(name: 'Charlie Clark', username: '@mike_t',     imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: true),
 Follower(name: 'Lire Offion',   username: '@sarahj',     imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: false),
 Follower(name: 'Kai Bennet',    username: '@kaib',        imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: false),
 Follower(name: 'Maya Lin',      username: '@mayalin',     imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: true),
 Follower(name: 'Jasper Cole',   username: '@jasperc',     imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: false),];
