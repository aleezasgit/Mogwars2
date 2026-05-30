part of 'rewards.dart';

class _ScreenState extends ChangeNotifier {
  
  /// Handles reward validation, dialog launch, and updates state models safely
  void claimReward(int index, BuildContext context) {
    if (index < 0 || index >= _kRewards.length) return;
    if (_kRewards[index].status != _RewardStatus.claimable) return;

    final targetReward = _kRewards[index];

    // 1. Declaratively show your custom rich success dialog panel asset using pre-claim visual asset state
    ClaimSuccessDialog.show(
      context,
      imagePath: targetReward.claimedImagePath, // Dynamically swap to the claimed state image for visual consistency
      autoDismissDuration: const Duration(seconds: 3),
    );

    // 2. Perform a clean status property swap using your structural model design parameters
    _kRewards[index] = targetReward.copyWith(
      status: _RewardStatus.claimed,
      // No inline switches or hardcoded filters here anymore—reads natively from item data configuration target
    );

    notifyListeners();
  }
}