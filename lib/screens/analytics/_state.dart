part of 'analytics.dart';

class _ScreenState extends ChangeNotifier {
  String rankingPeriod = 'Weekly';
  String maleRatingPeriod = 'Weekly';
  String femaleRatingPeriod = 'Weekly';

  bool showRankingTooltip = false;
  bool showRatingTooltip = false;

  void toggleRankingTooltip() {
    showRankingTooltip = !showRankingTooltip;
    if (showRankingTooltip) showRatingTooltip = false;
    notifyListeners();
  }

  void toggleRatingTooltip() {
    showRatingTooltip = !showRatingTooltip;
    if (showRatingTooltip) showRankingTooltip = false;
    notifyListeners();
  }

  void dismissTooltips() {
    showRankingTooltip = false;
    showRatingTooltip = false;
    notifyListeners();
  }

  void setRankingPeriod(String p) { rankingPeriod = p; notifyListeners(); }
  void setMaleRatingPeriod(String p) { maleRatingPeriod = p; notifyListeners(); }
  void setFemaleRatingPeriod(String p) { femaleRatingPeriod = p; notifyListeners(); }
}