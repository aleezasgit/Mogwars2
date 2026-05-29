part of 'profile.dart';

class _ScreenState extends ChangeNotifier {
  String selectedPeriod = 'Weekly';
  final List<String> periods = ['Daily', 'Weekly', 'Monthly'];

  void selectPeriod(String period) {
    selectedPeriod = period;
    notifyListeners();
  }
}