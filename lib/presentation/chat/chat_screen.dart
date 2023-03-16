import 'package:flutter/material.dart';

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
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Text('indice: $index');
                  })),
          Text('Mundo')
        ],
      ),
    ));
  }
}
