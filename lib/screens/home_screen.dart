
import 'package:flutter/material.dart';

import 'package:designs/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const _HomeDrawer(),
      body: Stack(
        children: [
          BackgroundWidget(),

          const HomeBody()
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class _HomeDrawer extends StatelessWidget {
  const _HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 67, 107, 0.7),
            ),
            child: Text('Mis páginas'),
          ),
          ListTile(
            title: const Text('Animaciones'),
            onTap: () => Navigator.pushNamed(context, 'animations'),
          ),
          ExpansionTile(
            title: const Text('Cabeceras'),
            children: [
              ListTile(
                title: const Text('Cuadrado'),
                onTap: () => Navigator.pushNamed(context, 'headers', arguments: { 'type': 'square' }),
              ),
              ListTile(
                title: const Text('Redondeado'),
                onTap: () => Navigator.pushNamed(context, 'headers', arguments: { 'type': 'circle' }),
              ),
              ListTile(
                title: const Text('Curvado'),
                onTap: () => Navigator.pushNamed(context, 'headers', arguments: { 'type': 'curve' }),
              ),
              ListTile(
                title: const Text('Diagonal'),
                onTap: () => Navigator.pushNamed(context, 'headers', arguments: { 'type': 'diagonal' }),
              ),
              ListTile(
                title: const Text('Triangular'),
                onTap: () => Navigator.pushNamed(context, 'headers', arguments: { 'type': 'triangle' }),
              ),
              ListTile(
                title: const Text('Pico'),
                onTap: () => Navigator.pushNamed(context, 'headers', arguments: { 'type': 'beak' }),
              ),
              ListTile(
                title: const Text('Weaves'),
                onTap: () => Navigator.pushNamed(context, 'headers', arguments: { 'type': 'waves' }),
              ),
            ],
          ),
          ListTile(
            title: const Text('Diseño básico'),
            onTap: () => Navigator.pushNamed(context, 'basic_design'),
          ),
          ListTile(
            title: const Text('Circular Progress'),
            onTap: () => Navigator.pushNamed(context, 'circle_graphs'),
          ),
          ListTile(
            title: const Text('Slideshows'),
            onTap: () => Navigator.pushNamed(context, 'slideshows'),
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitleWidget(title: 'Classify transaction', subtitle: 'Classify this transaction into a particular category'),

          const CardTableWidget()
        ]
      ),
    );
  }
}