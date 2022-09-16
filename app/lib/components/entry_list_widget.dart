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
  bool listEnd = false;

  @override
  void initState() {
    super.initState();
    loadEntries();
    addScrollControllerListener();
  }

  void addScrollControllerListener() {
    widget.scrollController.addListener(() {
      double currentPosition = widget.scrollController.position.pixels;
      double offset = widget.scrollController.position.maxScrollExtent - 200.0;

      if (!isLoading && currentPosition >= offset) {
        loadEntries();
      }
    });
  }

  void setLoadingState(bool newState) {
    setState(() {
      isLoading = newState;
    });
  }

  Future loadEntries() async {
    if (!mounted) return;
    setLoadingState(true);

    // Load more entries
    await getEntries(currentPage + 1).then((result) {
      if (result.isEmpty || result.length < 10) {
        listEnd = true;
      } else {
        data.addAll(List.generate(result.length, (index) => result[index]));
        currentPage += 1;
      }
    });

    if (!mounted) return;
    setLoadingState(false);
  }

  Future reloadEntries() async {
    currentPage = 0;
    data.clear();
    await loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    ListView entryListBuilder = ListView.builder(
        padding: EdgeInsets.zero,
        controller: widget.scrollController,
        itemBuilder: (context, i) {
          if (i == data.length) {
            if (listEnd) {
              return const Center(child: Text('No more data'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
          return EntryCardWidget(
            text: data[i].content,
            onReportPressed: (String value) {
              print("Entry of ID: ${data[i].entryId} was reported");
            },
            onFavoritePressed: () {
              print("Entry of ID: ${data[i].entryId} was added to Favourite");
            },
          );
        },
        itemExtent: 200.0,
        itemCount: data.length + 1);

    return RefreshIndicator(
      child: Column(
        children: [
          FilterChipsWidget(
            filters: const ["Zatwierdzone", "Niezatwierdzone", "Wszystkie"],
            onFilterChanged: (index) {
              print(index);
            },
          ),
          Expanded(child: entryListBuilder),
        ],
      ),
      onRefresh: reloadEntries,
      color: Theme.of(context).primaryColor,
    );
  }
}
