# Fade In Images Example

Un proyecto Flutter que demuestra cómo implementar imágenes con efecto fade in usando diferentes tipos de placeholder.

## Características

Este proyecto incluye dos implementaciones diferentes:

1. **Placeholder transparente en memoria** (main.dart) - Usa la biblioteca `transparent_image`
2. **Placeholder con asset** (main_asset_example.dart) - Usa un archivo GIF local como placeholder

## Configuración

### Dependencias instaladas:
- `transparent_image: ^2.0.1` - Para placeholder transparente en memoria

### Assets configurados:
- `assets/loading.gif` - Para placeholder con asset (necesita ser agregado manualmente)

## Cómo usar

### Opción 1: Placeholder transparente (configuración actual)
El archivo `lib/main.dart` está configurado para usar un placeholder transparente:
- Muestra un CircularProgressIndicator mientras carga la imagen
- Usa `kTransparentImage` de la biblioteca `transparent_image`

### Opción 2: Placeholder con asset
Para usar el placeholder con asset:
1. Copia un archivo GIF de loading a `assets/loading.gif`
2. Cambia el nombre del archivo `main.dart` a `main_transparent.dart`
3. Renombra `main_asset_example.dart` a `main.dart`

## Ejecución

```bash
flutter pub get
flutter run
```

## Características del ejemplo

- **Duración de fade in**: 700ms
- **Duración de fade out**: 300ms
- **Imagen de prueba**: Imagen aleatoria de Picsum Photos
- **Fit**: BoxFit.cover para mantener las proporciones

## Personalización

Puedes personalizar:
- Las duraciones de las transiciones
- La URL de la imagen
- El tipo de fit (cover, contain, fill, etc.)
- El placeholder (transparente o asset personalizado)
