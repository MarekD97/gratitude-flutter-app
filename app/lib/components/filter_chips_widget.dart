import 'package:flutter/material.dart';

class FilterChipsWidget extends StatefulWidget {
  final List<String> filters;
  final Function(int)? onFilterChanged;
  const FilterChipsWidget(
      {Key? key, required this.filters, this.onFilterChanged})
      : super(key: key);

  @override
  _FilterChipsWidgetState createState() => _FilterChipsWidgetState();
}

class _FilterChipsWidgetState extends State<FilterChipsWidget> {
  int _selectedIndex = 0;
  List<Widget> chipsBuilder() => widget.filters.map((filter) {
        int index = widget.filters.indexOf(filter);
        return Container(
            margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: ChoiceChip(
              label: Text(filter),
              selected: _selectedIndex == index,
              onSelected: (selected) {
                setState(() {
                  _selectedIndex = index;
                  if (widget.onFilterChanged != null) {
                    widget.onFilterChanged!(index);
                  }
                });
              },
            ));
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: chipsBuilder(),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
