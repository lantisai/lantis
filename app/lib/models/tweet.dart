import 'package:app/utils.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class TweetData {
  final TweetType type;
  final String title;
  final String text;
  final List<TweetData> replies;

  const TweetData({
    required this.type,
    required this.title,
    required this.text,
    required this.replies,
  });

  TweetData.random()
      : type = choice([
          TweetType.project,
          TweetType.clip,
        ]),
        title = faker.person.name(),
        text = faker.lorem.sentences(3).join(" "),
        replies = [];
}

enum TweetType {
  project(icon: Icons.abc),
  clip(icon: Icons.face);

  final IconData icon;

  const TweetType({required this.icon});
}
