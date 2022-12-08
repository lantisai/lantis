import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final bool hasReplyInput;
  const NavBar({super.key, this.hasReplyInput = false});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(color: Color(0xffcccccc), width: 0.5))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...(hasReplyInput ? [const ReplyInputStub()] : []),
          BottomNavigationBar(
            selectedItemColor: cs.primary,
            unselectedItemColor: cs.onSurface,
            backgroundColor: cs.surface,
            type: BottomNavigationBarType.fixed,
            currentIndex: 1,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "Discover",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReplyInputStub extends StatelessWidget {
  const ReplyInputStub({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GestureDetector(
          onTap: () {
            pushModal(context, (context) => const ReplyInputModal());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: cs.primaryContainer.withAlpha(120),
            ),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Tweet your reply",
                  style: tt.bodyText1
                      ?.copyWith(color: cs.onPrimaryContainer.withAlpha(120)),
                )),
          ),
        ));
  }
}

class ReplyInputModal extends StatefulWidget {
  const ReplyInputModal({super.key});

  @override
  _ReplyInputModalState createState() => _ReplyInputModalState();
}

class _ReplyInputModalState extends State<ReplyInputModal> {
  final _replyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cs = Theme.of(context).colorScheme;
    var tt = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(color: const Color(0xffcccccc), height: 0.5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  style: tt.bodyText1
                      ?.copyWith(color: cs.onPrimaryContainer.withAlpha(120)),
                  controller: _replyController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                          color: cs.onPrimaryContainer.withAlpha(120)),
                      hintText: "Tweet your reply",
                      fillColor: cs.primaryContainer.withAlpha(120)),
                ),
                const SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cs.primaryContainer,
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text("Reply",
                        style:
                            tt.button?.copyWith(color: cs.onPrimaryContainer)),
                  ),
                ]),
              ],
            ),
          ),
          ...(kIsWeb
              ? []
              : [SizedBox(height: MediaQuery.of(context).viewInsets.bottom)]),
        ],
      ),
    );
  }
}

void pushModal(BuildContext context, Widget Function(BuildContext) builder) {
  var cs = Theme.of(context).colorScheme;
  var tt = Theme.of(context).textTheme;
  showModalBottomSheet(
    isScrollControlled: true,
    barrierColor: const Color(0x00000000),
    context: context,
    builder: builder,
  );
}
