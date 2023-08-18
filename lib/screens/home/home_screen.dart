import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_bloc_app/bloc/todo_bloc.dart';
import 'package:note_bloc_app/constant/app_constants.dart';
import 'package:note_bloc_app/screens/custom/custom_textfield.dart';
import 'package:note_bloc_app/ui_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController id = TextEditingController();

  List<Map<String, dynamic>> todos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(getIntialDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        shadowColor: AppColors.PinkColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.PinkColor,
        title: Text(
          AppConstants.app_name,
          style: TextStyle(
            fontFamily: "montbold",
            fontSize: 25,
          ),
        ),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todoData.length,
            itemBuilder: (context, index) {
              var currTodo = state.todoData[index];
              return Card(
                elevation: 20,
                shadowColor: Colors.white,
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: AppColors.PinkColor,
                      ),
                      child: Checkbox(
                        activeColor: AppColors.PinkColor,
                        checkColor: AppColors.WhiteColor,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    title: Text(
                      "${currTodo["title"]}",
                      style: TextStyle(
                          color: AppColors.blackColor, fontFamily: "montbold"),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        BlocProvider.of<TodoBloc>(context)
                            .add(DeleteTodoEvent(id: currTodo["todo_id"]));
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wSpacer(
            mWeight: 25.0,
          ),
          SizedBox(
            width: media.size.width * .7,
            child: CustomTextfield(
              TextFieldController: titleController,
              hintTxt: "Enter Your Todo",
              fColor: Colors.white10,
              validate: (value) {},
            ),
          ),
          wSpacer(),
          InkWell(
            onTap: () {
              BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(
                  title: titleController.text, id: id.text.length));
              titleController.text = "";
            },
            child: Container(
              height: media.size.height * .07,
              width: media.size.width * .2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.PinkColor,
              ),
              child: Icon(
                Icons.add,
                color: AppColors.WhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
