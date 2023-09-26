import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Valency',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // Logic goes here
}

class PortfolioPage extends StatelessWidget {
  @override
}  // Contains the user portfolio - includes any open positions (short, put, call, etc)
class WalletPage extends StatelessWidget {
  @override
}     // Contains the user wallet and balances + withdraw options
class ExplorePage extends StatelessWidget {
  @override
}    // Contains all the cryptocurrencies - you can buy cryptocurrencies here / swap them for already owned assets
class TradingPage extends StatelessWidget {
  @override
}    // Contains the users current (open) and previous (closed) positions + lets the user open new positions
class SettingsPage extends StatelessWidget {
  @override
}   // Contains settings

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // App Logic Goes Here
  var pageNum = 0;  // 0 = Portfolio | 1 = Wallet | 2 = Explore | 3 = Trading | 4 = Settings

  @override
  Widget build(BuildContext context) {

    Widget page;
    switch (selectedIndex) {
    case 0:
      page = GeneratorPage();
    break;
    case 1:
      page = FavoritesPage();
    break;
    default:
      throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    
                    setState(() {
                      selectedIndex = value;
                    });

                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}