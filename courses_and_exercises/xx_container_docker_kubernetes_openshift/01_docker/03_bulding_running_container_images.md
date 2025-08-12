# Building and Running Containers

## Table of Contents

<div class="alert alert-block alert-info" style="margin-top: 20px">
    <ul>
        <li><a href="#creating-a-docker-image">Creating a Docker Image</a></li>
        <li><a href="#running-containers-from-images">Running Containers from Images</a></li>
        <li><a href="#key-docker-commands">Key Docker Commands</a></li>
    </ul>
</div>

<hr>

### Introduction

In this course, we will explore how to build Docker images and run containers from those images. Docker provides a straightforward way to containerize applications by defining their environment through a **Dockerfile**. We will also cover key Docker commands essential for working with Docker images and containers.

---

## <h2 id="creating-a-docker-image">Creating a Docker Image</h2>

The process of building a container starts with creating a **Docker image** using a `Dockerfile`. 

A **Dockerfile** is a script containing a series of instructions that define how the image should be built. 

The Docker image contains everything needed to run an application, such as the code, libraries, and dependencies.

### **Steps to Build a Docker Image:**

1. **Create a Dockerfile**: A Dockerfile is the recipe used to create a Docker image. Here is an example of a simple Dockerfile:

   ```Dockerfile
   FROM alpine:latest
   CMD echo "Hello, World"
   ```

   * **FROM** specifies the **base image**. In this case, it is the latest version of **Alpine Linux**.
   * **CMD** defines the command to run when the container starts. Here, it will print "Hello, World" to the terminal.

2. **Build the Docker Image**: The `docker build` command is used to build the Docker image from the Dockerfile.

   ```bash
   docker build -t my-app:v1 .
   ```

   * `-t my-app:v1` tags the image with the name `my-app` and version `v1`.
   * `.` refers to the current directory, where the Dockerfile is located.

   The output of this command will confirm the successful creation and tagging of the image:

   ```bash
   Successfully built <image_id>
   Successfully tagged my-app:v1
   ```

3. **Verify the Docker Image**: To confirm that the image has been created, use the `docker images` command:

   ```bash
   $ docker images
   ```

   This will list all the available Docker images, including their repository, tag, image ID, creation date, and size.

---

## <h2 id="running-containers-from-images">Running Containers from Images</h2>

Once the image is built, it can be used to create a **running container**. Containers are instances of images and can be started, stopped, and modified as needed.

### **Steps to Run a Container:**

1. **Create and Run a Container**: The `docker run` command is used to create a container from an image and run it.

   ```bash
   $ docker run my-app:v1
   ```

   This command will start the container, and since our Dockerfile includes the `CMD` command, the container will print "Hello, World" to the terminal.

2. **Check the Running Container**: After running the container, you can use the `docker ps` command to see the running containers:

   ```bash
   $ docker ps -a
   ```

   This will display the details of the running containers, including the container ID, image, and status.

---

## <h2 id="key-docker-commands">Key Docker Commands</h2>

Docker provides a range of commands that help with building, running, and managing images and containers. Here are some of the most important Docker commands:

### **1. `docker build`**

* **Purpose**: Builds a Docker image from a Dockerfile.
* **Example**:

  ```bash
  $ docker build -t my-app:v1 .
  ```

### **2. `docker images`**

* **Purpose**: Lists all available Docker images.
* **Example**:

  ```bash
  $ docker images
  ```

### **3. `docker run`**

* **Purpose**: Creates and runs a container from an image.
* **Example**:

  ```bash
  $ docker run -p 8080:80 nginx
  ```

### **4. `docker ps`**

* **Purpose**: Lists the running containers.
* **Example**:

  ```bash
  $ docker ps
  ```

### **5. `docker push`**

* **Purpose**: Pushes a Docker image to a configured registry (e.g., Docker Hub).
* **Example**:

  ```bash
  $ docker push my-app:v1
  ```

### **6. `docker pull`**

* **Purpose**: Retrieves a Docker image from a registry.
* **Example**:

  ```bash
  $ docker pull ubuntu:latest
  ```
