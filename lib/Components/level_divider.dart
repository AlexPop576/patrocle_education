import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LevelDivider extends StatefulWidget {
  String? continent;
  LevelDivider({super.key, this.continent});

  @override
  // ignore: no_logic_in_create_state
  State<LevelDivider> createState() => _LevelDividerState(continent: continent);
}

class _LevelDividerState extends State<LevelDivider> {
  String? continent;
  _LevelDividerState({this.continent});
  
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(continent.toString(), style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold, fontSize: 40),),
                        ),
                        Expanded(
                          child: Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ]
                ),
            );
  }
}
