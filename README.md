Creates an interesting live tiles effect when tapping its child widget.
  
## Getting Started  
  
To use this plugin, add `livetiles` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
  
### Example  
  
```dart  
import 'package:flutter/material.dart';  
import 'package:splash_tap/splash_tap.dart';  
  
void main() => runApp(MyApp());  
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Center(
        child: Row(
          children: [
            FlipView(
              back: Container(
                height: 50,
                width: 50,
                child: Icon(Icons.add),
                color: Colors.blue,
              ),
              front: Container(
                height: 50,
                width: 50,
                color: Colors.green,
                child: Icon(Icons.minimize),
              ),
              flipTopToBottom: true,
              milliseconds: 400,
            ),
            FlipView(
              back: Container(
                height: 50,
                width: 50,
                child: Icon(Icons.alarm),
                color: Colors.blue,
              ),
              front: Container(
                height: 50,
                width: 50,
                color: Colors.green,
                child: Icon(Icons.alarm_off),
              ),
              flipTopToBottom: true,
              milliseconds: 400,
            )
          ],
        ),
      );
    }
}
```