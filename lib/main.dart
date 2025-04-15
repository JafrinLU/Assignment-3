import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Text Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  String _convertedText = '';
  bool _isBold = false;
  bool _isItalic = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _convertText() {
    setState(() {
      _convertedText = _textController.text;
    });
  }

  void _toggleBold(bool? value) {
    setState(() {
      _isBold = value ?? false;
    });
  }

  void _toggleItalic(bool? value) {
    setState(() {
      _isItalic = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter text to convert',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertText,
              child: const Text('Convert Text'),
            ),
            const SizedBox(height: 16),
            const Text('Options:', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Checkbox(
                  value: _isBold,
                  onChanged: _toggleBold,
                ),
                const Text('Bold'),
                const SizedBox(width: 16),
                Checkbox(
                  value: _isItalic,
                  onChanged: _toggleItalic,
                ),
                const Text('Italic'),
              ],
            ),
            const SizedBox(height: 30),
            const Text('Converted Text:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              _convertedText,
              style: TextStyle(
                fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
                fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}