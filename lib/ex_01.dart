import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderLabeledDivider extends RenderBox {
  String _label;
   double _thickness;
   Color _color;
  late TextPainter _textPaiter;

  RenderLabeledDivider(
      {required String label, required double thickness, required Color color})
      : _label = label,
        _thickness = thickness,
        _color = color {
    _textPaiter = TextPainter(textDirection: TextDirection.ltr);
  }

  @override
  void performLayout() {
    _textPaiter.text = TextSpan(
      text: _label,
      style: TextStyle(
        color: _color,
      ),
    );

    _textPaiter.layout();

    final double textHeight = _textPaiter.size.height;
    size  = constraints.constrain(
      Size(
        double.infinity,
        textHeight + _thickness
      )
    );
    
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()..color = _color;
    final double yCenter = offset.dy + size.height / 2;

    context.canvas.drawLine(
      offset,
      Offset(
        offset.dx + size.width,
        yCenter
      ),
      paint
    );
    final double textStart = offset.dx + ( size.width - _textPaiter.size.width) / 2;
    _textPaiter.paint(context.canvas, Offset(textStart, yCenter - _textPaiter.size.height / 2));

  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
    config
    ..isSemanticBoundary = true
    ..label = 'Divider with text: $_label';
  }
  
  set label(String label) {
    if (_label == label) {
      _label = label;
    }
    markNeedsLayout();
  }

  String get label => _label;

  set thickness(double thickness) {
    if (_thickness == thickness) {
      _thickness = thickness;
    }
    markNeedsLayout();
  }

  double get thickness => _thickness;

  set color(Color color) {
    if (_color == color) {
      _color = color;
    }
    markNeedsPaint();
  }

  Color get color => _color;
}

class LabeledDevider extends LeafRenderObjectWidget {
  final String label;
  final double thickness;
  final Color color;

  const LabeledDevider({
    super.key,
    required this.label,
    required this.thickness,
    required this.color,
  });

  
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderLabeledDivider(
      label: label,
      thickness: thickness,
      color: color,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderLabeledDivider renderObject) {
    renderObject
    ..label = label
    ..thickness = thickness
    ..color = color;
  }

  
}
