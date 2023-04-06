import 'package:flutter/material.dart';

import '../state/base_state.dart';

class BaseView extends StatefulWidget {
  final Widget view;
  const BaseView({super.key, required this.view});
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends BaseState<BaseView> {
  @override
  Widget build(BuildContext context) {
    return (widget.view);
  }
}
