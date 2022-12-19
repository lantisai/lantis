import 'package:app/utils.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:app/constants.dart';

List<String> topics = [
  "AI and ML",
  "Data science",
  "Robotics",
  "Computer science",
  "Biotechnology",
  "Environmental science",
  "Quantum computing",
  "Renewable energy",
];

class TweetData {
  final int id;
  final TweetType type;
  final String head;
  final String content;
  final String author;
  final String? avatarUrl;
  final int repliesNum;
  List<TweetData> replies = [];

  TweetData({
    required this.id,
    required this.type,
    required this.head,
    required this.content,
    required this.author,
    required this.avatarUrl,
    required this.repliesNum,
  });

  factory TweetData.fromJson(Map<String, dynamic> json) {
    return TweetData(
      id: json['id'],
      type: TweetType.values.firstWhere(
          (e) => e.toString() == 'TweetType.${json["type"]}',
          orElse: () => TweetType.custom),
      head: json['head'],
      content: json['content'],
      author: json['full_name'],
      avatarUrl: json['avatar_url'],
      repliesNum: json['replies_num'],
    );
  }

  @override
  String toString() {
    return 'TweetData(id=$id,author=$author,head=$head)';
  }

  Future fetchReplies() async {
    final raw = await supabase
        .from('tweets_full')
        .select('*')
        .eq('parent_id', id)
        .order('id', ascending: true);
    replies = raw
        .map((tweet) => TweetData.fromJson(tweet))
        .toList()
        .cast<TweetData>();
  }
}

enum TweetType {
  custom(),
  project(),
  milestone(),
  step();

  const TweetType();
}
