import 'package:flutter/material.dart';
import 'recipe.dart';
import 'main.dart';
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
        '/': (context) => const recipeApp(),

        '/first': (context) => const FirstScreen(),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),

        '/third': (context) => const ThirdScreen(),



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


            ],
          )

      ),
    );


  }

}

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

// TODO: Add _RecipeDetailState here
class _RecipeDetailState extends State<RecipeDetail> {
  // TODO: Add _sliderVal here
  int _sliderVal = 1;


  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      // 2
      body: SafeArea(
        // 3
        child: Column(
          children: <Widget>[
            // 4
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            // TODO: Add Expanded
            // 7
            Expanded(
              // 8
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // 9
                  // TODO: Add ingredient.quantity
                  return Text('${ingredient.quantity * _sliderVal} '
                      '${ingredient.measure} '
                      '${ingredient.name}');

                },
              ),
            ),
            ElevatedButton(child: const Text('another food'),
              onPressed: (){
                Navigator.pop(context, '/SecondScreen');



              },),



            // TODO: Add Slider() here
            Slider(
              // 10
              min: 1,
              max: 10,
              divisions: 9,
              // 11
              label: '${_sliderVal } person',
              // 12
              value: _sliderVal.toDouble(),
              // 13
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              // 14
              activeColor: Colors.pink,
              inactiveColor: Colors.black,
            ),

          ],
        ),

      ),
    );
  }
}



