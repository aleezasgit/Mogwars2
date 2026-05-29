part of 'followers.dart';

class _ScreenState extends ChangeNotifier {
  String _query = '';

  List<Follower> get followers => _query.isEmpty
      ? kFollowers
      : kFollowers
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