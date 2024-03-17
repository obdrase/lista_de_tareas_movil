import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  ListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {

      }
    );
  }
}