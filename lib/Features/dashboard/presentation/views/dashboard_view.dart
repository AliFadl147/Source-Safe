import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/dashboard_desktop_layout.dart';
import 'package:source_safe_project/core/widgets/adaptive_layout_widget.dart';

class DashBoradView extends StatefulWidget {
  const DashBoradView({super.key});

  @override
  State<DashBoradView> createState() => _DashBoradViewState();
}

class _DashBoradViewState extends State<DashBoradView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < 700
          ? AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFFFAFAFA),
              leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            )
          : null,
      backgroundColor: const Color(0xFFF7F9FA),
      drawer: MediaQuery.sizeOf(context).width < 700
          ? const SizedBox() //CustomDrawer()
          : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const SizedBox(), //DashBoardMobileLayout(),
        tabletLayout: (context) => const SizedBox(), //DashBoardTabletLayout(),
        desktopLayout: (context) => const DashboardDesktopLayout(),
      ),
    );
  }
}
