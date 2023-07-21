import 'package:flutter/material.dart';
import 'package:weather/main.dart';
import 'package:weather/view/view_num.dart';
import 'package:weather/widget/weather.dart';
class Bland extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Buttons',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('地块主页'),
        actions: [
          TextButton(
            onPressed: () {
              // Text Button action
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Weather(),
                ),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(16.0), // Rounded corners
              ),
            ),
            child: Text('修改天气'),
          ),
        ],


      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Button 1 action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataList(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple, // Button background color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Rounded corners
                    ),
                  ),
                  child: Text('地块1'),
                ),
                SizedBox(width: 20), // Add some space between the buttons
                ElevatedButton(
                  onPressed: () {
                    // Button 2 action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Button background color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Rounded corners
                    ),
                  ),
                  child: Text('地块2'),
                ),
              ],
            ),
            SizedBox(height: 20), // Add some space between the rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Button 3 action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // Button background color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Rounded corners
                    ),
                  ),
                  child: Text('地块3'),
                ),
                SizedBox(width: 20), // Add some space between the buttons
                ElevatedButton(
                  onPressed: () {
                    // Button 4 action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink, // Button background color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Rounded corners
                    ),
                  ),
                  child: Text('地块4'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
