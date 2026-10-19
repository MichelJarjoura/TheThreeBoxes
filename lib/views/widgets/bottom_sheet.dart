import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharpen/controllers/flashcard_controller.dart';
import 'package:sharpen/views/widgets/primary_button.dart';
import '../../constants.dart';

class AddCardBottomSheet extends StatefulWidget {
  const AddCardBottomSheet({super.key});

  @override
  State<AddCardBottomSheet> createState() => _AddCardBottomSheetState();
}

class _AddCardBottomSheetState extends State<AddCardBottomSheet> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  void _saveCard() {
    final question = _questionController.text;
    final answer = _answerController.text;

    if (question.trim().isEmpty || answer.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in both question and answer")),
      );
      return;
    }

    final controller = Get.find<FlashCardController>();
    controller.addFlashCard(1, question, answer);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "New Card",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Question",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                TextField(
                  controller: _questionController,
                  maxLines: 5,
                  minLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "type the question you want to recall",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Answer",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                TextField(
                  controller: _answerController,
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "type the answer you want to recall",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: PrimaryButton(
                    onPressed: _saveCard,
                    text: "save card",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
