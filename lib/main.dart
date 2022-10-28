import 'package:flutter/material.dart';
import 'package:proyecto_player/player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Players',
      theme: ThemeData(
        backgroundColor: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static List<String> namesSurnames = [
    "Rubén Peña",
    "Alcaraz",
    "Le Normand",
    "Edgar Badia",
    "Javi Sánchez",
    "Hugo Guillamón",
    "Inui",
    "El Hacen"
  ];

  static List<String> position = ["D", "M", "D", "G", "D", "D", "M", "M"];

  static List<String> equipment = [
    "Escudo_Valladolid.png",
    "Escudo_Valladolid.png",
    "Escudo_Real_Sociedad.png",
    "Escudo_Elche.png",
    "Escudo_Valladolid.png",
    "Escudo_Valencia.png",
    "Escudo_Eibar.png",
    "Escudo_Valladolid.png"
  ];

  static List<String> players = [
    "Jugador_Ruben_Pena.png",
    "Jugador_Alcaraz.png",
    "Jugador_Le_Normand.png",
    "Jugador_Edgar_Badia.png",
    "Jugador_Javi_Sanchez.png",
    "Jugador_Hugo_Guillamon.png",
    "Jugador_Inui.png",
    "Jugador_El_Hacen.png",
  ];

  final List<Player> player = List.generate(
      namesSurnames.length,
      (index) => Player(namesSurnames[index], equipment[index], players[index],
          position[index]));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            title: const Text('HOME'),
            centerTitle: true,
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(
              // Puede desplazarse
              isScrollable: false,
              // Color seleccionado
              indicatorColor: Colors.blue,
              // Color no seleccionado
              unselectedLabelColor: Colors.grey,
              //Color de texto
              labelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.emoji_events),
                  text: "Emoji_Events",
                ),
                Tab(
                  icon: Icon(Icons.sports_soccer),
                  text: "Sports_Soccer",
                ),
                Tab(
                  icon: Icon(Icons.sync_alt),
                  text: "Sync_Alt",
                ),
                Tab(
                  icon: Icon(Icons.calendar_month),
                  text: "Calendar_Month",
                ),
                Tab(
                  icon: Icon(Icons.groups),
                  text: "Groups",
                ),
              ],
            ),
          ),
          body: ListView.builder(
              itemCount: player.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: (25),
                            backgroundImage:
                                AssetImage("img/${player[index].jugador}"),
                            backgroundColor: Colors.white,
                          ),
                          const Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                radius: 9,
                                backgroundColor:
                                    Color.fromARGB(255, 43, 43, 43),
                                child: Text(
                                  '0',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Positioned(
                            top: 0,
                            child: SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    Image.asset("img/${player[index].equipo}")),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Positioned(
                              bottom: 0,
                              child: getPositionCircle(player[index].posicion)),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(player[index].nombre,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  onTap: () {
                    print(namesSurnames);
                  },
                );
              }),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey,
            child: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ));
  }

  Widget getPositionCircle(String position) {
    Widget returnWidget = Container();

    switch (position) {
      case 'D':
        returnWidget = CircleAvatar(
          radius: 10,
          backgroundColor: Colors.blue,
          child: Text(position),
        );
        break;
      case 'G':
        returnWidget = CircleAvatar(
          radius: 10,
          backgroundColor: Colors.amber,
          child: Text(position),
        );
        break;
      case 'M':
        returnWidget = CircleAvatar(
          radius: 10,
          backgroundColor: Colors.green,
          child: Text(position),
        );
        break;
      default:
        returnWidget = CircleAvatar(
          radius: 10,
          backgroundColor: Colors.amber,
          child: Text(position),
        );
    }
    return returnWidget;
  }
}
