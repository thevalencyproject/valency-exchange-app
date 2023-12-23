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
  bool _errorOccurred = false;                                      // Indicates if an error has occurred

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
          _errorOccurred = false;   // Reset error state to false (if retried successfully after unsuccessful fetch)
        });
      } else {
        // Handle error for bad response from http
        setState(() {
          _textData = "[NETWORK ERROR]: Plaintext TOS Unreachable using HTTP";
          _errorOccurred = true;   // Set error state
        });        
      }
    } catch (e) {
      // Handle error from network
      setState(() {
        _textData = "[NETWORK ERROR]: Plaintext TOS Unreachable";
        _errorOccurred = true;   // Set error state
      });
    }
  }

  void _scrollListener() {    // Checks when the user has scrolled to the bottom
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
      child: _errorOccurred
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_textData, style: TextStyle(color: Colors.red)),
              SizedBox(height: 20),
              ElevatedButton(               // Display a retry button if an error has occurred
                onPressed: _fetchTextData,  // Retry fetching the text when pressed
                child: Text('Retry'),
              ),
            ],
          )
        : _textData.isEmpty
            ? CircularProgressIndicator()       // Display a loading animation if no data has been loaded yet
            : SingleChildScrollView(
                controller: _scrollController,
                child: Text(_textData),
              ),
    );
  }
}

