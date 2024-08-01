public class Main {
    public static void main(String[] args) {
        TaskManager manager = new TaskManager();

        // Adding tasks
        manager.addTask(new Task("T001", "Design Homepage", "In Progress"));
        manager.addTask(new Task("T002", "Implement Login", "Completed"));
        manager.addTask(new Task("T003", "Write Documentation", "Pending"));

        // Traversing tasks
        System.out.println("All Tasks:");
        manager.traverseTasks();

        // Searching for a task
        Task foundTask = manager.searchTask("T002");
        System.out.println("\nSearch Result:");
        System.out.println(foundTask != null ? foundTask : "Task not found");

        // Deleting a task
        manager.deleteTask("T001");
        System.out.println("\nTasks after Deletion:");
        manager.traverseTasks();
    }
}
