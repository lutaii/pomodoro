part of timer_button;

class CustomCircularProgressIndicator extends StatefulWidget {
  const CustomCircularProgressIndicator({
    super.key,
    required this.value,
    required this.backgroundColor,
    required this.valueColor,
    this.strokeWidth = 4.0,
    this.trackWidth = 4.0,
  });

  final double value;

  final Color backgroundColor;

  final Color valueColor;

  final double strokeWidth;

  final double trackWidth;

  @override
  State<CustomCircularProgressIndicator> createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  Widget _buildIndicator(
    BuildContext context,
    double headValue,
    double tailValue,
    double offsetValue,
    double rotationValue,
  ) {
    final Color trackColor = widget.backgroundColor;

    return Container(
      constraints: const BoxConstraints(
        minWidth: 36,
        minHeight: 36,
      ),
      child: CustomPaint(
        painter: CircularProgressIndicatorPainter(
          backgroundColor: trackColor,
          valueColor: widget.valueColor,
          value: widget.value,
          headValue: headValue,
          tailValue: tailValue,
          offsetValue: offsetValue,
          rotationValue: rotationValue,
          strokeWidth: widget.strokeWidth,
          progressWidth: widget.trackWidth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIndicator(context, 0.0, 0.0, 0, 0.0);
  }
}
