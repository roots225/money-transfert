import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double logoSize = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/phone-gf8bb85b69_1280.jpg'),
              fit: BoxFit.fitHeight,
              opacity: 0.7,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.overlay)),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: logoSize,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ROOTS225',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Money Transfert',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: logoSize,
                          width: logoSize,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(logoSize / 2)),
                          ),
                          child: Image.asset('assets/images/logo.png'),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ActionButton(
                            size: 60,
                            icon: Icons.arrow_back_ios_sharp,
                            label: "Envoyer de l'argent"),
                        ActionButton(size: 60, label: ""),
                        ActionButton(size: 60, label: "Scanner"),
                        ActionButton(size: 60, label: "Ajouter"),
                      ],
                    )
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

class ActionButton extends StatelessWidget {
  final double size;
  final IconData? icon;
  final String label;
  const ActionButton(
      {super.key, required this.size, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(size, size),
                padding: EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                )
                // side: BorderSide(color: Colors.transparent, style: BorderStyle.solid)
                ),
            child: Icon(
              Icons.arrow_circle_right_sharp,
              color: Colors.black,
              size: size / 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(label, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
