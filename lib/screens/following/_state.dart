part of 'following.dart';

class _ScreenState extends ChangeNotifier {
  String _query = '';

  List<Following> get following => _query.isEmpty
      ? kFollowings
      : kFollowings
          .where(
            (f) =>
                f.name.toLowerCase().contains(_query.toLowerCase()) ||
                f.username.toLowerCase().contains(_query.toLowerCase()),
          )
          .toList();

  void onSearch(String? val) {
    _query = val ?? '';
    notifyListeners();
  }
}