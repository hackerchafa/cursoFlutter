import 'package:flutter/material.dart';
import 'profile_styles.dart';
import 'profile_avatar.dart';
import 'profile_info.dart';
import 'profile_stats.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String handle;

  const ProfileCard({super.key, required this.imagePath, required this.name, required this.handle});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = width * 0.78; // slightly narrower to mimic design
    final constrainedWidth = cardWidth > ProfileStyles.cardMaxWidth ? ProfileStyles.cardMaxWidth : cardWidth;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: constrainedWidth),
        child: Container(
          width: constrainedWidth,
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
          decoration: BoxDecoration(
            gradient: ProfileStyles.cardGradient,
            borderRadius: ProfileStyles.cardBorderRadius,
            boxShadow: ProfileStyles.cardShadow,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar with badge (lifted up a bit)
              Transform.translate(
                offset: const Offset(0, -28),
                child: ProfileAvatar(imagePath: imagePath, verified: true),
              ),
              const SizedBox(height: 8),
              // Name and handle
              ProfileInfo(name: name, handle: handle),
              const SizedBox(height: 24),
              // Stats
              const ProfileStats(posts: 536, followers: 5790, following: 10),
            ],
          ),
        ),
      ),
    );
  }
}
