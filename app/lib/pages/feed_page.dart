import 'package:app/components/navbar.dart';
import 'package:app/components/tweet.dart';
import 'package:app/models/feed.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  final FeedData data;

  const FeedPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => Tweet(data: data.tweetByIndex(index)),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
