import 'package:app/components/navbar.dart';
import 'package:app/models/feed.dart';
import 'package:app/models/tweet.dart';
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
      bottomNavigationBar: const NavBar(),
    );
  }
}

class Tweet extends StatelessWidget {
  final TweetData data;

  const Tweet({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: cs.primaryContainer,
                child: Icon(data.type.icon, color: cs.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: tt.subtitle2,
                    ),
                    const SizedBox(height: 8),
                    Text(data.text, style: tt.bodyText1),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: const Color(0xffcccccc),
          height: 0.5,
          width: double.infinity,
        ),
      ],
    );
  }
}
