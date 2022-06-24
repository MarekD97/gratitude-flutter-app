enum EntryType { public, private }

enum EntryStatus { accepted, pending, rejected, deleted }

class Entry {
  final int entryId;
  final String content;
  final int userId;
  final EntryType entryType;
  final DateTime createdAt;
  final EntryStatus entryStatus;

  const Entry({
    required this.entryId,
    required this.content,
    required this.userId,
    required this.entryType,
    required this.createdAt,
    required this.entryStatus
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      entryId: json['entryId'],
      content: json['content'],
      userId: json['userId'],
      entryType: EntryType.values.byName(json['entryType']),
      createdAt: DateTime.parse(json['createdAt']),
      entryStatus: EntryStatus.values.byName(json['entryStatus']),
    );
  }
}
