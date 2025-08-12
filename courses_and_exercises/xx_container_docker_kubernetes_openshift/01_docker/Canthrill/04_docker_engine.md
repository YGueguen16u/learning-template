## 1. **Checking Current Containers and Images**

Before running it, let’s confirm that our system is clean—no containers or images yet.

* Run:

```
docker ps
```

- This lists running containers. The empty output means none are running.

```
GUEGUEN@mac tech-learning-template % docker ps
CONTAINER ID   IMAGE                    COMMAND                  CREATED             STATUS             PORTS                NAMES

```


* Run:

```
docker images
```

This shows downloaded images. Again, empty—our host is clean.

```
GUEGUEN@mac tech-learning-template % docker images
REPOSITORY               TAG       IMAGE ID       CREATED        SIZE
```

- This shows downloaded images. Again, empty—our host is clean.

## 2. **Running Hello World**

Run:

```
docker run hello-world
```

Output:

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c9c5fd25a1bd: Pull complete     
Digest: sha256:ec153840d1e635ac434fab5e377081f17e0e15afab27beb3f726c3265039cfff
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

Here’s what happens step-by-step:

1. **Docker client** checks if `hello-world:latest` exists locally.

   * `hello-world` is the **image name**.
   * `:latest` is the **tag** (meaning the latest version).

2. Since it’s not found locally, Docker **pulls** the image from **Docker Hub**.

3. Once downloaded, Docker **creates and starts** a container from this image.

4. The container runs an **executable** that outputs:

   ```
   Hello from Docker!
   ```

   along with a summary of what just happened:

   * Client contacted the Daemon
   * Daemon pulled the image from Docker Hub
   * Daemon started a container from that image
   * Output was streamed back to the client and displayed in your terminal



## 3. **Pulling Images Automatically vs Manually**

You could have done this in two steps:

* `docker pull hello-world`
* `docker run hello-world`

But when you run `docker run` without having the image locally, Docker **automatically pulls** it first.



## 4. **Checking Container State**

If you now run:

```
docker ps
```

you’ll see no running containers—because Hello World just printed a message and stopped.

Run:

```
docker ps -a
```

This lists **all containers**, including stopped ones. You’ll see the Hello World container here, exited a few minutes ago.

```
CONTAINER ID   IMAGE                    COMMAND                  CREATED             STATUS                            PORTS                    NAMES
0ba43e188340   hello-world              "/hello"                 4 minutes ago       Exited (0) 4 minutes ago                                   gallant_shockley
```

## 5. **Checking Images**

Run:

```
docker images
```

Now you’ll see the `hello-world` image listed.
This is because Docker downloaded it when we ran the container.

```
REPOSITORY               TAG       IMAGE ID       CREATED        SIZE
hello-world              latest    ec153840d1e6   6 months ago   17kB
```

