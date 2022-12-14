enum EntryStatus { accepted, pending, rejected, deleted, private, unknown }

class Entry {
  final int entryId;
  final String content;
  final int userId;
  final bool public;
  final DateTime createdAt;
  final EntryStatus entryStatus;

  const Entry(
      {required this.entryId,
      required this.content,
      required this.userId,
      required this.public,
      required this.createdAt,
      required this.entryStatus});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      entryId: json['id'],
      content: json['content'],
      userId: json['user'],
      public: json['is_public'] != null ? json['is_public'] as bool : false,
      createdAt: DateTime.parse(json['date']),
      entryStatus:
          EntryStatus.values.byName(json['status'].toString().toLowerCase()),
    );
  }

  @override
  String toString() {
    return 'Entry: {entryId: $entryId, content: $content, userId: $userId, public: $public, createdAt: $createdAt, entryStatus: $entryStatus}';
  }
}
