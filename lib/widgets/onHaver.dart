import 'package:flutter/material.dart';

class OnHoverText extends StatefulWidget {
  final Widget child;

  const OnHoverText({Key key, this.child}) : super(key: key);


  @override
  _OnHoverTextState createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool isHoverd = false;
  @override
  Widget build(BuildContext context) {
    final hoverdTransform = Matrix4.identity()..scale(1.1);
    
    final trasform = isHoverd ?hoverdTransform:Matrix4.identity();
    return MouseRegion(
      onEnter: (event)=> onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: trasform,
        child: widget.child,
        
        
      ),
    );
  
  }
  void onEntered(bool isHoverd)=>
    setState(() {
      this.isHoverd = isHoverd;
    });

  
}
