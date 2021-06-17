import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'gases.dart';
import 'nobeleChart.dart';

// ignore: camel_case_types
class stppage extends StatefulWidget {
  const stppage({Key key}) : super(key: key);

  @override
  _stppageState createState() => _stppageState();
}

// ignore: camel_case_types
class _stppageState extends State<stppage> {
  TextEditingController _controller;
  final List<String> searchedElements;
  _MySearchDelegate _delegate;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _stppageState()
      : searchedElements = List.from(Set.from(nameWord))
          ..sort((w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase())),
        super();

  @override
  void initState() {
    super.initState();
    _delegate = _MySearchDelegate(searchedElements);
    this._controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = 'pub.dev';
    return Scaffold(
        key: this._scaffoldKey,
        backgroundColor: Colors.blueGrey[800],
        drawer: Drawer(
          elevation: 20.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                ),
                child: Text(
                  'The Noble Gases',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'GreatPrimer',
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => stppage()));
                },
                leading: Icon(
                  Icons.home,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    // color: Colors.white54,
                    letterSpacing: 2.0,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Courgette',
                  ),
                ),
              ),
              ListView.builder(
                itemCount: noble_gases.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OutOut(index),
                      ),
                    );
                  },
                  leading: Text(
                    noble_gases[index].sym,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  title: Text(
                    noble_gases[index].element,
                    style: TextStyle(
                      // color: Colors.white54,
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Courgette',
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'About Developer',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 32.0,
                        ),
                      ),
                      content: const Text(
                          '''Hi this is Milan Gurung, the Developer of this Noble Gases app. This App only contains 6 Noble gases, the reason I didn't include Oganesson-118 because very few information and no pictures whatsoever. This Project was Assigned by our Great Mentor Mr. Susan Timilsina Dai.\nThank you for Checking out my App!'''),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                leading: Icon(
                  Icons.info_rounded,
                ),
                title: Text(
                  'About Developer',
                  style: TextStyle(
                    // color: Colors.white54,
                    letterSpacing: 2.0,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Courgette',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 160,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'The Noble Gases',
                  style: TextStyle(
                    fontFamily: 'GreatPrimer',
                  ),
                ),
                background: Image.asset('images/noG.jpg'),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search_rounded),
                  onPressed: () async {
                    final String selected = await showSearch<String>(
                      context: context,
                      delegate: _delegate,
                    );
                  },
                ),
              ],
              elevation: 12.0,
              centerTitle: true,
            ),
            SliverFillRemaining(
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 10.0,
                  children: List.generate(nobleElements.length, (index) {
                    return Center(
                      child: SelectNobleElement(
                          choosed: nobleElements[index], ind: index),
                    );
                  })),
            ),
            ElevatedButton(
              onPressed: () => this
                  ._scaffoldKey
                  .currentState
                  .showBottomSheet((context) => _bottomSheetURL(context, this._controller.text)),
              child: Center(
                  child: Icon(
                Icons.add,
              )),
            ),
          ],
        ));
  }
}

Widget _bottomSheetURL(BuildContext context, String usrUrl) {
  return Container(
    height: 300,
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.orange,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: ListView(
      children: [
        ListTile(
          title: Text('in-app Web Browsing'),
        ),
        TextField(
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.web_rounded),
            labelText: 'Enter the URL',
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            icon: Icon(
              Icons.search_sharp
            ),
            label: Text('Go!'),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              _openURL('https://$usrUrl');
            },
            ),
          
        ),
      ],
    ),
  );
}

Future<void> _openURL(String url) async {
  if (await url_launcher.canLaunch(url)) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => WebviewScaffold(
          initialChild: const Center(child: CircularProgressIndicator()),
          url: url,
          appBar: AppBar(
            title: Text(url),
          ),
        ),
      ),
    );
  }
  else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('URL $url can not be launched'),
      ),
    );
  }
}

class SelectNobleElement extends StatelessWidget {
  const SelectNobleElement({Key key, this.choosed, this.ind}) : super(key: key);
  final nobleElement choosed;
  final int ind;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.indigo[900],
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Expanded(
                child: Image(
                  image: AssetImage(choosed.image),
                ),
              ),
              onTap: () {
                int ino = ind;
                // switch (choosed.title) {
                //   case 'Helium':
                //     ind = 0;
                //     break;
                //   case 'Neon':
                //     ind = 1;
                //     break;
                //   case 'Argon':
                //     ind = 2;
                //     break;
                //   case 'Krypton':
                //     ind = 3;
                //     break;
                //   case 'Xenon':
                //     ind = 4;
                //     break;
                //   case 'Radon':
                //     ind = 5;
                //     break;
                //   default:
                //     break;
                // }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OutOut(ino)),
                );
              },
            ),
            Text(
              choosed.title,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Courgette',
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MySearchDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  _MySearchDelegate(List<String> words)
      : _words = words,
        _history = <String>[],
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                int ino = 0;
                switch (this.query) {
                  case 'Helium':
                    ino = 0;
                    break;
                  case 'Neon':
                    ino = 1;
                    break;
                  case 'Argon':
                    ino = 2;
                    break;
                  case 'Krypton':
                    ino = 3;
                    break;
                  case 'Xenon':
                    ino = 4;
                    break;
                  case 'Radon':
                    ino = 5;
                    break;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OutOut(ino)),
                );
                this.close(context, this.query);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isEmpty)
        IconButton(
          tooltip: 'Voice Search',
          icon: const Icon(Icons.mic),
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    ListTile(
                      dense: true,
                      title: Text(
                          'Currently Voice Search feature has not been added, I\'ll add it shortly in future'),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Click OK to dismiss'),
                    ),
                    ButtonBar(children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ]),
                  ],
                ),
              ),
            );
          },
        )
      else
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        )
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
