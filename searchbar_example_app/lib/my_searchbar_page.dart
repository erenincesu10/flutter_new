import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySearchBarPage extends StatefulWidget {
  const MySearchBarPage({super.key});

  @override
  State<MySearchBarPage> createState() => _MySearchBarPageState();
}

class _MySearchBarPageState extends State<MySearchBarPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "name";

  bool _searchState = true;

  List<Map<String, dynamic>> _dataList = [
    {"name": "Mini", "surname": "Mouse"},
    {"name": "Mickey", "surname": "Mouse"},
  ];

  List<Map<String, dynamic>> _filteredDataList = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _filteredDataList = List.from(_dataList);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchQuery = _searchController.text.toLowerCase();
    _filteredDataList = _dataList
        .where((data) => data[_searchState ? 'name' : 'surname']
            .toString()
            .toLowerCase()
            .contains(searchQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Bar Example"),
        centerTitle: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 4)),
                          hintText: "Search by $_searchText"),
                    ),
                  ),
                  SizedBox(width: 10),
                  ToggleButtons(
                    isSelected: [_searchState, !_searchState],
                    onPressed: (index) {
                      setState(() {
                        _searchState = index == 0;
                        _onSearchChanged();
                      });
                    },
                    children: [
                      Text("Name"),
                      Text("Surname"),
                    ],
                  ),
                ],
              ),
            ),
            DataTable(
                columns: [
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Surname")),
                ],
                rows: _filteredDataList.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data['name'])),
                      DataCell(Text(data['surname']))
                    ],
                  );
                }).toList()),
          ],
        ),
      ),
    );
  }
}
