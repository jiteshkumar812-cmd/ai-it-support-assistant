const express = require("express");
const cors = require("cors");

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

let tickets = [
  {
    id: 1,
    title: "Email issue",
    description: "Cannot send emails from Outlook.",
    priority: "High",
    status: "Open",
    createdAt: new Date().toISOString()
  },
  {
    id: 2,
    title: "VPN access",
    description: "Need VPN access for remote work.",
    priority: "Medium",
    status: "In Progress",
    createdAt: new Date().toISOString()
  }
];

app.get("/", (req, res) => {
  res.json({ message: "AI IT Support Assistant backend is running" });
});

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.get("/api/tickets", (req, res) => {
  res.json(tickets);
});

app.post("/api/tickets", (req, res) => {
  const { title, description, priority } = req.body;

  if (!title || !description || !priority) {
    return res.status(400).json({ message: "title, description, and priority are required" });
  }

  const ticket = {
    id: tickets.length ? tickets[tickets.length - 1].id + 1 : 1,
    title,
    description,
    priority,
    status: "Open",
    createdAt: new Date().toISOString()
  };

  tickets.unshift(ticket);
  res.status(201).json(ticket);
});

app.listen(port, () => {
  console.log(`Backend listening on port ${port}`);
});
