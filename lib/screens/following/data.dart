part of 'following.dart';

class Following {
  final String name;
  final String username;
  final String imagePath;

  final bool hasUnseenBadge;

  const Following({
    required this.name,
    required this.username,
    required this.imagePath,

    this.hasUnseenBadge = false,
  });
}

const List<Following> kFollowings = [
  Following(name: 'Calire Alloy',  username: '@jsmith456',  imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: false),
  Following(name: 'Charlie Clark', username: '@miket',     imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: true),
  Following(name: 'Lire Offion',   username: '@sarahj',     imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: false),
  Following(name: 'Kai Bennet',    username: '@kaib',        imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: false),
  Following(name: 'Maya Lin',      username: '@mayalin',     imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: true),
  Following(name: 'Jasper Cole',   username: '@jasperc',     imagePath: 'assets/pngs/Type=Default, Component=Avatar.png', hasUnseenBadge: false),];
