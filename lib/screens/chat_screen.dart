import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_med/components/mesage_bubble.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/constants.dart';

class ChatScreen extends StatefulWidget {
  final int pageId;
  const ChatScreen({super.key, required this.pageId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<MessageBubble> messageBubbles = [];

  void _handleSubmitted(String messageText) {
    final messageBubble = MessageBubble(
      text: messageText,
    );
    _textController.clear();
    setState(() {
      messageBubbles.insert(messageBubbles.length, messageBubble);
    });
  }

  @override
  Widget build(BuildContext context) {
    var product = Get.find<doctorList_controller>().doctorlist[widget.pageId];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 60,
        toolbarHeight: 70.0,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(product.image!),
                radius: 20.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              BigFont(
                text: 'Dr. ${product.name!}',
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: messageBubbles,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.pink.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20.0,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          onChanged: (value) {},
                          decoration: kMessageTextFieldDecoration,
                        ),
                      ),
                      TextButton(
                        onPressed: () => _handleSubmitted(_textController.text),
                        child: Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
