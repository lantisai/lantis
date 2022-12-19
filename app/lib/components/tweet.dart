import 'package:app/models/tweet.dart';
import 'package:app/pages/tweet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Avatar extends StatelessWidget {
  final IconData icon;
  final int radius;
  const Avatar({super.key, required this.icon, required this.radius});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: radius.toDouble(),
      backgroundColor: cs.primaryContainer,
      child: Icon(
        icon,
        color: cs.onPrimaryContainer,
      ),
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TweetPage(data: data),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Avatar(icon: Icons.adb, radius: 24),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.author, style: tt.subtitle2),
                      const SizedBox(height: 4),
                      MarkdownBody(data: data.head),
                      const SizedBox(height: 8),
                      Row(children: [
                        const Icon(
                          Icons.mode_comment_outlined,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(data.repliesNum.toString()),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(color: const Color(0xffcccccc), height: 0.5),
        ],
      ),
    );
  }
}

class TweetMax extends StatelessWidget {
  final TweetData data;

  const TweetMax({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Avatar(icon: Icons.adb, radius: 24),
                  SizedBox(width: 16),
                  Text(data.author, style: tt.subtitle2),
                ],
              ),
              SizedBox(height: 16),
              MarkdownBody(data: data.content),
              const SizedBox(height: 16),
            ],
          ),
        ),
        Container(color: const Color(0xffcccccc), height: 0.5),
      ],
    );
  }
}
