import 'dart:developer';

import 'package:flutter/material.dart';

class CreateEntryView extends StatefulWidget {
  const CreateEntryView({Key? key}) : super(key: key);

  @override
  _CreateEntryViewState createState() => _CreateEntryViewState();
}

class _CreateEntryViewState extends State<CreateEntryView> {
  bool published = false;

  int charactersNum = 0;

  RichText charactersNumText() {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;
    if (charactersNum > 150) {
      textStyle = TextStyle(color: Colors.red[900]);
    }
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: charactersNum.toString(),
        style: textStyle,
      ),
      TextSpan(
        text: '/150',
        style: textStyle,
      )
    ]));
  }

  @override
  Widget build(BuildContext context) {
    published = ModalRoute.of(context)!.settings.arguments as bool;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 42.0),
                child: const Text(
                  "Dziś wdzięczny jestem za...",
                  style: TextStyle(
                      fontSize: 36.0,
                      color: Color(0xFF377E51),
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ]),
                child: TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty || value.length > 150) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  minLines: 6,
                  maxLines: 10,
                  onChanged: (event) {
                    int count = event.characters.length;
                    setState(() {
                      charactersNum = count;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  charactersNumText(),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    log(published ? "Opublikowany" : "Nieopublikowany");
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Zapisz",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Mali'),
                      ),
                    ),
                  ),
                ),
                margin: const EdgeInsets.symmetric(vertical: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
