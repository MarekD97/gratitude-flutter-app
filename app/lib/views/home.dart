import 'package:app/components/entry_list_widget.dart';
import 'package:app/main.dart';
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
                title:
                    Text(AppLocalizations.of(context)!.getText("gratefulDay")),
                floating: true,
                pinned: true,
                snap: true,
                forceElevated: true,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                          AppLocalizations.of(context)!.getText("gratitude")),
                    ),
                    Tab(
                      child: Text(
                          AppLocalizations.of(context)!.getText('myEntries')),
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
              const EntryListWidget(),
              Center(
                  child:
                      Text(AppLocalizations.of(context)!.getText("myEntries"))),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  child:
                      Text(AppLocalizations.of(context)!.getText("appMenu"))),
              ListTile(
                title: Text(AppLocalizations.of(context)!.getText("aboutApp")),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.getText("settings")),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              ListTile(
                  title: Text(AppLocalizations.of(context)!.getText("login")),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text(AppLocalizations.of(context)!.getText("signup")),
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
