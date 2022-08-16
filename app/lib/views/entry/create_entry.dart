import 'package:app/localization/app_language.dart';
import 'package:flutter/material.dart';

class CreateEntryView extends StatefulWidget {
  const CreateEntryView({Key? key}) : super(key: key);

  @override
  State<CreateEntryView> createState() => _CreateEntryViewState();
}

class _CreateEntryViewState extends State<CreateEntryView> {
  bool? published;

  void handlePublishChange([bool? value]) {
    setState(() {
      if (value == null) {
        published = false;
      } else {
        published = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    published ??= ModalRoute.of(context)!.settings.arguments as bool;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(AppLocalizations.of(context)!.getText("createEntry")),
        ),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 20.0),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        hintText: AppLocalizations.of(context)!
                            .getText("todayIamGrateful"),
                        fillColor: Theme.of(context).primaryColor,
                      ),
                      minLines: 6,
                      maxLines: 12,
                      maxLength: 250,
                    ),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.12), blurRadius: 2),
                      BoxShadow(
                          color: Colors.black.withOpacity(0.24),
                          blurRadius: 2,
                          offset: const Offset(0, 2)),
                    ], color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: published,
                          onChanged: handlePublishChange,
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        Text(
                          AppLocalizations.of(context)!.getText("public"),
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          // TODO: implement create new entry feature
                        },
                        child: Text(
                            AppLocalizations.of(context)!.getText("save"))),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
