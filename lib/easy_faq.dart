import 'package:flutter/material.dart';

class EasyOrderDetails extends StatefulWidget {
  final String orderSummary; // Basic info about the order
  final String orderDetails; // Detailed information about the order
  final List<Map<String, dynamic>>? additionalDetails; // Accept icons as well as descriptions
  final TextStyle? orderSummaryTextStyle;
  final TextStyle? orderDetailsTextStyle;
  final Duration? duration;
  final Widget? expandedIcon;
  final Widget? collapsedIcon;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  EasyOrderDetails({
    Key? key,
    required this.orderSummary,
    required this.orderDetails,
    this.additionalDetails,
    this.orderSummaryTextStyle,
    this.orderDetailsTextStyle,
    this.expandedIcon,
    this.collapsedIcon,
    this.duration = const Duration(milliseconds: 100),
    this.backgroundColor,
    this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  }) : super(key: key);

  @override
  State<EasyOrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<EasyOrderDetails> with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Card(
        margin: EdgeInsets.zero,
        color: widget.backgroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
        ),
        child: AnimatedSize(
          duration: widget.duration!,
          child: Container(
            padding: widget.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.orderSummary,
                        style: widget.orderSummaryTextStyle ??
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                      ),
                    ),
                    if (isExpanded)
                      widget.expandedIcon ??
                          const Icon(
                            Icons.remove,
                            color: Color.fromRGBO(101, 101, 105, 1),
                          )
                    else
                      widget.collapsedIcon ??
                          const Icon(
                            Icons.add,
                            color: Color.fromRGBO(101, 101, 105, 1),
                          ),
                  ],
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 10),
                  Text(
                    widget.orderDetails,
                    style: widget.orderDetailsTextStyle ??
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  const SizedBox(height: 10), // Spacing between details and additional info
                  if (widget.additionalDetails != null) ...[
                    for (var detail in widget.additionalDetails!)
                      Row(
                        children: [
                          Icon(
                            detail['icon'] as IconData? ?? Icons.info,
                            color: Colors.teal,
                          ),
                          const SizedBox(width: 8), // Space between icon and text
                          Expanded(
                            child: Text(
                              detail['description'] ?? '',
                              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
