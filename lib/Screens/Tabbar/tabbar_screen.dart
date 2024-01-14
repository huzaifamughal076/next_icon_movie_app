import 'package:flutter/material.dart';
import 'package:nexticon_task/Screens/Dashboard/dashboard_screen.dart';
import 'package:nexticon_task/Screens/Favorite%20Screen/favorite_screen.dart';
import 'package:nexticon_task/Shared%20Preferences/shared_preferences.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with WidgetsBindingObserver {
    @override
  void initState() {
    super.initState();
    SharedPref.loadListFromPrefs();
    WidgetsBinding.instance.addObserver(this);
  }

    @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

    @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.inactive || state == AppLifecycleState.detached)return;


    final isBackground = state == AppLifecycleState.paused;

    if(isBackground){
      await SharedPref.saveListToPrefs();
    }

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        title: const Text('NextIcon Movies', style: TextStyle(color: Colors.white),),
        centerTitle: true, 
        bottom: const TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Favorites'),
            ],
          ),
      ), 
        body: const TabBarView(
          children: [
            DashboardScreen(), 
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}