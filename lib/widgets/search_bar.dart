import 'package:crypto_test/constaints/routes.dart';

import '../constaints/strings.dart';
import '../constaints/text_style.dart';
import '../model/coins.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  List<Coins> datalist;

  SearchBar(this.datalist);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _displayStringForOption(Coins option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.blueAccent,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Autocomplete<Coins>(
              displayStringForOption: _displayStringForOption,
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: StringData.hintTextSearch),
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                );
              },
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<Coins>.empty();
                }
                return widget.datalist.where((Coins option) {
                  return option.name
                          .toString()
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()) ||
                      option.symbol
                          .toString()
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                });
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 300,
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Coins option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Card(
                            child: ListTile(
                              leading: Image.network(
                                option.image!,
                                errorBuilder: (context, error, strackTrace) =>
                                    Icon(Icons.error),
                              ),
                              title: Text(
                                option.name,
                                style: TextStylesApp.nameCoin,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              onSelected: (Coins selection) {
                Navigator.pushNamed(
                  context,
                  RouteConstant.detailRoute,
                  arguments: selection,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
