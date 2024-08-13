import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      activeTrackColor: Theme.of(context).colorScheme.primary,
      activeColor: Theme.of(context).colorScheme.onPrimary,
      inactiveTrackColor:
          Theme.of(context).colorScheme.primary.withOpacity(0.5),
      inactiveThumbColor: Theme.of(context).colorScheme.onSecondary,
      // contentPadding: const EdgeInsets.all(0),
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        children: <Widget>[
          _createSwitch(
            'Sem glúten',
            'Só exibe refeições sem glúten',
            settings.isGlutenFree,
            (bool value) {
              setState(() {
                settings.isGlutenFree = value;
              });
            },
          ),
          _createSwitch(
            'Sem lactose',
            'Só exibe refeições sem lactose',
            settings.isLactoseFree,
            (bool value) {
              setState(() {
                settings.isLactoseFree = value;
              });
            },
          ),
          _createSwitch(
            'Veganas',
            'Só exibe refeições veganas',
            settings.isVegan,
            (bool value) {
              setState(() {
                settings.isVegan = value;
              });
            },
          ),
          _createSwitch(
            'Vegetarianas',
            'Só exibe refeições vegetarianas',
            settings.isVegetarian,
            (bool value) {
              setState(() {
                settings.isVegetarian = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
