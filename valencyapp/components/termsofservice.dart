import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ValencyTOS extends StatefulWidget {
  const ValencyTOS({
    Key? key,
    required this.url, 
    required this.onScrolledToBottom,
  }) : super(key: key);

  final String url;                     // The url with the plaintext TOS
  final Function onScrolledToBottom;    // The function that is ran when scrolled to bottom

  @override
  _ValencyTOSState createState() => _ValencyTOSState();
}

class _ValencyTOSState extends State<ValencyTOS> {
  String _textData = "";                                            // Place to store fetched text
  bool _isAtBottom = false;                                         // Shouldn't spawn widget already scrolled to bottom
  final ScrollController _scrollController = ScrollController();    // Handles scroll detection

  @override
  void initState() {
    super.initState();
    _fetchTextData();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> _fetchTextData() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      if(response.statusCode = 200) {
        setState(() {
          _textData = response.body;
        });
      } else {
        // Handle error
        
      }
    } catch (e) {
      // Handle error
    }
  }

  void _scrollListener() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isAtBottom) {
      widget.onScrolledToBottom();
      setState(() {
        _isAtBottom = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(5),
      ),
      child: _textData.isEmpty
        ? CircularProgressIndicator()
        : SingleChildScrollView(
          controller: _scrollController,
          child: Text(_textData),
        ),
    
    );
  }
}

