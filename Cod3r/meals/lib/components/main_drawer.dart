import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

        // surfaceTintColor: Theme.of(context).colorScheme.primary,
        // backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(children: [
      Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Theme.of(context).colorScheme.primary,
        alignment: Alignment.bottomRight,
        child: Text(
          'Vamos Cozinhar?',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      _createItem(Icons.restaurant, 'Refeições', () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
      }),
      _createItem(Icons.settings, 'Configurações', () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS);
      }),
    ]));
  }
}
