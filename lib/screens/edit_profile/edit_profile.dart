import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mogwars/configs/configs.dart';

import 'package:mogwars/widgets/core/app_bar/app_bar.dart';
import 'package:mogwars/widgets/design/buttons/app_button/app_button.dart';
import 'package:mogwars/widgets/design/textfields/app_textfield/app_textfield.dart';
import 'package:mogwars/widgets/design/textfields/container_textfield.dart/container_textfield.dart';
import 'package:provider/provider.dart';




part 'widgets/body.dart';
part '_state.dart';
part 'static/_form_data.dart';
part 'static/_form_keys.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
