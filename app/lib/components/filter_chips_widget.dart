import 'package:flutter/material.dart';

class FilterChipsWidget extends StatefulWidget {
  const FilterChipsWidget({Key? key}) : super(key: key);

  @override
  _FilterChipsWidgetState createState() => _FilterChipsWidgetState();
}

class _FilterChipsWidgetState extends State<FilterChipsWidget> {

  List<String> labels = ["Zatwierdzone", "Niezatwierdzone", "Wszystkie"];

  List<Widget> chipsBuilder({filters}) {
    List<Widget> chipsList = <Widget>[];

    labels.map((label) => {
          chipsList.add(
            Container(
                margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                child: Chip(label: Text(label))),
          )
        }).toList();

    return chipsList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: chipsBuilder()
    );
  }
}
