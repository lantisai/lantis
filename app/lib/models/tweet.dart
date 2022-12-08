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

late List<TweetData> gptTweets;

Future<List<TweetData>> getGptTweets() async {
  final List<dynamic> rawTweets =
      (await supabase.functions.invoke("tweets")).data;
  return rawTweets
      .map((tweet) => TweetData(
            type: choice(TweetType.values),
            title: tweet['title'],
            text: tweet['text'],
            replies: TweetData.randomReplies(),
          ))
      .toList();
}

initGptTweets() async {
  gptTweets = await getGptTweets();
}

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

  static TweetData randomGpt({bool withReplies = true}) {
    return choice(gptTweets);
  }

  TweetData.random({bool withReplies = true})
      : type = choice(TweetType.values),
        title = choice(topics),
        text = faker.lorem.sentences(3).join(" "),
        replies = withReplies ? randomReplies() : [];

  static randomReplies() => List.generate(
      randomInt(0, 7), (_) => TweetData.random(withReplies: false));

  @override
  String toString() {
    return 'TweetData(title=$title, text=$text)';
  }
}

enum TweetType {
  project(icon: Icons.account_balance),
  goal(icon: Icons.directions_run),
  clip(icon: Icons.extension);

  final IconData icon;

  const TweetType({required this.icon});
}
