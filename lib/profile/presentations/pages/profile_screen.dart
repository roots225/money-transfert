import 'package:app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/app_theme.dart';
import '../../../common/utils/loading_effect.dart';
import '../../../common/utils/navigation_helper.dart';
import '../../../features/authentication/presentations/pages/register_page.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (_, profileProvider, __) {
      if (profileProvider.loadingState == ProfileProviderLoadingState.loading) {
        return Scaffold(
          body: Container(
              margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
              child: LoadingEffect.getSearchLoadingScreen(
                context,
              )),
        );
      } else {
        return Scaffold(
          body: ListView(
            padding: FxSpacing.fromLTRB(24, 48, 24, 24),
            children: [
              FxContainer(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    FxSpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyLarge(profileProvider.user?.fullname ?? '',
                              fontWeight: 700),
                          FxSpacing.width(8),
                          FxText.bodyMedium(
                            profileProvider.user?.email ?? '',
                          ),
                          FxSpacing.height(8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FxSpacing.height(16),
              FxContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.titleMedium(
                    "Mon compte",
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  ListTile(
                    dense: true,
                    contentPadding: FxSpacing.zero,
                    visualDensity: VisualDensity.compact,
                    title: FxText.bodyMedium(
                      "Informations Personelles",
                      letterSpacing: 0,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  // ListTile(
                  //   dense: true,
                  //   contentPadding: FxSpacing.zero,
                  //   visualDensity: VisualDensity.compact,
                  //   title: FxText.bodyMedium(
                  //     "Favorite Items",
                  //     letterSpacing: 0,
                  //   ),
                  //   trailing: Icon(
                  //     Icons.chevron_right,
                  //     size: 20,
                  //     color: theme.colorScheme.onBackground,
                  //   ),
                  // ),
                  FxSpacing.height(24),
                  Center(
                      child: FxButton.rounded(
                    onPressed: () async {
                      await profileProvider.logout();
                      if (profileProvider.loadingState ==
                          ProfileProviderLoadingState.logout) {
                        pushAndRemoveAll(context, const RegisterPage());
                      }
                    },
                    splashColor: customTheme.homemadePrimary.withAlpha(60),
                    elevation: 0,
                    backgroundColor: customTheme.homemadeOnPrimary,
                    child: FxText.labelMedium(
                      "Déconnexion",
                      color: AppColors.black,
                      letterSpacing: 0.5,
                    ),
                  ))
                ],
              )),
              FxSpacing.height(16),
              const Divider(thickness: 0.8),
              FxSpacing.height(8),
              FxText.bodySmall(
                "© 2023",
                muted: true,
                textAlign: TextAlign.center,
                letterSpacing: 0,
              )
            ],
          ),
        );
      }
    });
  }
}
