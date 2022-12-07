import 'package:app/models/tweet.dart';

class FeedData {
  final Iterable<TweetData> tweets;
  Iterator<TweetData>? iter;

  FeedData(this.tweets);

  FeedData.random() : tweets = randomTweets();

  TweetData tweetByIndex(int index) {
    iter ??= tweets.iterator;
    iter!.moveNext();
    return iter!.current;
  }
}

Iterable<TweetData> randomTweets() sync* {
  while (true) {
    yield TweetData.random();
  }
}
