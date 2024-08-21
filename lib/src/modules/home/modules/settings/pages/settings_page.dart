import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_route/src/modules/home/controllers/bottom_bar_controller.dart';
import 'package:nested_route/src/modules/home/widgets/miolo.dart';

/// The Settings page of the application.
class SettingsPage extends StatelessWidget {
  /// Creates the Settings page.
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Miolo(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      child: Column(
        children: [
          ListenableBuilder(
            listenable: Modular.get<BottomBarController>(),
            builder: (context, snapshot) {
              return SwitchListTile(
                value: Modular.get<BottomBarController>().isBottomBarVisible,
                onChanged: (value) {
                  Modular.get<BottomBarController>().isBottomBarVisible = value;
                },
                title: const Text('Show Bottom Bar'),
                subtitle: const Text('Show or hide the bottom bar.'),
              );
            },
          ),
        ],
      ),
    );
  }
}
