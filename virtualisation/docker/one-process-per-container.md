### One process per container principle

This principle is promoted as a best practice in the container world, especially by Docker.
It's based on the idea that having one process per container makes the container's lifecycle
management (starting, stopping, restarting) and scaling (e.g., with Kubernetes) simpler and
more predictable.

- Simplicity and Predictability: If you only have one process in the container, it's clear
  what's running, how to configure it, and how to check its status.
- Signal Handling: Docker uses signals to stop containers (SIGTERM followed by SIGKILL).
  If only one process is running in the container, it's easier to ensure that the process
  handles the signals properly. In a multi-process container, you might miss some processes,
  leading to unclean shutdowns.
- Logging: With one process, logs come from a single source, making it easier to handle and
  forward them.
- Resource Isolation: Containers are designed to isolate resources. When you run multiple
  processes in a single container, they'll all share the same resource limits, which might
  not be ideal.

While it's a best practice, it's not a hard rule. There are valid use cases for multi-process
containers, especially when processes are closely related and need tight coupling.
