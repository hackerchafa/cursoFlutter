import 'package:flutter/material.dart';
import '../..//presentation/widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: ProfileCard(
          imagePath: 'https://tse2.mm.bing.net/th/id/OIP.fupWmRKnbTLNsuvO-huGwwHaFL?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3',
          name: 'Jane Doe',
          handle: '@janedoe',
        ),
      ),
    );
  }
}
