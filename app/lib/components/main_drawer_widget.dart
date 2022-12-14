import 'package:app/localization/app_language.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, this.authenticated = false}) : super(key: key);

  final bool authenticated;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: DrawerHeader(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        AppLocalizations.of(context)!.getText("notLoggedUser"),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.black.withOpacity(0.54),
                      ),
                      const SizedBox(
                        width: 32.0,
                      ),
                      Text(AppLocalizations.of(context)!.getText("settings")),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.black.withOpacity(0.54),
                      ),
                      const SizedBox(width: 32.0),
                      Text(AppLocalizations.of(context)!.getText("aboutApp")),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about');
                  },
                ),
                const Spacer(),
                if (authenticated)
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: ElevatedButton(
                        child: Text(
                            AppLocalizations.of(context)!.getText("logout")),
                        onPressed: () {
                          // Navigator.pushNamed(context, '/login');
                        },
                      ))
                else
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: ElevatedButton(
                        child: Text(
                            AppLocalizations.of(context)!.getText("login")),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/login');
                        },
                      )),
                if (!authenticated)
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: ElevatedButton(
                        child: Text(
                            AppLocalizations.of(context)!.getText("signup")),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/signup');
                        },
                      )),
                const SizedBox(
                  height: 16.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
