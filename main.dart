import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';
import 'login.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),

        '/first': (context) => const FirstScreen(),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),

        '/third': (context) => const ThirdScreen(),

        '/fourth': (context) => const recipeApp(),




      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Mapo tofu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Chris',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),

              ],
            ),

          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.food_bank , 'buy'),
        _buildButtonColumn(color, Icons.star, 'collect'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Mapo tofu, one of the traditional dishes of Sichuan Province, belongs to Sichuan cuisine. The main material is: tofu, auxiliary materials are: garlic sprouts, beef minced (other meat can also be), and the seasoning is: Soy sauce, light soy sauce, dark soy sauce, sugar, starch and so on. Hemp comes from Sichuan pepper, and spicy comes from chili. This dish is hemp, spicy, fresh, fragrant, hot, green, tender and crisp, showing the characteristics of sichuan spicy taste vividly.',
        softWrap: true,
      ),
    );

    return Scaffold(

        appBar: AppBar(
          title: const Text('Home page '),
        ),
        body: Column(
          //body: ListView(
          children: [
            Image.asset(
              'assets/mapo.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),

            titleSection,
            buttonSection,
            textSection,
            ElevatedButton(child: const Text('detail'),
              onPressed: (){
                Navigator.pushNamed(context, '/second');
              },)
          ],
        ),

      //),

    );

  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(

          child: Column(
            children: [
              Text(
                'Mapo tofu, one of the traditional dishes of Sichuan Province, belongs to Sichuan cuisine. The main material is: tofu, auxiliary materials are: garlic sprouts, beef minced (other meat can also be), and the seasoning is: Soy sauce, light soy sauce, dark soy sauce, sugar, starch and so on. Hemp comes from Sichuan pepper, and spicy comes from chili. This dish is hemp, spicy, fresh, fragrant, hot, green, tender and crisp, showing the characteristics of sichuan spicy taste vividly.',

                softWrap: true,
              ),
              ElevatedButton(child: const Text('next'),
                onPressed: (){
                  Navigator.pushNamed(context, '/third');
                },),
              ElevatedButton(child: const Text('other food'),
                onPressed: (){
                  Navigator.pushNamed(context, '/fourth');
                },),

            ],
          )

      ),
    );


  }

}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(

          child: Column(
            children: [

              Text(
                'Hello',
                softWrap: true,
              ),
              ElevatedButton(child: const Text('cook detail'),
                onPressed: (){
                  Navigator.pushNamed(context, '/fourth');
                },),
              ElevatedButton(child: const Text('go back'),
                onPressed: (){
                  Navigator.pushNamed(context, '/second');
                },),

            ],
          )

      ),
    );


  }

}


class recipeApp extends StatelessWidget {
  const recipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'private photo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'food information'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
        // 4
        child: ListView.builder(
          // 5
          itemCount: Recipe.samples.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            // 7
            // TODO: Update to return Recipe card
            //return Text(Recipe.samples[index].label);
            // TODO: Add GestureDetector
            // 7

            return GestureDetector(
              // 8
              onTap: () {
                // 9
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      // TODO: Replace return with return RecipeDetail()
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildRecipeCard(Recipe.samples[index]),

            );


          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // 1
      elevation: 5.0,
      // 2
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(

          children: <Widget>[

            Image(image: AssetImage(recipe.imageUrl)),
            // 5
            const SizedBox(
              height: 15.0,
            ),
            // 6
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),

          ],

        ),

      ),
    );
  }

}


