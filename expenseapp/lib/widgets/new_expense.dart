import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key, required this.onAdd}) : super(key: key);

  final void Function(Expense expense) onAdd;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // Controller
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.education;

  Future<void> _openDataPicker() async {
    //DatePicker açmak..
    //DatePicker'dan gelen değerleri Text olarak yazdırmak
    // built-in function

    DateTime now = DateTime.now(); //bugünün tarihini alır.
    DateTime oneYearAgo = DateTime(
        now.year - 1, now.month, now.day); //bir sene öncesi bugünün tarihini

    // 1 yıl öncesi ve bugün arasında kısıtlama yaptık
    // then => async bir işlemin geri dönüş sağladığı anda çalışacak bloğunun tanımlar.
    // showDatePicker(
    //         context: context,
    //         initialDate: now,
    //         firstDate: oneYearAgo,
    //         lastDate: now)
    //     .then((value) {
    //   print(value);
    // });

    // await => ilgili async işlemini bekle
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null ? now : _selectedDate,
        firstDate: oneYearAgo,
        lastDate: now);
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _addNewExpense() {
    final amount = double.tryParse(_amountController.text);
    if (amount == null ||
        amount < 0 ||
        _nameController.text.isEmpty ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Validation Error"),
              content: Text("Please fill all blank areas"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text("Okey")),
              ],
            );
          });
    } else {
      //valid bir değer
      //listeye ekleme yapılması gereken nokta
      Expense expense = Expense(
          name: _nameController.text,
          price: amount,
          date: _selectedDate!,
          category: _selectedCategory);
      widget.onAdd(expense);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Expense Name"),
            ),
          ),

          SizedBox(width: 30),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: "₺",
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          _openDataPicker();
                        },
                        icon: const Icon(Icons.calendar_month)),
                    Text(_selectedDate == null
                        ? "Tarih Seçiniz"
                        : DateFormat.yMd().format(_selectedDate!)),
                  ],
                ),
              ),
            ],
          ), // seçilen tarihi formatlayarak yazdırmak
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name.toString()));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) _selectedCategory = value;
                    });
                  })
            ],
          ),
          Spacer(),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Vazgeç")),
              SizedBox(width: 30),
              ElevatedButton(
                  onPressed: () {
                    _addNewExpense();
                  },
                  child: Text("Kaydet")),
            ],
          ),
        ],
      ),
    );
  }
}
