import 'package:flutter/material.dart';

class QuestionTile extends StatefulWidget {
  final Map<String, dynamic> question;
  final void Function(Map<String, dynamic> updatedQuestion)? onChanged;
  final int index;
  QuestionTile({
    required this.question,
    required this.index,
    this.onChanged,
  });

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  late TextEditingController _questionController;
  late List<TextEditingController> _optionControllers;

  @override
  void initState() {
    super.initState();
    _questionController =
        TextEditingController(text: widget.question['question']);
    _optionControllers = List<TextEditingController>.generate(
      widget.question['options'].length,
      (index) => TextEditingController(text: widget.question['options'][index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _questionController,
          decoration: InputDecoration(
            labelText: 'Question',
          ),
          onChanged: (value) {
            widget.question['question'] = value;
            if (widget.onChanged != null) {
              widget.onChanged!(widget.question);
            }
          },
        ),
        SizedBox(height: 16.0),
        ...List.generate(
          _optionControllers.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              controller: _optionControllers[index],
              decoration: InputDecoration(
                labelText: 'Option ${index + 1}',
              ),
              onChanged: (value) {
                widget.question['options'][index] = value;
                if (widget.onChanged != null) {
                  widget.onChanged!(widget.question);
                }
              },
            ),
          ),
        ),
        DropdownButtonFormField<int>(
          value: widget.question['correctOption'],
          onChanged: (value) {
            setState(() {
              widget.question['correctOption'] = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(widget.question);
            }
          },
          items: List.generate(
            _optionControllers.length,
            (index) => DropdownMenuItem<int>(
              value: index,
              child: Text('Option ${index + 1}'),
            ),
          ),
          decoration: InputDecoration(
            labelText: 'Correct Option',
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _questionController.dispose();
    _optionControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
}
