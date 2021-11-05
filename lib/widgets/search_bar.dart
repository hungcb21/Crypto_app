import 'package:crypto_test/constaints/text_style.dart';
import 'package:crypto_test/model/coins.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.search,
            size: 30,
            color: Colors.blueAccent,
          ),
          Flexible(
            child: Autocomplete<Coins>(
              displayStringForOption: _displayStringForOption,
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
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
                      padding: EdgeInsets.all(10.0),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Coins option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Card(
                            child: ListTile(
                              leading: Image.network(option.image ??
                                  'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true'),
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
                print(
                    'You just selected ${_displayStringForOption(selection)}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
