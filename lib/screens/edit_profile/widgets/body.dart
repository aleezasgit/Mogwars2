part of '../edit_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  Widget _icon(String path) {
    return Padding(
      padding: Space.only(left: 16, right: 8,),
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
      appBar: CustomAppBar(title: 'Edit Profile', type: AppBarType.withTextCenter),
      body: Column(
        children: [
          // ── Scrollable form ──────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: Space.only(left: 20, right: 20, bottom: 24),
              child: FormBuilder(
                key: state.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Space.yf(16),

                    // ── General Info heading ─────────────────────────
                    Text(
                      'General Info',
                      style: AppText.h5b!.cl(AppTheme.c.text.shade100!),
                    ),

                    Space.yf(16),

                    // ── Name ─────────────────────────────────────────
                    AppTextField(
                      name: 'name',
                      type: TextFieldType.withIcon,
                      hint: 'Name',
                      textInputAction: TextInputAction.next,
                      prefixIcon: _icon('assets/svgs/small_user.svg'),
                    ),

                    Space.yf(8),

                    // ── Username ──────────────────────────────────────
                    AppTextField(
                      name: 'username',
                      type: TextFieldType.withIcon,
                      hint: 'Username',
                      textInputAction: TextInputAction.next,
                      prefixIcon: _icon('assets/svgs/small_user.svg'),
                    ),

                    Space.yf(8),

                    // ── Date of Birth ─────────────────────────────────
                    AppTextField(
                      name: 'dob',
                      type: TextFieldType.withIcon,
                      hint: 'Date of Birth',
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (context, child) => Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.dark(
                                primary: AppTheme.c.primary.main!,
                                surface: AppTheme.c.background.shade100!,
                              ),
                            ),
                            child: child!,
                          ),
                        );
                        if (picked != null) {
                          state.formKey.currentState?.fields['dob']
                              ?.didChange('${picked.day}/${picked.month}/${picked.year}');
                        }
                      },
                      suffixIcon: Padding(
                        padding: Space.only(right: 16),
                        child: SvgPicture.asset(
                          'assets/svgs/Calendar.svg',
                          width: 16.w,
                          height: 16.h,
                        ),
                      ),
                    ),

                    Space.yf(8),

                    // ── Email Address ─────────────────────────────────
                    AppTextField(
                      name: 'email',
                      type: TextFieldType.withIcon,
                      hint: 'Email Address',
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      prefixIcon: _icon('assets/svgs/Letter.svg'),
                      onChanged: state.onEmailChanged,
                    ),

                    Space.yf(8),

                    // ── Send link to verify / Sent ────────────────────
                    Align(
                      alignment: Alignment.centerRight,
                      child: state.emailVerificationSent
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/tickk.svg',
                                  width: 20.w,
                                  height: 20.h,
                                ),
                                Space.xf(4),
                                // ── Gradient Mask Wrapper ────────────────────
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bounds) {
                                    return UIProps.diamondGreen!.createShader(bounds);
                                  },
                                  child: Text(
                                    'Sent',
                                    style: AppText.b1!.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : GestureDetector(
                              onTap: state.sendVerificationLink,
                              child: Text(
                                'Send link to verify',
                                style: AppText.b1!.copyWith(
                                  shadows: [
                                    Shadow(
                                      color: AppTheme.c.primary.main!,
                                      offset: Offset(0, -2.h),
                                    ),
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppTheme.c.primary.main!,
                                  decorationThickness: 1.5,
                                ),
                              ),
                            ),
                    ),

                    Space.yf(16),

                    // ── Bio (multiline) ───────────────────────────────
                    AppContainerTextField(
                      name: 'bio',
                      hint: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                      type: ContainerTextFieldType.multiline,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Save Changes pinned at bottom (Natively separated below list view) ──
          Padding(
            padding: Space.only(left: 20, right: 20, bottom: 16),
            child: AppButton(
              label: 'Save Changes',
              onPressed: state.saveChanges,
              backgroundColor: AppTheme.c.primary.main,
            ),
          ),
        ],
      ),
    );
  }
}