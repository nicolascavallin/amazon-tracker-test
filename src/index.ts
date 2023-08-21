import express from "express";

const app = express();

app.get("/", (req, res) => {
  res.json({ text: "Hello World" });
});

app.listen(3000, async () => {
  console.log("Server started on port 3000");
});
