import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_msg_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_msg_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/msg_filed_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://png.pngtree.com/png-clipart/20200819/ourlarge/pngtree-female-avatar-profile-png-image_2326119.jpg'),
          ),
        ),
        title: const Text('mi amor'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  // const _ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: chatProvider.message.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.message[index];
                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble()
                        : MyMessageBubble();
                    // return (index % 2 == 0)
                    //     ? const HerMessageBubble()
                    //     : const MyMessageBubble();
                  })),
          const MessageFieldBox()
        ],
      ),
    ));
  }
}
