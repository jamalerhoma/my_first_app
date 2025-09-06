import 'package:flutter/material.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({super.key});

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title:  const Text('أضف مهمة جديدة'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
          controller: _textController,
          onSubmitted: (value) {
            final text = _textController.text;
            _textController.clear();
            Navigator.pop(context, text);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          hintText: 'أدخل مهمة جديدة...',
        ),
            focusNode: _focusNode,
      ),
      const SizedBox(height: 20),
      ElevatedButton(
      onPressed: () {
        final text = _textController.text;
        _textController.clear();
        Navigator.pop(context, text);
        },
      child: const Text('إضافة'),
    ),
    ],
    ),
    ),
    );
  }
}