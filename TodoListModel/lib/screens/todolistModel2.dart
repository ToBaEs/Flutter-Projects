import 'package:flutter/material.dart';
import 'package:project/models/todo.dart';
import 'package:project/screens/tododetail.dart';
import 'package:project/utils/mydrawer.dart';

class TodoListModel extends StatefulWidget {
  const TodoListModel({super.key});

  @override
  State<TodoListModel> createState() => _TodoListModelState();
}

class _TodoListModelState extends State<TodoListModel> {
  bool isEdit = false;
  List<Todo> todoListModel = [];
  bool isObsecure = true;
  final formKey = GlobalKey<FormState>();
  late String title;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late Todo editTodo;

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoListModel"),
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            isEdit ? updateTodo(editTodo) : addTodo();
          },
          child: Icon(isEdit ? Icons.save : Icons.add)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: titleController,
                      obscureText: isObsecure,
                      decoration: InputDecoration(
                          labelText: "Başlık",
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                            child: Icon(isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )),
                      autovalidateMode: autovalidateMode,
                      onSaved: (newValue) {
                        setState(() {
                          title = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Boş geçmeyiniz";
                        } else {}
                        return null;
                      },
                    ),
                  ),
                )),
            Expanded(
              flex: 3,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                itemCount: todoListModel.length,
                itemBuilder: (context, index) {
                  var element = todoListModel[index];
                  return ListTile(
                    tileColor: isEdit && editTodo == element
                        ? element.isComplated
                            ? Colors.red[300]
                            : Colors.green[300]
                        : element.isComplated
                            ? Colors.red[100]
                            : Colors.green[100],
                    leading: Checkbox(
                        onChanged: (newValue) {
                          setState(() {
                            element.isComplated = newValue!;
                          });
                        },
                        value: element.isComplated),
                    title: Text(
                      element.title,
                      style: TextStyle(
                          decoration: element.isComplated
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    subtitle: const Text("Görevi tamamlandıysa işaretle..."),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                isEdit = true;
                                titleController.text = element.title;
                                editTodo = element;
                              });
                            },
                            child: Icon(Icons.edit,
                                color: isEdit && editTodo == element
                                    ? Colors.blue
                                    : Colors.black54)),
                        InkWell(
                            onTap: () {
                              setState(() {
                                element.isStar = !element.isStar;
                              });
                            },
                            child: Icon(
                              Icons.star,
                              color: element.isStar
                                  ? Colors.amber
                                  : Colors.black54,
                            )),
                        InkWell(
                            onTap: () {
                              setState(() {
                                todoListModel.remove(element);
                              });
                            },
                            child: const Icon(Icons.delete)),
                        InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TodoDetail(todo: element),
                                    ));
                              });
                            },
                            child: const Icon(Icons.more_vert)),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTodo() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Todo todo = Todo(
          id: todoListModel.isEmpty ? 1 : todoListModel.last.id + 1,
          title: title);

      setState(() {
        todoListModel.add(todo);
      });

      getSuccessAlert("Tebrikler");
      formKey.currentState!.reset();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  Future<void> getSuccessAlert(String mesaj) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(mesaj),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 120,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  updateTodo(Todo editTodo) {
    debugPrint(editTodo.title);
    todoListModel
        .map((e) => {
              if (e == editTodo)
                {
                  setState(
                    () {
                      e.title = titleController.text;
                      isEdit = false;
                      titleController.text = "";

                      getSuccessAlert("Değiştirildi");
                    },
                  )
                }
            })
        .toList();
  }
}
