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
          title: 'What is Flutter? | Flutter',
          videoOwnerChannelTitle: 'Flutter',
          resourceId: ResourceId(
            videoId: 'I9ceqw5Ny-4', // Video oficial "What is Flutter"
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
          title: 'Flutter in 100 seconds',
          videoOwnerChannelTitle: 'Fireship',
          resourceId: ResourceId(
            videoId: 'lHhRhPV--G0', // Video muy popular de Fireship
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
          title: 'Flutter Course for Beginners – 37-hour Cross Platform App Development Tutorial',
          videoOwnerChannelTitle: 'freeCodeCamp.org',
          resourceId: ResourceId(
            videoId: 'VPvVD8t02U8', // Curso completo de freeCodeCamp
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