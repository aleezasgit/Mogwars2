import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';
import 'package:mogwars/statics/app_statics.dart';
import 'package:mogwars/widgets/core/bottomsheets/delete_bottomsheet.dart';
import 'package:mogwars/widgets/core/bottomsheets/invite_bottom_sheet.dart';
import 'package:mogwars/widgets/core/bottomsheets/logout_bottomsheet.dart';
import 'package:mogwars/widgets/design/buttons/app_button/app_button.dart';
import 'package:provider/provider.dart';


part 'widget/_body.dart';
part '_state.dart';
part 'data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}