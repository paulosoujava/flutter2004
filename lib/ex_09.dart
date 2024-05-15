//Decorator
import 'package:flutter/material.dart';

abstract class TextComponent {
  Widget build( BuildContext context );
}
abstract class TextDecorator extends TextComponent {
  final TextComponent decoratedText;
  TextDecorator(this.decoratedText);
}

class SimpleText extends TextComponent {
  final String text;

  SimpleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

 class BorderText extends TextDecorator{

   BorderText(super.decoratedText);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
      ),
      child: decoratedText.build(context)
    );
  }
 }

 class PaddingText extends TextDecorator{
   PaddingText(super.decoratedText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: decoratedText.build(context),
    );
  }
 }


 class Decorator extends StatelessWidget {
   const Decorator({super.key});

   @override
   Widget build(BuildContext context) {
     TextComponent decoratedText = SimpleText('Hello');
     decoratedText = BorderText(decoratedText);
     decoratedText = PaddingText(decoratedText);

     return const Placeholder();
   }
 }
