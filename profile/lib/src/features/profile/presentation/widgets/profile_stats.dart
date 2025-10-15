import 'package:flutter/material.dart';
import 'profile_styles.dart';

class ProfileStats extends StatelessWidget {
  final int posts;
  final int followers;
  final int following;

  const ProfileStats({super.key, required this.posts, required this.followers, required this.following});

  Widget _statItem(IconData icon, String label, String number) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.white70, size: 22),
        const SizedBox(height: 8),
        Text(number, style: ProfileStyles.statNumberStyle),
        const SizedBox(height: 4),
        Text(label, style: ProfileStyles.statLabelStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _statItem(Icons.post_add, 'Publicaciones', posts.toString()),
        _statItem(Icons.group, 'Seguidores', followers.toString()),
        _statItem(Icons.person_add, 'Seguidos', following.toString()),
      ],
    );
  }
}
