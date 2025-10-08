import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Helper para obtener valores responsivos
class ResponsiveHelper {
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }
  
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }
  
  static double getExpandedHeight(BuildContext context) {
    if (isDesktop(context)) return 300;
    if (isTablet(context)) return 280;
    return 250; // Mobile
  }
  
  static EdgeInsets getPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.symmetric(horizontal: 80, vertical: 16);
    if (isTablet(context)) return const EdgeInsets.symmetric(horizontal: 40, vertical: 16);
    return const EdgeInsets.all(16); // Mobile
  }
  
  static EdgeInsets getContentPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.symmetric(horizontal: 80);
    if (isTablet(context)) return const EdgeInsets.symmetric(horizontal: 40);
    return const EdgeInsets.symmetric(horizontal: 16); // Mobile
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Floating App Bar Example';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text(title),
              pinned: true,
              floating: true,
              snap: true,
              stretch: true,
              expandedHeight: ResponsiveHelper.getExpandedHeight(context),
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                background: Image.network(
                  'https://picsum.photos/800/400?random=1',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.blue.shade300,
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 100,
                        color: Colors.white70,
                      ),
                    );
                  },
                ),
                collapseMode: CollapseMode.parallax,
              ),
            ),
            // Header de sección con padding responsivo
            SliverPadding(
              padding: ResponsiveHelper.getPadding(context),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.list_alt, color: Colors.blue.shade600),
                      const SizedBox(width: 12),
                      Text(
                        'Lista de Elementos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Primera sección de items - responsive
            SliverPadding(
              padding: ResponsiveHelper.getContentPadding(context),
              sliver: ResponsiveHelper.isDesktop(context) 
                ? SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Card(
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue.shade100,
                            child: Icon(
                              Icons.star,
                              color: Colors.blue.shade600,
                            ),
                          ),
                          title: Text('Elemento Destacado #${index + 1}'),
                          subtitle: Text('Descripción del elemento ${index + 1}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      childCount: 5,
                    ),
                  )
                : SliverList.builder(
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            Icons.star,
                            color: Colors.blue.shade600,
                          ),
                        ),
                        title: Text('Elemento Destacado #${index + 1}'),
                        subtitle: Text('Descripción del elemento ${index + 1}'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    itemCount: 5,
                  ),
            ),
            // Divisor con texto - responsive
            SliverPadding(
              padding: ResponsiveHelper.getPadding(context),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Más Elementos',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
              ),
            ),
            // Segunda sección con items normales - responsive
            SliverPadding(
              padding: ResponsiveHelper.getContentPadding(context),
              sliver: ResponsiveHelper.isTablet(context)
                ? SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: ResponsiveHelper.isDesktop(context) ? 3 : 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3.5,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Card(
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.folder_outlined,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          title: Text('Item #${index + 6}'),
                          subtitle: Text('Elemento regular ${index + 6}'),
                          onTap: () {
                            // Acción al tocar el item
                          },
                        ),
                      ),
                      childCount: 45,
                    ),
                  )
                : SliverList.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.folder_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  title: Text('Item #${index + 6}'),
                  subtitle: Text('Elemento regular ${index + 6}'),
                  onTap: () {
                    // Acción al tocar el item
                  },
                ),
                itemCount: 45,
              ),
            ),
            // Footer con padding responsivo
            SliverPadding(
              padding: ResponsiveHelper.getPadding(context),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 48,
                        color: Colors.green.shade400,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Has llegado al final',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        'Total: 50 elementos',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
