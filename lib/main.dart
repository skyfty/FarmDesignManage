import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:weather/view/view_num.dart';
import 'package:weather/view/land.dart';
import 'package:weather/widget/weather.dart';
void main() {
  runApp(MaterialApp(
    home: Bland(),
  ));
}

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController IdController = TextEditingController();
  final TextEditingController XController = TextEditingController();
  final TextEditingController YController = TextEditingController();
  final TextEditingController ZController = TextEditingController();
  final TextEditingController CropController = TextEditingController();

  void register(BuildContext context) async {
    final String wid = IdController.text;
    final String wx = XController.text;
    final String wy = YController.text;
    final String wz = ZController.text;
    final String wcrop = CropController.text;

    var url = Uri.parse('http://192.168.33.212:3007/post.php');
    final response = await http.post(
      url,
      body: {
        'id': wid,
        'x': wx,
        'y': wy,
        'z': wz,
        'crop': wcrop,
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: response.body);
      print('请求成功');
      print(response.body);
    } else {
      Fluttertoast.showToast( msg: response.body);
      print('请求失败，请重试');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: Text('设置')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: IdController,
                  decoration: InputDecoration(labelText: '修改编号'),
                ),
                TextField(
                  controller: XController,
                  decoration: InputDecoration(labelText: 'X坐标轴'),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: YController,
                  decoration: InputDecoration(labelText: 'Y坐标轴'),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: ZController,
                  decoration: InputDecoration(labelText: 'Z坐标轴'),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: CropController,
                  decoration: InputDecoration(labelText: '植物'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => register(context),
                  child: Text('修改'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

