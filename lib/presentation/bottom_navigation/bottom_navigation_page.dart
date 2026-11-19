import 'package:flutter/material.dart';
import 'package:flutter_template/app/l10n/l10n.dart';
import 'package:flutter_template/app/navigation/router/app_routes.dart';
import 'package:flutter_template/presentation/shared/design_system/utils/animated_branch_container.dart';
import 'package:go_router/go_router.dart';

// Example: https://github.com/flutter/packages/blob/main/packages/go_router_builder/example/lib/stateful_shell_route_example.dart
class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('BottomNavigationPage'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  /// The children (branch Navigators) to display in the bottom navigation bar
  /// ([AnimatedBranchContainer]).
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          IconButton(
            onPressed: () {
              const SettingsRoute().push(context);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.article),
            label: context.l10n.bottomNavigationArticles,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.handyman),
            label: context.l10n.bottomNavigationBlank,
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
