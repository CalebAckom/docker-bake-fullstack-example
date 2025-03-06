import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
    const [tasks, setTasks] = useState([]);
    const [newTask, setNewTask] = useState('');
    const [errorMessage, setErrorMessage] = useState('');

    useEffect(() => {
        axios.get('http://localhost:8000/tasks')
            .then((res) =>
                setTasks(res.data));
    }, []);

    const addTask = () => {
        if (newTask.trim() === '') {
            setErrorMessage('Task cannot be empty');
            return;
        }

        setErrorMessage('');

        axios.post('http://localhost:8000/tasks',
            { text: newTask })
            .then((res) => {
                setTasks([...tasks, res.data]);
                setNewTask('');
            });
    };

    return (
        <div className="app-container">
            <h1>Task List</h1>
            <ul className="task-list">
                {tasks.map((task) => (
                    <li key={task.id}>{task.text}</li>
                ))}
            </ul>
            <div className="input-container">
                <input
                    type="text"
                    value={newTask}
                    onChange={(e) => setNewTask(e.target.value)}
                    placeholder="Enter new task"
                />
                <button onClick={addTask}>Add Task</button>
            </div>
            {errorMessage && <div className="error-message">{errorMessage}</div>}
        </div>
    );
}

export default App;
