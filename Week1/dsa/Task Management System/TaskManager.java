public class TaskManager {
    private class Node {
        Task task;
        Node next;

        Node(Task task) {
            this.task = task;
            this.next = null;
        }
    }

    private Node head;

    public TaskManager() {
        head = null;
    }

    // Add a task to the end of the list
    public void addTask(Task task) {
        Node newNode = new Node(task);
        if (head == null) {
            head = newNode;
        } else {
            Node current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    // Search for a task by ID
    public Task searchTask(String taskId) {
        Node current = head;
        while (current != null) {
            if (current.task.getTaskId().equals(taskId)) {
                return current.task;
            }
            current = current.next;
        }
        return null; // Task not found
    }

    // Traverse and print all tasks
    public void traverseTasks() {
        Node current = head;
        if (current == null) {
            System.out.println("No tasks available.");
        } else {
            while (current != null) {
                System.out.println(current.task);
                current = current.next;
            }
        }
    }

    // Delete a task by ID
    public void deleteTask(String taskId) {
        if (head == null) {
            System.out.println("Task list is empty.");
            return;
        }

        // If the task to be deleted is the head
        if (head.task.getTaskId().equals(taskId)) {
            head = head.next;
            return;
        }

        // Find the task to be deleted
        Node current = head;
        while (current.next != null && !current.next.task.getTaskId().equals(taskId)) {
            current = current.next;
        }

        if (current.next == null) {
            System.out.println("Task with ID " + taskId + " not found.");
            return;
        }

        // Skip the node to delete it
        current.next = current.next.next;
    }
}
