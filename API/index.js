const express = require("express");
const dotenv = require("dotenv");
const otpRoutes = require("./routes/otpRoutes");

const app = express();
dotenv.config();
const port = process.env.PORT;

app.use(express.json());

app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.send("Server is running");
});

app.use("/auth", otpRoutes);

app.listen(port || 3000, function () {
  console.log("server is running on port 3000");
});
