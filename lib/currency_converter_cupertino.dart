import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertionPage extends StatefulWidget {
  const CurrencyConverterCupertionPage({super.key});

  @override
  State<CurrencyConverterCupertionPage> createState() =>
      _CurrencyConverterCupertionPageState();
}

class _CurrencyConverterCupertionPageState
    extends State<CurrencyConverterCupertionPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text('Currency Calculator'),
      ),
      backgroundColor: CupertinoColors.systemGrey3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 55,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoTextField(
              controller: textEditingController,
              style: const TextStyle(color: CupertinoColors.black),
              decoration: BoxDecoration(
                border: Border.all(),
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              placeholder: 'Please enter the amount in USD',
              prefix: const Icon(CupertinoIcons.money_dollar),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
          ),
          //button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              onPressed: () {
                result = double.parse(textEditingController.text) * 81;
                setState(() {});
              },
              color: CupertinoColors.black,
              child: const Text('Convert'),
            ),
          ),
        ],
      ),
    );
  }
}
