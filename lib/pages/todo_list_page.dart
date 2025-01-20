import 'package:flutter/material.dart';

/// Página de lista de tarefas (Todo List).
/// Este widget permite ao usuário adicionar, visualizar e remover tarefas de uma lista interativa.
class TodoListPage extends StatefulWidget {
  /// Construtor padrão.
  TodoListPage({super.key});

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  /// Controlador para o campo de texto onde as tarefas são adicionadas.
  final TextEditingController todoController = TextEditingController();

  /// Lista que armazena as tarefas adicionadas pelo usuário.
  List<String> todos = [];

  /// Adiciona uma nova tarefa à lista de tarefas.
  ///
  /// A tarefa será adicionada apenas se o campo de texto não estiver vazio.
  void addTodo() {
    String text = todoController.text;
    if (text.isNotEmpty) {
      setState(() { // Atualiza a interface do usuário.
        todos.add(text); // Adiciona a tarefa à lista.
      });
      todoController.clear(); // Limpa o campo de texto após a adição.
    }
  }

  /// Remove todas as tarefas da lista.
  void deleteAllTodo() {
    setState(() { // Atualiza a interface do usuário.
      todos.clear(); // Remove todas as tarefas da lista.
    });
  }

  /// Remove a tarefa no índice especificado.
  ///
  /// [index] Índice da tarefa a ser removida.
  void removeTodoAt(int index) {
    setState(() { // Atualiza a interface do usuário.
      todos.removeAt(index);// Remove a tarefa da lista.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(// Tela principal.
      body: Padding(// Conteúdo da tela.
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Título principal da página.
            const Text(
              'Lista de Tarefas',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Campo de entrada e botão para adicionar tarefas.
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adicione uma tarefa',
                      hintText: 'Ex: Estudar Flutter',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    fixedSize: const Size(80, 50),
                  ),
                  onPressed: addTodo,
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Lista de tarefas.
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,// Permite que a lista ocupe todo o espaço disponível.
                itemCount: todos.length,// Número de itens na lista.
                itemBuilder: (context, index) {// Cria os itens da lista.
                  return ListTile(// Item da lista.
                    title: Text(todos[index]),
                    trailing: IconButton(// Botão para remover a tarefa.
                      icon: const Icon(Icons.delete),// Ícone do botão.
                      onPressed: () => removeTodoAt(index),// Ação ao pressionar o botão.
                    ),
                    leading: const Icon(Icons.check_box_outline_blank),//
                    onTap: () {// Ação ao clicar no item.
                      print('Tarefa selecionada: ${todos[index]}');
                    },// Mensagem de depuração.
                  );
                },// Lista de itens.
              ),
            ),

            const SizedBox(height: 16),

            // Mensagem e botão para remover todas as tarefas.
            Row(// Linha para os botões.
              children: [// Botões.
                Expanded(// Permite que o botão ocupe todo o espaço disponível.
                  child: Text(// Mensagem de depuração.
                    todos.isEmpty// Verifica se a lista está vazia.
                        ? 'Nenhuma tarefa pendente'// Mensagem caso esteja vazia.
                        : 'Você possui ${todos.length} tarefas pendentes',
                  ),
                ),
                ElevatedButton(// Botão para remover todas as tarefas.
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(80, 50),
                  ),
                  onPressed: deleteAllTodo,
                  child: const Icon(Icons.delete_forever),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
