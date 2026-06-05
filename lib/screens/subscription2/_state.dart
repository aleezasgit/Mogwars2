part of 'subscription2.dart';

class _ScreenState extends ChangeNotifier {
  bool isSubscribed = false;

  void subscribe() {
    isSubscribed = true;
    notifyListeners();
  }



  void manageSubscriptionWithContext(BuildContext context) {
    AppRoutes.manageSubscription.push(context);
  }
}