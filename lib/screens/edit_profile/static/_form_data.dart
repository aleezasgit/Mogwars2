part of '../edit_profile.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.userName: '',
      _FormKeys.name: '',
      _FormKeys.bio: '',

      _FormKeys.email: '',
  
    };
  }
}