import 'package:collider_loading/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collider_loading/feature/home/domain/cubit/home_page_cubit.dart';
import 'package:collider_loading/feature/home/domain/cubit/home_page_state.dart';

class HomePage extends StatefulWidget {
  static const pageName = 'home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  late final HomePageCubit _homePageCubit;

  bool _isLoading = false;
  String _responseText = '';
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    _homePageCubit = getIt<HomePageCubit>();
  }

  @override
  void dispose() {
    _controller.dispose();
    _homePageCubit.close();
    super.dispose();
  }

  void _submitPrompt() {
    final prompt = _controller.text.trim();
    if (prompt.isEmpty) return;

    setState(() {
      _responseText = '';
      _errorText = '';
    });

    _homePageCubit.askAi(prompt: prompt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ask Hugging Face AI')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your prompt',
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 5,
            ),
            const SizedBox(height: 12),
            BlocConsumer<HomePageCubit, HomePageState>(
              bloc: _homePageCubit,
              listener: (context, state) {
                if (state is HomePageStateLoading) {
                  setState(() {
                    _isLoading = true;
                    _responseText = '';
                    _errorText = '';
                  });
                } else if (state is HomePageStateSuccess) {
                  setState(() {
                    _isLoading = false;
                    _responseText = state.response;
                    _errorText = '';
                  });
                } else if (state is HomePageStateError) {
                  setState(() {
                    _isLoading = false;
                    _errorText = state.message;
                    _responseText = '';
                  });
                } else if (state is HomePageStateInitial) {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              builder: (context, state) {
                final isLoading = state is HomePageStateLoading;

                return ElevatedButton(
                  onPressed: isLoading ? null : _submitPrompt,
                  child: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Send'),
                );
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: _errorText.isNotEmpty
                    ? Text(
                        _errorText,
                        style: const TextStyle(color: Colors.red),
                      )
                    : Text(
                        _responseText.isNotEmpty ? _responseText : 'Enter a prompt and press Send.',
                        style: const TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
