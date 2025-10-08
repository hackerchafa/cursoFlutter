import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const title = 'Fade in with asset placeholder';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: Center(
          child: FadeInImage.assetNetwork(
            // NOTA: Para usar este ejemplo, descomenta la línea assets en pubspec.yaml
            // y agrega un archivo loading.gif en la carpeta assets/
            placeholder: 'assets/loading.gif',
            image: 'https://picsum.photos/250?image=9',
            fadeInDuration: const Duration(milliseconds: 700),
            fadeOutDuration: const Duration(milliseconds: 300),
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return Container(
                width: 250,
                height: 250,
                color: Colors.grey[300],
                child: const Center(
                  child: Text(
                    'Error cargando imagen',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}