// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // Um array de structs 'Todo'
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 formas de inicializar um struct
        // chamando como uma função
        todos.push(Todo(_text, false));

        // mapeamento chave-valor
        todos.push(Todo({text: _text, completed: false}));

        // inicializando um struct vazio e então atualizando
        Todo memory todo;
        todo.text = _text;
        // todo.completed inicializado com valor default false

        todos.push(todo);
    }

    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // atualiza text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // atualiza completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}