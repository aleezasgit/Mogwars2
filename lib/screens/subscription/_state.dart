part of 'subscription.dart';

class _ScreenState extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Handles the subscription purchase action
  Future<void> purchaseSubscription(BuildContext context) async {
    if (_isLoading) return;
    
    _isLoading = true;
    notifyListeners();

    // Simulate payment gateway delay using your SuperInt extension token rules
    await 2.seconds.delay;

    _isLoading = false;
    notifyListeners();
    
    // Fallback/Success handling can be wired here
  }
}