import React, { useEffect, useState } from "react";

const initialForm = {
  title: "",
  description: "",
  priority: "Medium"
};

function App() {
  const [tickets, setTickets] = useState([]);
  const [form, setForm] = useState(initialForm);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [submitting, setSubmitting] = useState(false);

  const loadTickets = async () => {
    try {
      setLoading(true);
      const response = await fetch("/api/tickets");
      if (!response.ok) throw new Error("Failed to fetch tickets");
      const data = await response.json();
      setTickets(data);
      setError("");
    } catch (err) {
      setError("Could not load tickets. Check backend connectivity.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadTickets();
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSubmitting(true);
    setError("");

    try {
      const response = await fetch("/api/tickets", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(form)
      });

      if (!response.ok) {
        throw new Error("Failed to create ticket");
      }

      setForm(initialForm);
      await loadTickets();
    } catch (err) {
      setError("Could not create ticket. Please try again.");
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="app-shell">
      <header className="hero">
        <div>
          <p className="eyebrow">Support Dashboard</p>
          <h1>AI IT Support Assistant</h1>
          <p className="subtitle">
            A starter full-stack app for managing IT support tickets on Azure.
          </p>
        </div>
      </header>

      <main className="grid">
        <section className="card">
          <h2>Create Ticket</h2>
          <form onSubmit={handleSubmit} className="ticket-form">
            <label>
              Title
              <input
                type="text"
                name="title"
                value={form.title}
                onChange={handleChange}
                placeholder="Laptop not starting"
                required
              />
            </label>

            <label>
              Description
              <textarea
                name="description"
                value={form.description}
                onChange={handleChange}
                placeholder="Describe the issue..."
                rows="5"
                required
              />
            </label>

            <label>
              Priority
              <select name="priority" value={form.priority} onChange={handleChange}>
                <option value="Low">Low</option>
                <option value="Medium">Medium</option>
                <option value="High">High</option>
              </select>
            </label>

            <button type="submit" disabled={submitting}>
              {submitting ? "Submitting..." : "Create Ticket"}
            </button>
          </form>
        </section>

        <section className="card">
          <div className="section-head">
            <h2>Open Tickets</h2>
            <button className="secondary" onClick={loadTickets}>Refresh</button>
          </div>

          {error && <p className="error">{error}</p>}
          {loading ? (
            <p>Loading tickets...</p>
          ) : tickets.length === 0 ? (
            <p>No tickets found.</p>
          ) : (
            <div className="ticket-list">
              {tickets.map((ticket) => (
                <article key={ticket.id} className="ticket-item">
                  <div className="ticket-top">
                    <h3>{ticket.title}</h3>
                    <span className={`badge badge-${ticket.priority.toLowerCase()}`}>
                      {ticket.priority}
                    </span>
                  </div>
                  <p>{ticket.description}</p>
                  <div className="ticket-meta">
                    <span>Status: {ticket.status}</span>
                    <span>ID: {ticket.id}</span>
                  </div>
                </article>
              ))}
            </div>
          )}
        </section>
      </main>
    </div>
  );
}

export default App;
