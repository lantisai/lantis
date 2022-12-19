import 'package:app/models/tweet.dart';
import 'package:app/constants.dart';

class FeedData {
  final List<TweetData> tweets;

  FeedData(this.tweets);

  FeedData.empty() : tweets = [];

  TweetData tweetByIndex(int index) {
    if (index >= tweets.length) {
      // tweets.addAll(
      //     List.generate(index - tweets.length + 1, (_) => TweetData.randomGpt()));
    }
    return tweets[index];
  }

  Future fetch() async {
    tweets.replaceRange(0, tweets.length, await fetchFeedTweets());
  }
}

Future<List<TweetData>> fetchFeedTweets() async {
  final data =
      await supabase.from('tweets_full').select('*').is_('parent_id', null);
  final xs =
      data.map((tweet) => TweetData.fromJson(tweet)).toList().cast<TweetData>();
  return xs;
}
