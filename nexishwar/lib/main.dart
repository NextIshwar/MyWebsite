import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hovering = false;
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        padding: const EdgeInsets.all(50),
        decoration: const BoxDecoration(color: Color.fromARGB(255, 12, 1, 14)),
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isExpanded ? _height : 400,
          width: _isExpanded ? _width : 600,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 61, 60, 60),
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(10), bottom: Radius.circular(5)),
          ),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 188, 186, 186),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: InkWell(
                          onHover: (val) {
                            setState(() {
                              _hovering = val;
                            });
                          },
                          child: Icon(
                            Icons.close,
                            size: 10,
                            color: _hovering
                                ? const Color.fromARGB(255, 30, 30, 30)
                                : Colors.transparent,
                          ),
                          onTap: () {}),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.yellow,
                      child: InkWell(
                        onHover: (val) {
                          setState(() {
                            _hovering = val;
                          });
                        },
                        mouseCursor: SystemMouseCursors.click,
                        child: Icon(
                          Icons.minimize,
                          size: 10,
                          color: _hovering
                              ? const Color.fromARGB(255, 30, 30, 30)
                              : Colors.transparent,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.green,
                      child: InkWell(
                        onHover: (val) {
                          setState(() {
                            _hovering = val;
                          });
                        },
                        child: Icon(
                          Icons.open_in_full,
                          color: _hovering
                              ? const Color.fromARGB(255, 30, 30, 30)
                              : Colors.transparent,
                          size: 10,
                        ),
                        onTap: () {
                          setState(() {
                            if (_isExpanded) {
                              _isExpanded = false;
                            } else {
                              _isExpanded = true;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
