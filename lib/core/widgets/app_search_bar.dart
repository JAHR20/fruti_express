import 'dart:async';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final Duration debounceDuration;
  final bool readOnly;
  final VoidCallback? onTap;
  
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final EdgeInsetsGeometry padding;

  const AppSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.debounceDuration = const Duration(milliseconds: 500),
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (widget.onChanged == null) return;

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(widget.debounceDuration, () {
      widget.onChanged!(query);
    });
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: widget.padding,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.antiAlias,
        color: colorScheme.surfaceContainerHighest,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceContainerHighest,
        child: TextField(
          controller: _controller,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          onChanged: _onSearchChanged,
          style: TextStyle(color: colorScheme.onSurface),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
            prefixIcon: Icon(Icons.search,size: 28, color: widget.readOnly ? colorScheme.secondaryContainer : colorScheme.primary),
            suffixIcon: _controller.text.isNotEmpty && !widget.readOnly
                ? IconButton(
                    icon: Icon(Icons.clear, color: colorScheme.onSurfaceVariant),
                    onPressed: () {
                      _controller.clear();
                      _onSearchChanged('');
                    },
                  )
                : null, // Si está vacío o es readOnly, no mostramos nada
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          ),
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
        ),
      ),
    );
  }
}