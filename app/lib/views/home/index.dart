import 'package:app/components/filter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Grateful day'),
          bottom: const TabBar(tabs: [
            Tab(
              child: Text('Wdzięcznica'),
            ),
            Tab(
              child: Text('Moje wpisy'),
            ),
          ]),
          actions: <Widget>[
            PopupMenuButton<String>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: ListTile(
                    title: Text("Sortuj:"),
                  ),
                  enabled: false,
                ),
                PopupMenuItem(
                  child: RadioListTile(
                    title: Text('Od najstarszych'),
                    activeColor: Theme.of(context).primaryColor,
                    value: 1,
                    onChanged: (value) {},
                    groupValue: 1,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                PopupMenuItem(
                  child: RadioListTile(
                    title: Text('Od najnowszych'),
                    activeColor: Theme.of(context).primaryColor,
                    value: 1,
                    onChanged: (value) {},
                    groupValue: 2,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            FilterComponent(),
            Center(child: Text('Moje wpisy')),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(child: Text("Menu aplikacji")),
              ListTile(
                title: const Text('O aplikacji'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Ustawienia'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              ListTile(
                  title: const Text('Zaloguj się'),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: const Text('Zarejestruj się'),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
