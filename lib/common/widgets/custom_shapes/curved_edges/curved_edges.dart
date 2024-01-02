import 'package:flutter/material.dart';
import 'package:zenshop/common/widgets/custom_shapes/curved_edges/widgets/curved_edges_widet.dart';


class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
