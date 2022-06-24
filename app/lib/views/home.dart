import 'package:app/components/entry_card_widget.dart';
import 'package:app/main.dart';
import 'package:app/models/entry_model.dart';
import 'package:app/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentTabIndex = 0;

  late Future<List<Entry>> futureEntries;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureEntries = fetchLocalEntries();
  }

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
              FutureBuilder(
                  future: futureEntries,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Entry> entries = (snapshot.data! as List<Entry>);
                      List<Widget> widgets = <Widget>[];
                      entries
                          .map((entry) => {
                                widgets.add(EntryCardWidget(
                                  text: entry.content,
                                  onFavoritePressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            const AlertDialog(
                                                title: Text("xyz")));
                                  },
                                ))
                              })
                          .toList();
                      widgets.add(const SizedBox(height: 80.0,));
                      return SingleChildScrollView(
                          child: Column(children: widgets));
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
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
