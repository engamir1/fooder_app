import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooder_app/theme/app_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mag2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
// 1
                color: Colors.black.withOpacity(0.6),
// 2
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Recipe Trends',
                    style: FooderTheme.darkTextTheme.bodyLarge,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        Chip(
                          label: Text('Healthy',
                              style: FooderTheme.darkTextTheme.bodySmall),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            log('delete');
                          },
                           
                        ),
                        Chip(
                          label: Text('Vegan',
                              style: FooderTheme.darkTextTheme.bodySmall),
                          backgroundColor: Colors.black.withOpacity(0.1),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Center(
                              child: Text(
                                "12",
                                style: FooderTheme.darkTextTheme.labelSmall,
                              ),
                            ),
                          ),
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () {
                            log('delete');
                          },
                        ),
                        Chip(
                          label: Text('Carrots',
                              style: FooderTheme.darkTextTheme.bodySmall),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                        Chip(
                          label: Text('Carrots',
                              style: FooderTheme.darkTextTheme.bodySmall),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
