from flask import Flask, render_template, request, redirect, flash
import json
import os

app = Flask(__name__)
app.secret_key = "taskflow-secret-key"

DATA_FOLDER = "data"
DATA_FILE = os.path.join(DATA_FOLDER, "tasks.json")

os.makedirs(DATA_FOLDER, exist_ok=True)

if not os.path.exists(DATA_FILE):
    with open(DATA_FILE, "w") as f:
        json.dump([], f)


def load_tasks():
    with open(DATA_FILE, "r") as f:
        return json.load(f)


def save_tasks(tasks):
    with open(DATA_FILE, "w") as f:
        json.dump(tasks, f, indent=4)


@app.route("/")
def index():
    tasks = load_tasks()

    total_tasks = len(tasks)
    completed_tasks = len([t for t in tasks if t["completed"]])
    pending_tasks = total_tasks - completed_tasks

    progress = (
        int((completed_tasks / total_tasks) * 100)
        if total_tasks > 0
        else 0
    )

    return render_template(
        "index.html",
        tasks=tasks,
        total_tasks=total_tasks,
        completed_tasks=completed_tasks,
        pending_tasks=pending_tasks,
        progress=progress,
    )


@app.route("/add", methods=["POST"])
def add_task():
    title = request.form.get("task", "").strip()

    if not title:
        flash("Task cannot be empty.", "warning")
        return redirect("/")

    tasks = load_tasks()

    new_task = {
        "id": len(tasks) + 1,
        "title": title,
        "completed": False
    }

    tasks.append(new_task)
    save_tasks(tasks)

    flash("Task added successfully.", "success")

    return redirect("/")


@app.route("/complete/<int:task_id>")
def complete_task(task_id):
    tasks = load_tasks()

    for task in tasks:
        if task["id"] == task_id:
            task["completed"] = True
            break

    save_tasks(tasks)

    flash("Task marked as completed.", "success")

    return redirect("/")


@app.route("/delete/<int:task_id>")
def delete_task(task_id):
    tasks = load_tasks()

    tasks = [task for task in tasks if task["id"] != task_id]

    for index, task in enumerate(tasks, start=1):
        task["id"] = index

    save_tasks(tasks)

    flash("Task deleted successfully.", "danger")

    return redirect("/")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)