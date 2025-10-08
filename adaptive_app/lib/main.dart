import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'src/adaptive_playlists.dart';
import 'src/app_state.dart';
import 'src/playlist_details.dart';

const flutterDevAccountId = 'UCwXdFgeE9KYzlDdR7TG9cMw';
// TODO: Reemplaza con tu clave real de YouTube API
const youTubeApiKey = 'AIzaNotAnApiKey';

final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const AdaptivePlaylists();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'playlist/:id',
          builder: (context, state) {
            final title = state.uri.queryParameters['title']!;
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text(title)),
              body: PlaylistDetails(playlistId: id, playlistName: title),
            );
          },
        ),
      ],
    ),
  ],
);

void main() {
  if (youTubeApiKey == 'AIzaNotAnApiKey') {
    print('youTubeApiKey has not been configured. Running in demo mode.');
    // No usar exit() - en su lugar ejecutar en modo demo
  }

  runApp(
    ChangeNotifierProvider<FlutterDevPlaylists>(
      create: (context) => FlutterDevPlaylists(
        flutterDevAccountId: flutterDevAccountId,
        youTubeApiKey: youTubeApiKey,
      ),
      child: const PlaylistsApp(),
    ),
  );
}

class PlaylistsApp extends StatelessWidget {
  const PlaylistsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FlutterDev Playlists',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
