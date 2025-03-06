const express = require('express');
const cors = require('cors');
const app = express();
const port = 8000;

app.use(cors());
app.use(express.json());

let tasks = [
    { id: 1, text: 'Learn Docker Bake' },
    { id: 2, text: 'Write Medium Article' },
];

app.get('/tasks', (req, res) => {
    res.json(tasks);
});

app.post('/tasks', (req, res) => {
    const newTask = {
        id: tasks.length + 1,
        text: req.body.text,
    };
    tasks.push(newTask);
    res.json(newTask);
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
