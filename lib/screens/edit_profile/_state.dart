part of 'edit_profile.dart';

class _ScreenState extends ChangeNotifier {
  final formKey = GlobalKey<FormBuilderState>();
  bool emailVerificationSent = false;
  String emailValue = '';

  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  void onEmailChanged(String? val) {
    emailValue = val ?? '';
    // reset sent state if email changes
    if (emailVerificationSent) {
      emailVerificationSent = false;
    }
    notifyListeners();
  }

  void sendVerificationLink() {
    if (emailValue.isNotEmpty) {
      emailVerificationSent = true;
      notifyListeners();
    }
  }

  void saveChanges() {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      // handle save
    }
  }
}