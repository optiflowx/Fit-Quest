import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:fit_quest/core/extensions/iterable_extensions.dart';
import 'package:fit_quest/core/repository/authentication_repository.dart';
import 'package:flutter/material.dart';

import 'widget/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static final _authRepository = AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue, // Change to your preferred color
      ),
      body: ListView(
        children: <Widget>[
          SettingsItem(
            title: 'Account Settings',
            icon: Icons.account_circle,
            onTap: () {},
          ),
          SettingsItem(
            title: 'Notifications',
            icon: Icons.notifications,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItem(
            title: 'Privacy & Security',
            icon: Icons.lock,
            onTap: () {},
          ),
          SettingsItem(
            title: 'Language & Region',
            icon: Icons.language,
            onTap: () {},
          ),
          SettingsItem(
            title: 'Help & Support',
            icon: Icons.help,
            onTap: () {},
          ),
          SettingsItem(
            title: 'About',
            icon: Icons.info,
            onTap: () {},
          ),
          SettingsItem(
            title: 'Logout',
            icon: Icons.logout,
            isLogout: true,
            onTap: () async {
              try {
                await _authRepository.logOut().then((value) {
                  if (context.mounted) {
                    context.replace(AppRoutes.authSignIn);
                  }
                });
              } catch (e) {
                debugPrint(e.toString());
              }
            },
          ),
        ].spacer(const Divider(height: 0)),
      ),
    );
  }
}
