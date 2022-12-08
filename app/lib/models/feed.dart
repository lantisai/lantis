import 'package:app/models/tweet.dart';

class FeedData {
  final List<TweetData> tweets;

  FeedData(this.tweets);

  FeedData.random() : tweets = [];

  TweetData tweetByIndex(int index) {
    if (index >= tweets.length) {
      tweets.addAll(
          List.generate(index - tweets.length + 1, (_) => TweetData.randomGpt()));
    }
    return tweets[index];
  }
}
