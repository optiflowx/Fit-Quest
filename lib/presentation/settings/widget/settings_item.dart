import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
    this.isLogout = false,
  });

  final String title;
  final IconData icon;
  final bool isLogout;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.blue),
      trailing: trailing,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: isLogout ? Colors.red : Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}
