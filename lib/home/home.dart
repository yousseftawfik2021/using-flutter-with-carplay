import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/pizza_bg.jpeg'),
                AutoSizeText(
                  'WE\r\nKNOW\r\nPIZZA',
                  maxLines: 3,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(
              "Tap on a pizza to immediately order it!",
              style: Theme.of(context).textTheme.headline6,
            ),
            Wrap(
              alignment: WrapAlignment.end,
              children: [
                ...Data.FoodItems.map(
                  (e) => InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          contentPadding: EdgeInsets.all(16),
                          title: Text('Pizza ordered!'),
                          children: [
                            Text('You have ordered the ${e.name}! It will be ready for collection soon.'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('YUM, CAN\'T WAIT!'),
                            )
                          ],
                        ),
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 200,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/${e.asset}',
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              // alignment: Alignment.center,
                              child: Container(
                                  width: double.infinity,
                                  color: Colors.white70,
                                  child: AutoSizeText(
                                    e.name,
                                    style: Theme.of(context).textTheme.headline4,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
