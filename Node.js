const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.post('/submit', (req, res) => {
  const jsonData = req.body.jsonData;
  res.json(jsonData);
});

  

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
