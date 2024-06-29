import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final nameController = TextEditingController();

  List<String> get list {
    final all = [
      "ahmed",
      "ali",
      "mohamed",
      "mahmoud",
      "omar",
      "omar ali",
      "Wael",
      "Hassan",
    ];
    return all
        .where(
          (element) => element.toLowerCase().startsWith(
                nameController.text.toLowerCase(),
              ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Names"),
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: TextFormField(
            controller: nameController,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ),
      body: list.isEmpty
          ? Center(child: Text("Empty Result"))
          : ListView.separated(
              padding: const EdgeInsets.all(24),
              itemBuilder: (context, index) => Center(
                child: Text(
                  list[index].replaceFirst(
                    list[index][0],
                    list[index][0].toUpperCase(),
                  ),
                  style: TextStyle(fontSize: 35),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: list.length,
            ),
    );
  }
}
