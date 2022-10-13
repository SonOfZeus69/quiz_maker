import 'package:flutter/material.dart';
import 'package:quiz_maker/services/database.dart';
import 'package:quiz_maker/utilities/show_error_dialog.dart';
import 'package:quiz_maker/view/create_quiz.dart';

class AddQuestions extends StatefulWidget {
  final String quizId;
  const AddQuestions(this.quizId, {Key? key}) : super(key: key);

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
// Form key
  final _formKey = GlobalKey<FormState>();

  //Circularprogressindicator
  bool _isLoading = false;
  // Text Editing Controller
  late final TextEditingController _question;
  late final TextEditingController _correctanswer;
  late final TextEditingController _option2;
  late final TextEditingController _option3;
  late final TextEditingController _option4;

//init state and dispose
  @override
  void initState() {
    _question = TextEditingController();
    _correctanswer = TextEditingController();
    _option2 = TextEditingController();
    _option3 = TextEditingController();
    _option4 = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _question.dispose();
    _correctanswer.dispose();
    _option2.dispose();
    _option3.dispose();
    _option4.dispose();

    super.dispose();
  }

  DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateQuiz()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 23,
            color: Colors.black,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _question,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This field is required");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _question.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.question_mark),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Question",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _correctanswer,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This field is required");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _correctanswer.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.edit),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Correct Answer",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _option2,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This field is required");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _option2.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.edit),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Second Option",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _option3,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This field is required");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _option3.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.edit),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Third Option",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _option4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This field is required");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _option4.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.edit),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Fourth Option",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: const Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: MaterialButton(
                                height: 50,
                                color: Colors.blue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () async {
                                  try {
                                    uploadQuizData();
                                  } catch (e) {
                                    await showErrorDialog(
                                      context,
                                      e.toString(),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Add Question',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: const Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: MaterialButton(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                height: 50,
                                color: Colors.blue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () async {
                                  try {
                                    Navigator.pop(context);
                                  } catch (e) {
                                    await showErrorDialog(
                                      context,
                                      e.toString(),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  uploadQuizData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": _question.text,
        "correct answer": _correctanswer.text,
        "option2": _option2.text,
        "option3": _option3.text,
        "option4": _option4.text
      };

      print(widget.quizId);
      databaseService.addQuestionData(questionMap, widget.quizId).then((value) {
        _question.text = "";
        _correctanswer.text = "";
        _option2.text = "";
        _option3.text = "";
        _option4.text = "";
        setState(() {
          _isLoading = false;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("error is happening ");
    }
  }
}
