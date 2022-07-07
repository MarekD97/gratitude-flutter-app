import 'package:app/components/entry_card_widget.dart';
import 'package:app/models/entry_model.dart';
import 'package:app/services/api_service.dart';
import 'package:flutter/material.dart';

class EntryListWidget extends StatefulWidget {
  const EntryListWidget({Key? key}) : super(key: key);

  @override
  _EntryListWidgetState createState() => _EntryListWidgetState();
}

class _EntryListWidgetState extends State<EntryListWidget> {
  List<Entry> data = [];
  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadEntries();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 100.0)) {
        loadEntries();
      }
    });
  }

  Future loadEntries() async {
    setState(() {
      isLoading = true;
    });

    // Load more entries
    await fetchLocalEntries().then((result) {
      data.addAll(List.generate(result.length, (index) => result[index]));
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: scrollController,
        child: ListView.builder(
            itemBuilder: (context, i) {
              if (i == data.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return EntryCardWidget(text: data[i].content);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemExtent: 200.0,
            itemCount: data.length + 1));
  }
}
