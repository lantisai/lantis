import 'package:app/components/navbar.dart';
import 'package:app/components/tweet.dart';
import 'package:app/models/tweet.dart';
import 'package:flutter/material.dart';

class TweetPage extends StatefulWidget {
  final TweetData data;

  const TweetPage({super.key, required this.data});

  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  late TweetData data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    initStateAsync();
  }

  void initStateAsync() async {
    await data.fetchReplies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text("Tweet", style: tt.headline6)),
        actions: const [SizedBox(width: 56)],
      ),
      body: ListView(
        children: [
          TweetMax(data: data),
          ...data.replies.map((data) => Tweet(data: data)),
        ],
      ),
      bottomNavigationBar: NavBar(hasReplyInput: true),
    );
  }
}
