## **Demo: Working With an Existing Docker Image**

**Welcome back!**
In this section, you’ll gain hands-on experience working with an **existing Docker image**.

I’ve already prepared a **containerized application** for you. Since we’re not yet at the stage where you’ll build your own images, you’ll be interacting with Docker using this **pre-prepared image**.

All the commands used in this demo are listed in the video description—so you can refer to them as you follow along.


## 1. **Checking Your Docker Host**

Before starting:

* Open your terminal.

* Run:

  ```
  docker ps
  ```

  → You shouldn’t see any running containers.

* Run:

  ```
  docker ps -a
  ```

  → You should see **all** containers, including stopped ones.

```
CONTAINER ID   IMAGE                      COMMAND                  CREATED          STATUS                      PORTS                    NAMES
fb5fc9994d0f   acantril/containerofcats   "/usr/sbin/httpd -D …"   45 minutes ago   Up 45 minutes               0.0.0.0:8081->80/tcp     fervent_hopper
fc50b67d8ec1   acantril/containerofcats   "/usr/sbin/httpd -D …"   50 minutes ago   Exited (0) 49 minutes ago                            dazzling_curie
ac9ea8fe4563   ubuntu                     "bash"                   47 hours ago     Exited (129) 47 hours ago                            busy_rhodes
0ba43e188340   hello-world                "/hello"                 47 hours ago     Exited (0) 47 hours ago                              gallant_shockley
202644b557bc   docker/getting-started     "/docker-entrypoint.…"   2 days ago       Exited (0) 46 hours ago                              magical_lewin
c2d99f8046b1   postgres:15                "docker-entrypoint.s…"   2 weeks ago      Exited (0) 8 days ago                                talend-postgres
130c8dde6412   postgres:15                "docker-entrypoint.s…"   3 weeks ago      Exited (255) 2 weeks ago    0.0.0.0:5432->5432/tcp   postgres-db
```

- here we see containers not images (unique) that's why we have multiple containers with the same image (but remember that each container is unique and has its own filesystem)

- `ps` stands for **process status**.

* Run:

  ```
  docker images
  ```


## 2. **Finding the Image on Docker Hub**

We’ll download the image from **Docker Hub** (the most popular Docker registry).

1. Open your browser and go to:

   ```
   https://hub.docker.com
   ```

2. In the search bar, type:

   ```
   containerofcats
   ```

   (all lowercase, one word)

3. Look for:

   ```
   acantril/containerofcats
   ```

   * **Username:** `acantril` (with one “L”)
   * Created by me, with over 10,000 downloads at the time of recording

4. Click the correct result.

5. On the image page, copy the **Docker pull** command provided.


## 3. **Pulling the Image**

Back in your terminal:

1. Clear the screen.
2. Paste and run the command you copied:

   ```
   docker pull acantril/containerofcats
   ```

* This downloads the image to your **local Docker host**.
* Because no tag was specified, Docker defaults to `:latest`.
* You’ll see multiple **filesystem layers** being pulled—each represents part of the image.

Once complete, you’ll have the image locally.


## 4. **Inspecting the Image**

Run:

```
docker images
```

You should now see:

* The **hello-world** image
* The **containerofcats** image (with a unique image ID)

Copy the image ID—you’ll need it.

To view metadata for the image:

```docker
docker inspect <image_id>
```

```
docker inspect 3ffa9b0efe79
```

This shows:

* Full image ID
* Repository tags
* Creation date
* Container configuration
* Labels (e.g., `maintainer`)
* Volumes
* Entrypoint
* Architecture, OS, size
* All filesystem layers that make up the image

```
[
    {
        "Id": "sha256:3ffa9b0efe795ea25b2eb751d3d528b01ec17b6c747458f680a477fa177591fa",
        "RepoTags": [
            "acantril/containerofcats:latest"
        ],
        "RepoDigests": [
            "acantril/containerofcats@sha256:3ffa9b0efe795ea25b2eb751d3d528b01ec17b6c747458f680a477fa177591fa"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2023-06-22T22:45:45.118141539Z",
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "80/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "container=oci"
            ],
            "Cmd": null,
            "Image": "",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "/usr/sbin/httpd",
                "-D",
                "FOREGROUND"
            ],
            "OnBuild": null,
            "Labels": {
                "architecture": "x86_64",
                "build-date": "2023-05-03T15:02:11",
                "com.redhat.component": "ubi8-container",
                "com.redhat.license_terms": "https://www.redhat.com/en/about/red-hat-end-user-license-agreements#UBI",
                "description": "The Universal Base Image is designed and engineered to be the base layer for all of your containerized applications, middleware and utilities. This base image is freely redistributable, but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products. This image is maintained by Red Hat and updated regularly.",
                "distribution-scope": "public",
                "io.buildah.version": "1.27.3",
                "io.k8s.description": "The Universal Base Image is designed and engineered to be the base layer for all of your containerized applications, middleware and utilities. This base image is freely redistributable, but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products. This image is maintained by Red Hat and updated regularly.",
                "io.k8s.display-name": "Red Hat Universal Base Image 8",
                "io.openshift.expose-services": "",
                "io.openshift.tags": "base rhel8",
                "maintainer": "Animals4life",
                "name": "ubi8",
                "release": "854",
                "summary": "Provides the latest release of Red Hat Universal Base Image 8.",
                "url": "https://access.redhat.com/containers/#/registry.access.redhat.com/ubi8/images/8.8-854",
                "vcs-ref": "384f2bb33eebab960262e967aa16d01fe2dbebff",
                "vcs-type": "git",
                "vendor": "Red Hat, Inc.",
                "version": "8.8"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 94641639,
        "GraphDriver": {
            "Data": null,
            "Name": "overlayfs"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:486dcc5a5ac3b9d7452d24fdd0c8e1d6c1d452a5827276febe9f194ba2cb2992",
                "sha256:4a41380ee933f5d2fbfeadeb63e09dd21e35e0b961ef086e3a7d8034cca34509",
                "sha256:d5e3d71701f9abbc2a089c17db89cd9729e9d3d6f3aeab8c3cc880d1b44a5a01",
                "sha256:ff9050fa5c6eec0f1871db2147fc0df8905c85d0e937d91f326b22889a5373c4"
            ]
        },
        "Metadata": {
            "LastTagTime": "2025-08-14T18:25:42.096803046Z"
        },
        "Descriptor": {
            "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
            "digest": "sha256:3ffa9b0efe795ea25b2eb751d3d528b01ec17b6c747458f680a477fa177591fa",
            "size": 1158
        }
    }
]
```

## 5. **Running the Container**

We’ll run the container and map its internal port 80 to port **8081** on our host:

```
docker run -p 8081:80 acantril/containerofcats
```

**How this works:**

- `-p` = port mapping : maps ports between host and container
    * `-p hostPort:containerPort`
        * `-p 8081:80` maps **host port 8081** → **container port 80**
            * When you access `http://localhost:8081`, it forwards the request to port 80 inside the container
    * The application inside the container listens on port 80

If the image wasn’t already pulled, this command would have downloaded it automatically.

**Note:**

```
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
```

```
I notice you're trying to run a Docker container called acantril/containerofcats and encountering a platform mismatch warning. This is happening because:

- You're running on an ARM64 (Apple Silicon) Mac
- The container image was built for AMD64 architecture
- The container is still running (as evidenced by the Apache HTTP Server message), but there might be potential performance implications
```


### **Testing the Application**

Open your browser and go to:

```
http://localhost:8081
```

You should see the **Container-of-Cats** application:

> “If it fits, I sits in a container in a container” — with cat images inside containers.

Press **CTRL+C** in the terminal to stop the container.
If you refresh the browser, it won’t load—because the container has stopped. (because we haven't used the `-d` flag)


## 6. **Detached Mode**

To keep the container running without tying up your terminal:

```
docker run -p 8081:80 -d acantril/containerofcats
```

* `-d` = detached mode : means running the container in the background, freeing up your terminal while the container keep running. 
You can still access its logs using `docker logs <container_id>`
* Now `docker ps` will show the container running


## 7. **Checking Port Mapping**

Find the container ID (`docker ps`), then run:

```
docker port <container_id>
```

```
docker port fb5fc9994d0f
```

```
80/tcp -> 0.0.0.0:8081
```

This shows the internal container port mapped to the host port.


## 8. **Running Commands Inside the Container**

### Example: Listing processes

```
docker exec -it <container_id> ps -aux
```

```
docker exec -it fb5fc9994d0f ps -aux
```

```
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.2 548636 17188 ?        Ss   18:53   0:00 /usr/sbin/httpd -D FOREGROUND
apache       7  0.0  0.1 551200 14432 ?        S    18:53   0:00 /run/rosetta/rosetta /usr/sbin/httpd /usr/sbin
apache       8  0.0  0.2 3055544 17236 ?       Sl   18:53   0:02 /run/rosetta/rosetta /usr/sbin/httpd /usr/sbin
apache       9  0.0  0.2 2858456 19752 ?       Sl   18:53   0:02 /run/rosetta/rosetta /usr/sbin/httpd /usr/sbin
apache      10  0.0  0.2 2858744 20100 ?       Sl   18:53   0:02 /run/rosetta/rosetta /usr/sbin/httpd /usr/sbin
root       240  0.0  0.0 301444  6676 pts/0    Ss+  19:50   0:00 sh
root       246  0.0  0.0 301384  6548 pts/1    Ss+  19:52   0:00 sh
root       285  0.1  0.0 301436  6588 pts/2    Ss   20:00   0:00 sh
root       292  0.0  0.0 333916  6740 pts/2    R+   20:01   0:00 ps aux
``` 

Detailed Command Explanations:

1. `docker exec`: Run a command inside a running container
    - `-i` (interactive): Keeps input open (allows typing)
    - `-t` (terminal): Creates a virtual terminal
    - `-it` together: Makes the container feel like a real terminal session
    - Example: `docker exec -it fb5fc9994d0f sh` → opens a shell in the container

2. `ps aux`: Show running processes
    - `a`: All users' processes
    - `u`: Detailed view (shows CPU, memory, etc.)
    - `x`: All processes, even those without terminal
    - Example output:
    ```
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root         1  0.0  0.2 548636 17188 ?        Ss   18:53   0:00 /usr/sbin/httpd
    apache       7  0.0  0.1 551200 14432 ?        S    18:53   0:00 /usr/sbin/httpd
    ```

You'll see the **Apache web server** running as PID 1, with child processes beneath it—demonstrating that the container runs a single main process.

- If the `ps` command is not available, you can install it:

```
docker exec -it <container_id> sh

dnf install procps
```

### Example: Opening a shell inside the container

```
docker exec -it <container_id> sh
```

From here, you can:

* `ps aux` → list processes

```
sh-4.4# ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.2 548636 17188 ?        Ss   18:53   0:00 /usr/sbin/httpd -D FOREGROUND
apache       7  0.0  0.1 551200 14432 ?        S    18:53   0:00 /run/rosetta/rosetta /usr/sbin/httpd /usr/sbin
apache       8  0.0  0.2 3055544 17236 ?       Sl   18:53   0:02 /run/rosetta/rosetta /usr/sbin/httpd /usr/sbin
apache       9  0.0  0.2 2858456 19752 ?       Sl   18:53   0:02 /run/rosetta/rosetta /usr/sbin/httpd /usr/sbin
apache      10  0.0  0.2 2858744 20100 ?       Sl   18:53   0:02 /run/rosetta/rosetta /usr/sbin/httpd /usr/sbin
root       240  0.0  0.0 301444  6676 pts/0    Ss+  19:50   0:00 sh
root       246  0.0  0.0 301384  6548 pts/1    Ss+  19:52   0:00 sh
root       285  0.1  0.0 301436  6588 pts/2    Ss   20:00   0:00 sh
root       292  0.0  0.0 333916  6740 pts/2    R+   20:01   0:00 ps aux
```

* `df -k` → view filesystem usage

```
sh-4.4# df -k
Filesystem      1K-blocks    Used Available Use% Mounted on
overlay        1055761844 9005764 993052656   1% /
tmpfs               65536       0     65536   0% /dev
shm                 65536       0     65536   0% /dev/shm
/dev/vda1      1055761844 9005764 993052656   1% /etc/hosts
tmpfs             4012300       0   4012300   0% /proc/scsi
tmpfs             4012300       0   4012300   0% /sys/firmware```

* `dnf install procps` → install `ps` command

Type `exit` to leave the container shell.


## 9. **Managing Containers**

* Restart:

  ```
  docker restart <container_id>
  ```

  ```docker
  docker restart fb5fc9994d0f
  ```

  ```
  fb5fc9994d0f
  ```
 
* Stop:

  ```
  docker stop <container_id>
  ```

  ```docker
  docker stop fb5fc9994d0f
  ```

  ```
  fb5fc9994d0f
  ```

  Then `docker ps` should show no running containers and `docker ps -a` should show the stopped container

* Start:

  ```
  docker start <container_id>
  ```

  ```docker
  docker start fb5fc9994d0f
  ```

  ```
  fb5fc9994d0f
  ```

  Then `docker ps` should show the running container and `docker ps -a` should show the stopped container

## 10. **Viewing Logs**

To see container logs:

```
docker logs <container_id>
```

```docker
docker logs fb5fc9994d0f
```

```
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
```

Add `-t` to include timestamps.

```docker
docker logs <container_id> -t
```

```docker
docker logs fb5fc9994d0f -t
```

```
2025-08-14T18:53:28.133439471Z AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
2025-08-14T20:07:04.288755709Z AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
2025-08-14T20:09:15.720632798Z AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
```

## 11. **Cleaning Up**

1. Stop and remove containers:

   ```
   docker stop <container_id>
   docker rm <container_id>
   ```

   Repeat for any old containers (`docker ps -a`).

2. Remove the image:

   ```
   docker rmi <image_id>
   ```

   This deletes the image and its unused layers.


## 12. **What You’ve Learned**


* Pulled a pre-existing image from Docker Hub
* Ran it as a containerized application
* Mapped ports between host and container
* Executed commands inside the container
* Viewed logs and process info
* Managed (start/stop/restart) containers
* Cleaned up images and containers
