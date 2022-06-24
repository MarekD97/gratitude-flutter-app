import 'package:app/themes.dart';
import 'package:flutter/material.dart';

class EntryCardWidget extends StatelessWidget {
  const EntryCardWidget(
      {Key? key,
      this.onFavoritePressed,
      this.onReportPressed,
      this.text =
          "Jestem wdzięczny za mile spędzony czas z siostrą podczas przygotowywania obiadu"})
      : super(key: key);

  final VoidCallback? onFavoritePressed;
  final VoidCallback? onReportPressed;
  final String text;

  Color randomColor() {
    int randomNumber = (text.codeUnitAt(0)+text.codeUnitAt(1))%3;
    switch (randomNumber) {
      case 0:
        return GratitudeAppTheme.pastelRed;
      case 1:
        return GratitudeAppTheme.pastelGreen;
      default:
        return GratitudeAppTheme.pastelOrange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 224.0,
      decoration: BoxDecoration(
        color: randomColor(),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(fontSize: 20.0),
              )),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: onFavoritePressed,
                    icon: Icon(Icons.favorite,
                        color: Colors.black.withOpacity(0.54))),
                IconButton(
                    onPressed: onReportPressed,
                    icon: Icon(Icons.report,
                        color: Colors.black.withOpacity(0.54))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
