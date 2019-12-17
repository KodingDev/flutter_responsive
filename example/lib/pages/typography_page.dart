import 'package:flutter/material.dart';
import 'package:flutter_responsive/flutter_responsive.dart';
import 'package:flutter_responsive_example/layouts/sidebar.dart';

class TypographyPage extends StatefulWidget {
  @override
  _TypographyPage createState() => new _TypographyPage();
}

class _TypographyPage extends State<TypographyPage> {

  bool highlight, shrink;
  List<String> allowedElements = [
    'p',
    'b',
    'i',
    'u',
    's',
    'a',
    'br',
    'mute',
    'q',
    'center',
    'h1',
    'h2',
    'h3',
    'h4',
    'h5',
    'h6',
    'img',
    'pre',
    'code',
  ];

  @override
  void initState() {
    highlight = false;
    shrink = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Color
      hilightedColor = Colors.yellowAccent,
      hilightColor = highlight ? hilightedColor : Colors.transparent;

    TextStyle defaultStyle = TextStyle(
      inherit: true,
      color: Colors.black
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text(
              'Typography', overflow: TextOverflow.ellipsis),
        ),
        drawer: Sidebar(),
        body: DefaultTextStyle(
          style: defaultStyle,
          child: ListView(
            children: <Widget>[
              ResponsiveContainer(
                padding: EdgeInsets.all(10),
                children: <Widget>[

                  /* ***************************************************
                  Options
                  */
                  ResponsiveRow(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      children: <Widget>[
                        SwitchListTile(
                            title: Text('Hilight text boxes'),
                            value: highlight,
                            activeColor: hilightedColor,
                            onChanged: (selected){
                              setState(() {
                                highlight = selected;
                              });
                            }
                        ),
                        SwitchListTile(
                            title: Text('Textbox shrink to fit'),
                            value: shrink,
                            activeColor: hilightedColor,
                            onChanged: (selected){
                              setState(() {
                                shrink = selected;
                              });
                            }
                        ),
                      ]
                  ),

                  /* ***************************************************
                  Divider
                  */
                  ResponsiveRow(
                    margin: EdgeInsets.only(bottom: 40),
                    children: <Widget>[
                      Divider(height: 5, color: Color.fromARGB(255, 86, 61, 124))
                    ],
                  ),

                  /* ***************************************************
                  Examples
                  */
                  ResponsiveRow(
                    padding: EdgeInsets.only(bottom: 20),
                    children: <Widget>[
                      ResponsiveText(
                        text:'<h6>h6. Responsive heading</h6>',
                        allowedElements: allowedElements,
                        margin: EdgeInsets.only(bottom: 40),
                        backgroundColor: hilightColor,
                        defaultTextStyle: TextStyle(color: Colors.blueGrey),
                        shrinkToFit: shrink,
                      ),

                      ResponsiveText(
                        text:
                        '<h1>h1. Responsive heading</h1>'
                        '<h2>h2. Responsive heading</h2>'
                        '<h3>h3. Responsive heading</h3>'
                        '<h4>h4. Responsive heading</h4>'
                        '<h5>h5. Responsive heading</h5>'
                        '<h6>h6. Responsive heading</h6>',
                        margin: EdgeInsets.only(bottom: 40),
                        allowedElements: allowedElements,
                        backgroundColor: hilightColor,
                        shrinkToFit: shrink,
                      ),

                      ResponsiveText(
                        text:
                        '<h3>Fancy display heading <mute>with faded secondary text</mute></h3>',
                        margin: EdgeInsets.only(bottom: 40),
                        allowedElements: allowedElements,
                        backgroundColor: hilightColor,
                        shrinkToFit: shrink,
                      ),
                      ResponsiveText(
                        text:
                        """
                          <h1>Demo Page</h1>
                          <b>Note:</b><br>
                          <p>This is a fantastic nonexistent product that you should buy!</p>
                          <h2>Pricing</h2>
                          <p>Lorem ipsum <b>dolor</b> sit amet.</p>
                          <p>There isn't <i>really</i> a team...</p>
                          <p>You <u>cannot</u> install a nonexistent product!</p>
                          <p><code>bdi</code> and <code>bdo</code> Test.</p>
                        """,
                        margin: EdgeInsets.only(bottom: 40),
                        allowedElements: allowedElements,
                        backgroundColor: hilightColor,
                        shrinkToFit: shrink,
                      ),
                      ResponsiveText(
                        boxDecoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 10.0, color: Colors.grey.shade600),
                          ),
                          color: hilightColor,
                        ),
                        margin: EdgeInsets.only(left: 30, right: 10),
                        text:
                          '<q>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim'
                          ' veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate'
                          ' velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit '
                          'anim id est laborum.</q><p align="right"><i>Happy Tests</i> - 08 Dez 2019</p>',
                        allowedElements: allowedElements,
                        boxAlign: Alignment.topLeft,
                        shrinkToFit: shrink,
                      )

                    ],
                  ),

                ],
              )
            ],
          ),
        )
    );
  }
}