import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outLineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        hintText: 'End your message with "?"',
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              print('valor de la caja:$textValue');
              textController.clear();
            },
            icon: const Icon(Icons.send_outlined)));
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('submit $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
