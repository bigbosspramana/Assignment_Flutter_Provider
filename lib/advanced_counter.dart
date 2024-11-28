import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global_counter/global_state.dart';

class AdvancedCounter extends StatelessWidget {
  void _showEditDialog(BuildContext context, int index, CounterData counterData) {
    final globalState = Provider.of<GlobalState>(context, listen: false);
    final labelController = TextEditingController(text: counterData.label);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Penghitung'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TextField untuk mengubah label
            TextField(
              controller: labelController,
              decoration: InputDecoration(labelText: 'Label'),
            ),
            SizedBox(height: 10),
            Text('Pilih Warna:'),
            Wrap(
              spacing: 8,
              children: Colors.primaries.map((color) {
                return GestureDetector(
                  onTap: () {
                    globalState.updateCardAndLabelColor(index, color); // Mengubah warna
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(
                        color: counterData.color == color
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        actions: [
          // Tombol untuk menyimpan label baru
          TextButton(
            onPressed: () {
              globalState.updateLabel(index, labelController.text); // Menyimpan label
              Navigator.of(context).pop();
            },
            child: Text('Simpan Label'),
          ),
          // Tombol untuk batal
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Batal'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);

    return ReorderableListView.builder(
      itemCount: globalState.counters.length,
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex -= 1; // Menangani perubahan posisi item
        final item = globalState.counters.removeAt(oldIndex);
        globalState.counters.insert(newIndex, item);
        globalState.notifyListeners(); // Memberitahu perubahan
      },
      itemBuilder: (context, index) {
        final counterData = globalState.counters[index];

        return Card(
          key: ValueKey(index), // Kunci untuk drag-and-drop
          color: counterData.color,
          child: ListTile(
            title: GestureDetector(
              onTap: () => _showEditDialog(context, index, counterData), // Menampilkan dialog
              child: Text(
                counterData.label,
                style: TextStyle(
                  fontSize: 20,
                  color: counterData.color.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
            subtitle: Text('Nilai: ${counterData.value}', style: TextStyle(fontSize: 16)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tombol untuk mengedit warna dan label
                IconButton(
                  icon: Icon(Icons.edit),
                  tooltip: 'Edit Warna dan Label',
                  onPressed: () => _showEditDialog(context, index, counterData),
                ),
                // Tombol untuk menambah nilai
                IconButton(
                  icon: Icon(Icons.add),
                  tooltip: 'Tambah Nilai',
                  onPressed: () => globalState.incrementCounter(index),
                ),
                // Tombol untuk mengurangi nilai
                IconButton(
                  icon: Icon(Icons.remove),
                  tooltip: 'Kurangi Nilai',
                  onPressed: () => globalState.decrementCounter(index),
                ),
                // Tombol untuk menghapus penghitung
                IconButton(
                  icon: Icon(Icons.delete),
                  tooltip: 'Hapus Penghitung',
                  onPressed: () => globalState.removeCounter(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
