import 'package:flutter/material.dart';
import 'profile_styles.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String handle;

  const ProfileInfo({super.key, required this.name, required this.handle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: ProfileStyles.nameStyle),
        const SizedBox(height: 4),
        Text(handle, style: ProfileStyles.handleStyle),
      ],
    );
  }
}
