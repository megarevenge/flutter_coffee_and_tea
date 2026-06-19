import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(color: Color(0xffF3E4C9), fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff8A5F41),
      ),
      backgroundColor: Colors.white, 
      body: Padding(
        padding: const EdgeInsets.only(top: 40), // Adjusted top padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align elements to the top of page
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // Standardized padding
              child: Row(
                children: [
                  Expanded( 
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, color: Colors.grey), // Added search icon
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8A5F41)), // Matches your theme
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}