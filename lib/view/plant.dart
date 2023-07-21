import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:weather/view/plant_num.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Plant extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Plant> {
  String selectedPlant = 'tomato';
int newsize = 0;
  void updatePlant(String newPlant) {
    setState(() {
      selectedPlant = newPlant;

    });
  }

  void saveWeatherToBackend() async {
    // 将selectedPlant的值保存到后端接口
    var url = Uri.parse('http://192.168.33.212:3007/post.php'); // 后端接口地址
    final response = await http.post(
      url,
      body: {
        'crop': selectedPlant,
        'botany':'1',

      },
    );
    if (response.statusCode == 200) {
      print('植物数据保存成功');
      print(response.body);
      Fluttertoast.showToast(msg: response.body);
    } else {
      print('植物数据保存失败，请重试');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('修改植物'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Plantnum(
              initialValue: selectedPlant,
              onChanged: updatePlant,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveWeatherToBackend,
              child: Text('保存植物数据到后端'),
            ),
          ],
        ),
      ),
    );
  }
}
