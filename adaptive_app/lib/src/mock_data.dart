import 'package:googleapis/youtube/v3.dart';

// Datos de prueba para cuando no hay API key disponible
class MockYouTubeData {
  static List<Playlist> getMockPlaylists() {
    return [
      Playlist(
        id: 'demo1',
        snippet: PlaylistSnippet(
          title: 'Flutter Basics',
          description: 'Learn the fundamentals of Flutter development',
          thumbnails: ThumbnailDetails(
            default_: Thumbnail(
              url: 'assets/flutter_logo.png', // Usaremos un icono local
            ),
          ),
        ),
      ),
      Playlist(
        id: 'demo2',
        snippet: PlaylistSnippet(
          title: 'Advanced Flutter',
          description: 'Master advanced Flutter concepts and techniques',
          thumbnails: ThumbnailDetails(
            default_: Thumbnail(
              url: 'assets/flutter_logo.png', // Usaremos un icono local
            ),
          ),
        ),
      ),
      Playlist(
        id: 'demo3',
        snippet: PlaylistSnippet(
          title: 'Flutter State Management',
          description: 'Learn different state management solutions',
          thumbnails: ThumbnailDetails(
            default_: Thumbnail(
              url: 'assets/flutter_logo.png', // Usaremos un icono local
            ),
          ),
        ),
      ),
    ];
  }

  static List<PlaylistItem> getMockPlaylistItems(String playlistId) {
    return [
      PlaylistItem(
        snippet: PlaylistItemSnippet(
          title: 'Introduction to Flutter - Oficial',
          videoOwnerChannelTitle: 'Flutter Team',
          resourceId: ResourceId(
            videoId: 'fq4N0hgOWzU', // Video real de Flutter en YouTube
          ),
          thumbnails: ThumbnailDetails(
            high: Thumbnail(
              url: 'assets/flutter_logo.png',
            ),
          ),
        ),
      ),
      PlaylistItem(
        snippet: PlaylistItemSnippet(
          title: 'Flutter Widget of the Week',
          videoOwnerChannelTitle: 'Flutter Team',
          resourceId: ResourceId(
            videoId: 'b_sQ9bMltGU', // Video real de Flutter Widget of the Week
          ),
          thumbnails: ThumbnailDetails(
            high: Thumbnail(
              url: 'assets/flutter_logo.png',
            ),
          ),
        ),
      ),
      PlaylistItem(
        snippet: PlaylistItemSnippet(
          title: 'Flutter Tutorial for Beginners',
          videoOwnerChannelTitle: 'Flutter Team',
          resourceId: ResourceId(
            videoId: 'VPvVD8t02U8', // Video tutorial popular de Flutter
          ),
          thumbnails: ThumbnailDetails(
            high: Thumbnail(
              url: 'assets/flutter_logo.png',
            ),
          ),
        ),
      ),
    ];
  }
}