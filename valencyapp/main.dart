import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valencyapp/base_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();                                                               // Ensures app is initialized
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);                                  // Disables Bottom Bar and Status Bar
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);   // Ensures app runs in portrait

  runApp(MyApp());  // Run the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valency',
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const BasePage(),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // Logic goes here
}

class PortfolioPage {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('My Portfolio'),                                      // My Portfolio
          child: Text('$' '${appState.userinfo.portfolioValue}'),           // $2000.00
          if(appState.userinfo.isPortfolioValueUp) {
            child: Icon();          // Up Arrow Icon
            child: Text('+$' '${appState.userinfo.}' 'appState.filterinfo.scope'),
          } else {
            child: Icon();          // Down Arrow Icon
            child: Text('${appState.userinfo.isPortfolioValueUp}' '$' ''),
          }
          
        )
      ]
    )
  }
}  // Contains the user portfolio - includes any open positions (short, put, call, etc)
class WalletPage {
  @override
}     // Contains the user wallet and balances + withdraw options
class ExplorePage {
  @override
}    // Contains all the cryptocurrencies - you can buy cryptocurrencies here / swap them for already owned assets
class TradingPage {
  @override
}    // Contains the users current (open) and previous (closed) positions + lets the user open new positions
class SettingsPage {
  @override
}   // Contains settings
class AddFundsPage {
  @override
}   // Contains Add Funds Page
class WithdrawFundsPage {
  @override
}   // Contains Withdraw Funds Page
class WithdrawAssetForFundsPage {
  @override
}   // Contains Withdraw Asset For Funds Page - Sell asset immediatly for funds - don't sell asset, get funds in account, then withdraw

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