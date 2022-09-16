import 'package:app/components/entry_list_widget.dart';
import 'package:app/components/main_drawer_widget.dart';
import 'package:app/localization/app_language.dart';
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
          physics: const NeverScrollableScrollPhysics(),
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
                  // PopupMenuButton<String>(
                  //   itemBuilder: (context) => [
                  //     const PopupMenuItem(
                  //       child: ListTile(
                  //         title: Text("Sortuj:"),
                  //       ),
                  //       enabled: false,
                  //     ),
                  //     PopupMenuItem(
                  //       child: RadioListTile(
                  //         title: const Text('Od najstarszych'),
                  //         activeColor: Theme.of(context).primaryColor,
                  //         value: 1,
                  //         onChanged: (value) {},
                  //         groupValue: 1,
                  //         controlAffinity: ListTileControlAffinity.trailing,
                  //       ),
                  //     ),
                  //     PopupMenuItem(
                  //       child: RadioListTile(
                  //         title: const Text('Od najnowszych'),
                  //         activeColor: Theme.of(context).primaryColor,
                  //         value: 1,
                  //         onChanged: (value) {},
                  //         groupValue: 2,
                  //         controlAffinity: ListTileControlAffinity.trailing,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              )
            ];
          },
          body: Builder(builder: (context) {
            final innerScrollController = PrimaryScrollController.of(context)!;
            return TabBarView(
              children: [
                EntryListWidget(scrollController: innerScrollController),
                Center(
                    child: Text(
                        AppLocalizations.of(context)!.getText("myEntries"))),
              ],
            );
          }),
        ),
        drawer: const MainDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createEntry',
                arguments: currentTabIndex == 0);
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
