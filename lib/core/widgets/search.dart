import 'package:flutter/material.dart';
import 'package:ringo/domain/usecase/search_usecase.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _result = [];

  void _search() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    final results = await searchSong(query);
    setState(() => _result = results);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Search the artist or song',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 46,
              fontFamily: 'Spoof',
            ),
          ),

          const SizedBox(height: 20),

          // SEARCH FIELD
          Container(
            width: 450,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 4,
                color: const Color(0xFFdedaff),
              ),
            ),
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _search(),
              cursorColor: const Color(0xFF7c7c7c),
              style: const TextStyle(
                fontFamily: 'Spoof',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                prefixIcon: Icon(
                  Icons.audiotrack_sharp,
                  color: Color(0xFF7c7c7c),
                  size: 16,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          ..._result.map((item) => Text(item['track_name'] ?? '',
              style: const TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
