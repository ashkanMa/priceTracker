import 'package:price_tracker/core/helper/exporties.dart';

class UiExceptionWidget extends StatelessWidget {
  const UiExceptionWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber[200]),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          )),
        ),
      ),
    );
  }
}
