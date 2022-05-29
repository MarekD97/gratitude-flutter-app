import 'package:app/components/entry_card_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Grateful day'),
                floating: true,
                pinned: true,
                snap: true,
                forceElevated: true,
                bottom: TabBar(
                  tabs: const [
                    Tab(
                      child: Text('Wdzięcznica'),
                    ),
                    Tab(
                      child: Text('Moje wpisy'),
                    ),
                  ],
                  onTap: (index) {
                    setState(() {
                      currentTabIndex = index;
                    });
                  },
                ),
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
                          title: const Text('Od najstarszych'),
                          activeColor: Theme.of(context).primaryColor,
                          value: 1,
                          onChanged: (value) {},
                          groupValue: 1,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                      PopupMenuItem(
                        child: RadioListTile(
                          title: const Text('Od najnowszych'),
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
              )
            ];
          },
          body: TabBarView(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [

                  EntryCardWidget(
                    onFavoritePressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const AlertDialog(title: Text("xyz")));
                    },
                  ),
                  const EntryCardWidget(),
                  const EntryCardWidget(),
                  const EntryCardWidget(),
                  const EntryCardWidget(),
                ],
              )),
              const Center(child: Text('Moje wpisy')),
            ],
          ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create',
                arguments: currentTabIndex == 0);
          },
          backgroundColor: const Color(0xFF377E51),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
