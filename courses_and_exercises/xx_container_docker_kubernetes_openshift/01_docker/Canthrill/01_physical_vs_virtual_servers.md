## 1. Physical Servers

Physical servers are straightforward for anyone who has worked in IT.

* You **purchase** the hardware outright, meaning you own **100% of its capacity**.
* But if something fails, **it’s entirely your problem**. Anything running on that server will stop, and you’ll have to repair or replace the faulty hardware yourself.

A physical server is simply a **set of hardware components**:

* Motherboard
* CPU(s)
* RAM (memory)
* Storage drives
* Possibly add-on cards such as GPUs or specialized cards for specific workloads.

You choose these components based on **features** and **capacity**.
That capacity determines how much the server can run before performance starts to degrade.

Here’s the catch:

* You’ve **already paid for that capacity**, so ideally you want to use all of it to get maximum value.
* If you leave capacity unused, you’re **wasting money**.

In practice, you might:

1. **Leave it idle** – which wastes resources, often because the server was oversized for peak demand.
2. **Run multiple applications** – which makes better use of hardware, especially if their peak usage happens at different times.

However, running multiple applications on one OS carries **risk**: if one app crashes, it can bring down others, potentially affecting your whole business stack.

Historically, this was normal: you sized a server, added a buffer for busy periods, and hoped for the best. This approach was often **inefficient and risky**.


## 2. Virtual Servers (Virtualization)

Virtualization changes the game.

We still have **physical servers**, but now they’re called **hosts** (or **VM hosts**).
They still have CPU, RAM, storage, and optional add-on cards, just like before.

The key difference is the introduction of the **hypervisor** – software that manages the host’s physical resources so that multiple **virtual machines (VMs)** can run on the same hardware.

### Examples of hypervisors:

* VMware
* Hyper-V
* VirtualBox
* Xen
* KVM

The hypervisor acts as a **referee** between the hardware and the VMs, making sure each VM gets the resources it’s allocated.



## 3. How Virtual Machines Work

Each virtual machine:

* Has its **own operating system**
* Runs its **own applications**
* Has no direct access to the physical hardware (all access goes through the hypervisor).

VMs can be:

* All the same size
* Or sized differently for specific workloads.

You can:

* **Dedicate** resources so total usage never exceeds the host’s hardware capacity.
* Or **oversubscribe**, banking on the fact that not all VMs use full capacity all the time.



## 4. Benefits of Virtualization

* **Isolation**: If one VM fails, it doesn’t affect others.
* **Flexibility**: You can patch, resize, or reboot one VM without impacting the rest.
* **Scalability**: You can have multiple VM hosts managed by the same hypervisor.
* **Live migration**: Move VMs between hosts without shutting them down – useful for maintenance or if a host fails.
* **Disaster recovery**: VMs are quicker to boot and recover than physical servers.
* **Better utilization**: Run many VMs on one host without the instability risk of running many apps on one OS.


## 5. Drawbacks

Each VM has its **own OS**, so if you’re running dozens of identical OS copies (e.g., Debian), you waste resources on duplication.

This inefficiency is exactly what **containers** aim to solve – but that’s a topic for another video.


**In summary**:
We’ve covered the basics of **physical** and **virtual** servers, their differences, and the pros and cons of each. This knowledge will be the foundation for understanding why **containers** can be so powerful.

![alt text](images/01_01.png)