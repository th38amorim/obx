import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavingInProgressOverlay extends StatelessWidget {
  final bool isEnabled;
  final String message;

  const SavingInProgressOverlay({
    Key? key,
    required this.isEnabled,
    this.message = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isEnabled ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isEnabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}