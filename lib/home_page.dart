import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Jordon'];
  late String selectedFilter = filters[0];

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final customBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Shoe\nCollection',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: customBorder,
                      enabledBorder: customBorder,
                      focusedBorder: customBorder,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        selectedFilter = filter;
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                        labelPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        label: Text(
                          filter,
                          style: selectedFilter == filters
                              ? const TextStyle(color: Colors.black87)
                              : TextStyle(color: Colors.grey[600]),
                        ),
                        labelStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
