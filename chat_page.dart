lib/pages/chat_page.dart
import 'package:flutter/material.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/option_button.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController controller = TextEditingController();

  final List<String> botOptions = ['Option 1', 'Option 2', 'Option 3'];

  void sendMessage(String text, {bool isUser = true}) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add({'text': text, 'isUser': isUser});
    });
    if (isUser) {
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          messages.add({'text': 'Choose an option:', 'isUser': false, 'options': botOptions});
        });
      });
    }
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Column(
                  crossAxisAlignment: msg['isUser'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    ChatBubble(text: msg['text'], isUser: msg['isUser']),
                    if (msg['options'] != null)
                      Wrap(
                        children: List<Widget>.from(
                          msg['options'].map<Widget>((opt) => OptionButton(
                                text: opt,
                                onPressed: () => sendMessage(opt),
                              )),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(controller: controller, decoration: InputDecoration(hintText: 'Type a message...', border: OutlineInputBorder())),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: () => sendMessage(controller.text), child: Text('Send')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
