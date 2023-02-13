import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_keyboard_popup_menu/keep_keyboard_popup_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeepKeyboardPopupMenuButton'),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 0,
                  child: KeepKeyboardPopupMenuButton(
                    menuItemBuilder: (context, closePopup) => [
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: KeepKeyboardPopupMenuButton(
                    menuBuilder: (context, closePopup) => Container(
                      color: Colors.teal,
                      child: InkWell(
                        onTap: closePopup,
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Text(
                            "Custom Menu Widget",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  WithKeepKeyboardPopupMenu(
                    backgroundBuilder: (context, child) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 48,
                      ),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFF000000,
                                ).withOpacity(
                                  0.08,
                                ),
                                blurRadius: 16,
                                offset: const Offset(
                                  0,
                                  2,
                                ), // changes position of shadow
                              )
                            ],
                          ),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                ),
                                child: Text(
                                  'タグ',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 225,
                                  ),
                                  child: child,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    menuItemBuilder: (context, closePopup) => [
                      KeepKeyboardPopupMenuItem(
                        onTap: closePopup,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(Icons.apple),
                              Text('Apple'),
                            ],
                          ),
                        ),
                      ),
                      // KeepKeyboardPopupMenuItem(
                      //   onTap: closePopup,
                      //   child: CupertinoButton(
                      //     padding:
                      //         EdgeInsets.zero,
                      //     onPressed: () {},
                      //     child: Row(
                      //       children: const [
                      //         Icon(Icons.apple),
                      //         Gap(16),
                      //         Text('Apple'),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // KeepKeyboardPopupMenuItem(
                      //   onTap: closePopup,
                      //   child: CupertinoButton(
                      //     padding:
                      //         EdgeInsets.zero,
                      //     onPressed: () {},
                      //     child: Row(
                      //       children: const [
                      //         Icon(Icons.apple),
                      //         Gap(16),
                      //         Text('Apple'),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // KeepKeyboardPopupMenuItem(
                      //   onTap: closePopup,
                      //   child: CupertinoButton(
                      //     padding:
                      //         EdgeInsets.zero,
                      //     onPressed: () {},
                      //     child: Row(
                      //       children: const [
                      //         Icon(Icons.apple),
                      //         Gap(16),
                      //         Text('Apple'),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      KeepKeyboardPopupMenuItem(
                        onTap: closePopup,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(Icons.apple),
                              Text('Apple'),
                            ],
                          ),
                        ),
                      ),
                    ],
                    childBuilder: (context, openPopup) => CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      onPressed: openPopup,
                      child: const Icon(
                        Icons.tag,
                      ),
                    ),
                  ),
                  // WithKeepKeyboardPopupMenu(
                  //   menuItemBuilder: (context, closePopup) => [
                  //     KeepKeyboardPopupMenuItem(
                  //       child: Text('awa'),
                  //       onTap: closePopup,
                  //     ),
                  //     KeepKeyboardPopupMenuItem(
                  //       child: Text('awa'),
                  //       onTap: closePopup,
                  //     ),
                  //     KeepKeyboardPopupMenuItem(
                  //       child: Text('awa'),
                  //       onTap: closePopup,
                  //     ),
                  //   ],
                  //   childBuilder: (context, openPopup) => Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: ElevatedButton(
                  //       onPressed: openPopup,
                  //       child: Text('Custom Trigger'),
                  //     ),
                  //   ),
                  // ),
                  WithKeepKeyboardPopupMenu(
                    menuItemBuilder: (context, closePopup) => [
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                    ],
                    childBuilder: (context, openPopup) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: openPopup,
                        child: Text('Custom Background'),
                      ),
                    ),
                    backgroundBuilder: (context, child) => Material(
                      elevation: 16,
                      borderRadius: BorderRadius.circular(16),
                      shadowColor: Colors.red,
                      color: Colors.grey,
                      child: child,
                    ),
                  ),
                  WithKeepKeyboardPopupMenu(
                    menuItemBuilder: (context, closePopup) => [
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                      KeepKeyboardPopupMenuItem(
                        child: Text('awa'),
                        onTap: closePopup,
                      ),
                    ],
                    childBuilder: (context, openPopup) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: openPopup,
                        child: Text('Custom position'),
                      ),
                    ),
                    calculatePopupPosition:
                        (Size menuSize, Rect overlayRect, Rect buttonRect) {
                      return Offset(8, 8);
                    },
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
