import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CardContent extends StatefulWidget {
  final TextEditingController? textEditingController;
  final IconData icon;
  final String cardTitle;
  final String placeholder;
  final Future<void> Function() onPressed;

  const CardContent({
    Key? key,
    required this.textEditingController,
    required this.icon,
    required this.cardTitle,
    required this.placeholder,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  bool _isLoading = false;

  Future<void> _handleButtonPress() async {
    try{
    setState(() {
      _isLoading = true;
    });
    await widget.onPressed();
    setState(() {
      _isLoading = false;
    });
    }
    catch(e){
      setState(() {
        _isLoading = false;
      });
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon,size: 50,),
                  const SizedBox(width: 10),
                  Text(
                    widget.cardTitle,
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: widget.textEditingController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.search_normal),
            hintText: widget.placeholder,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _isLoading ? null : _handleButtonPress,
          child: _isLoading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : const Text('Pesquisar'),
        ),
      ],
    );
  }
}
