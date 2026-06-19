const express = require('express');
const path = require('path');
const app = express();
const port = 8080;

// توجيه السيرفر لاستخدام فولدر public للملفات الثابتة
app.use(express.static(path.join(__dirname, 'public')));

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
