import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'profile_styles.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final bool verified;

  const ProfileAvatar({super.key, required this.imagePath, this.verified = false});

  Future<bool> _assetExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // If the path is a remote URL, load via network with error handling
    if (imagePath.startsWith('http')) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          // White border container
          Container(
            width: ProfileStyles.avatarRadius * 2 + 8,
            height: ProfileStyles.avatarRadius * 2 + 8,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipOval(
                child: Image.network(
                  imagePath,
                  width: ProfileStyles.avatarRadius * 2,
                  height: ProfileStyles.avatarRadius * 2,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      width: ProfileStyles.avatarRadius * 2,
                      height: ProfileStyles.avatarRadius * 2,
                      color: Colors.grey.shade300,
                      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: ProfileStyles.avatarRadius * 2,
                      height: ProfileStyles.avatarRadius * 2,
                      color: Colors.grey.shade300,
                      child: Center(
                        child: Text(
                          'JD',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (verified)
            Positioned(
              right: 4,
              top: ProfileStyles.avatarRadius - 12,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF2EA3FF),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
        ],
      );
    }

    // Otherwise try loading from assets
    return FutureBuilder<bool>(
      future: _assetExists(imagePath),
      builder: (context, snapshot) {
        final hasImage = snapshot.data == true;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            // White border around avatar
            Container(
              width: ProfileStyles.avatarRadius * 2 + 8,
              height: ProfileStyles.avatarRadius * 2 + 8,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: hasImage
                    ? CircleAvatar(
                        radius: ProfileStyles.avatarRadius,
                        backgroundImage: AssetImage(imagePath),
                      )
                    : CircleAvatar(
                        radius: ProfileStyles.avatarRadius,
                        backgroundColor: Colors.grey.shade300,
                        child: Text(
                          'JD',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ),
            if (verified)
              Positioned(
                right: 4,
                top: ProfileStyles.avatarRadius - 12,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF2EA3FF),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
