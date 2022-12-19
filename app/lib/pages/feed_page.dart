import 'package:app/components/navbar.dart';
import 'package:app/components/tweet.dart';
import 'package:app/models/feed.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final FeedData data = FeedData.empty();

  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  Future initStateAsync() async {
    await data.fetch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.tweets.length,
        itemBuilder: (context, index) => Tweet(data: data.tweetByIndex(index)),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
