part of '../security_settings.dart';
class _Body extends StatelessWidget {
  const _Body();

  Widget _icon(String path) {
    return Padding(
      padding: Space.only(left: 16, right: 8),
      child: SvgPicture.asset(
        path,
        width: 16.w,
        height: 16.h,
       
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = _ScreenState.s(context, true);

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      appBar: CustomAppBar(title: 'Security Settings',type: AppBarType.withTextCenter),
      body: Stack(
        children: [
          // ── Form fields ──────────────────────────────────────────
          Padding(
            padding: Space.hf(16),
            child: FormBuilder(
              key: state.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.yf(16),

                  AppTextField(
                    name: 'old_password',
                    isPass: true,
                    type: TextFieldType.withIcon,
                    hint: 'Old Password',
                    textInputAction: TextInputAction.next,
                    prefixIcon: _icon('assets/svgs/pw.svg'),
                  ),

                  Space.yf(8),

                  AppTextField(
                    name: 'new_password',
                    isPass: true,
                    type: TextFieldType.withIcon,
                    hint: 'New Password',
                    textInputAction: TextInputAction.next,
                    prefixIcon: _icon('assets/svgs/lock.svg'),
                  ),

                  Space.yf(8),

                  AppTextField(
                    name: 'confirm_password',
                    isPass: true,
                    type: TextFieldType.withIcon,
                    hint: 'Confirm New Password',
                    textInputAction: TextInputAction.done,
                    prefixIcon: _icon('assets/svgs/lock.svg'),
                  ),
                ],
              ),
            ),
          ),

          // ── Save Changes pinned at bottom ────────────────────────
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 32.h,
            child: AppButton(
              label: 'Save Changes',
              onPressed: (){},
              backgroundColor: AppTheme.c.primary.main,
            ),
          ),
        ],
      ),
    );
  }
}