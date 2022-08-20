import 'package:app/components/entry_card_widget.dart';
import 'package:app/components/filter_chips_widget.dart';
import 'package:app/models/entry_model.dart';
import 'package:app/services/api_service.dart';
import 'package:flutter/material.dart';

class EntryListWidget extends StatefulWidget {
  final ScrollController scrollController;
  const EntryListWidget({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _EntryListWidgetState createState() => _EntryListWidgetState();
}

class _EntryListWidgetState extends State<EntryListWidget> {
  List<Entry> data = [];
  bool isLoading = false;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    loadEntries();
    widget.scrollController.addListener(() {
      double positionInPixels = widget.scrollController.position.pixels;
      double maxScrollExtentWithOffset =
          widget.scrollController.position.maxScrollExtent - 200.0;

      if (!isLoading && positionInPixels >= maxScrollExtentWithOffset) {
        loadEntries();
      }
    });
  }

  Future loadEntries() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });

    // Load more entries
    await fetchEntries(currentPage + 1).then((result) {
      data.addAll(List.generate(result.length, (index) => result[index]));
      currentPage += 1;
    });

    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }

  Future reloadEntries() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });

    // Load entries
    await fetchEntries().then((result) {
      data.clear();
      data.addAll(List.generate(result.length, (index) => result[index]));
      currentPage = 1;
    });

    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Column(
        children: [
          FilterChipsWidget(
            filters: ["Zatwierdzone", "Niezatwierdzone", "Wszystkie"],
            onFilterChanged: (index) {
              print(index);
            },
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: widget.scrollController,
                itemBuilder: (context, i) {
                  if (i == data.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return EntryCardWidget(
                    text: data[i].content,
                    onReportPressed: (String value) {
                      print("Entry of ID: ${data[i].entryId} was reported");
                    },
                    onFavoritePressed: () {
                      print(
                          "Entry of ID: ${data[i].entryId} was added to Favourite");
                    },
                  );
                },
                itemExtent: 200.0,
                itemCount: data.length + 1),
          ),
        ],
      ),
      onRefresh: reloadEntries,
      color: Theme.of(context).primaryColor,
    );
  }
}
