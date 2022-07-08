
[Some basic info](https://subscription.packtpub.com/book/virtualization_and_cloud/9781789532401/1/ch02lvl1sec09/basic-docker-terminal-commands)
[DOcker Reference - Critical](https://docs.docker.com/engine/reference/run/)
[Docker Networking Tutorial](https://docs.docker.com/network/network-tutorial-macvlan/)
;[Cont Networking](https://docs.docker.com/config/containers/container-networking/)
[Guide](https://docs.docker.com/get-started/orchestration/)




[Dockerfiles](https://docs.docker.com/engine/reference/builder/)
[Compose Files v3](https://docs.docker.com/compose/compose-file/compose-file-v3/)
[Other Ref](https://docs.docker.com/reference/)

[Doc Archive](https://docs.docker.com/docsarchive/)
[ipvlan](https://docs.docker.com/network/ipvlan/)
macvlan is now working as expecterd







##  Docker

docker run  --network macvlan3 --name=alptest --ip 192.168.1.43 --dns 1.1.1.1,9.9.9.9 -h alpinetest -it --rm alpine /bin/sh
 -it instructs Docker to allocate a pseudo-TTY connected to the

 --ip assigns a static ip- dhcp doesnt work
 --dns should assign dns servers,
 -- rm removes upon exit
 --net assigns the network
 -h sets the hostname

 So in Unraid, additional parameters would be this:

 -net macvlan3 --ip 192.168.1.xx --dns 1.1.1.1 -h hostname -name ?
 -net macvlan3 --ip 192.168.1.xx --dns 1.1.1.1 -h hostname -name hostname -l hostname --net-alias hostname --device USB -- dns-search local  Timmons Family --domainname Timmons..Family
`--net macvlan3 --ip 192.168.1.xx --dns 1.1.1.1 --dns 9.9.9.9  -h nginx_proxy -name nginx_proxy -l nginx_proxy --net-alias nginx_proxy --- dns-search local --dns-search  Timmons  --dns-search Family --domainname Timmons..Family
--net macvlan3 --ip 192.168.1.44 --dns 1.1.1.1 --dns 9.9.9.9  -h nginx_proxy --name nginx_proxy -l nginx_proxy --net-alias nginx_proxy --dns-search local  --domainname Timmons..Family

 also consider:
 --expose  Expose a port or a range of ports
--gpus		API 1.40+
GPU devices to add to the container ('all' to pass all GPUs)
--label , -l		Set meta data on a container
--link-local-ip		Container IPv4/IPv6 link-local addresses
--link		Add link to another container
--mount		Attach a filesystem mount to the container
--net-alias		Add network-scoped alias for the container
-env VAR1=value1 --env VAR2=value2 
--publish , -p		Publish a container's port(s) to the host
--publish-all , -P		Publish all exposed ports to random ports
--device		Add a host device to the container

                  --device=/dev/sdc:/dev/xvdc \
             --device=/dev/sdd --device=/dev/zero:/dev/nulo \
             -i -t \
             ubuntu ls -l /dev/{xvdc,sdd,nulo}
--dns-search		Set custom DNS search domains  
--domainname		Container NIS domain name
--dns add dns servers
            Syntax for multiple  --dns="1.0.0.1" --dns="1.1.1.1" 
 ** Your container will use the same DNS servers as the host by default, but you can override this with --dns.
Add entries to container hosts file (--add-host)

--add-host=docker:93.184.216.34

!!!Note Note: On options above- with multiple values
                        
                        `--dns` -The IP address of a DNS server. To specify multiple DNS servers, use multiple --dns flags. If the container cannot reach any of the IP addresses you specify, Google’s public DNS server 8.8.8.8 is added, so that your container can resolve internet domains.
                        `--dns-search` -> A DNS search domain to search non-fully-qualified hostnames. To specify multiple DNS search prefixes, use multiple --dns-search flags.
                        `--dns-opt` -> A key-value pair representing a DNS option and its value. See your operating system’s documentation for resolv.conf for valid options.
                        `--hostname` -> The hostname a container uses for itself. Defaults to the container’s ID if not specified.
      




The flags you pass to ip addr show depend on whether you are using IPv4 or IPv6 networking in your containers. Use the following flags for IPv4 address retrieval for a network device named eth0:

 HOSTIP=`ip -4 addr show scope global dev eth0 | grep inet | awk '{print $2}' | cut -d / -f 1 | sed -n 1p`
 docker run  --add-host=docker:${HOSTIP} --rm -it debian


[](https://docs.docker.com/engine/reference/run/)


#### Network: host

With the network set to `host` a container will share the host's network stack and all interfaces from the host will be available to the container. The container's hostname will match the hostname on the host system. Note that `--mac-address` is invalid in `host` netmode. Even in `host` network mode a container has its own UTS namespace by default. As such `--hostname` and `--domainname` are allowed in `host` network mode and will only change the hostname and domain name inside the container. Similar to `--hostname`, the `--add-host`, `--dns`, `--dns-search`, and `--dns-option` options can be used in `host` network mode. These options update `/etc/hosts` or `/etc/resolv.conf` inside the container. No change are made to `/etc/hosts` and `/etc/resolv.conf` on the host.

Compared to the default `bridge` mode, the `host` mode gives *significantly* better networking performance since it uses the host's native networking stack whereas the bridge has to go through one level of virtualization through the docker daemon. It is recommended to run containers in this mode when their networking performance is critical, for example, a production Load Balancer or a High Performance Web Server.

> Note
>
> `--network="host"` gives the container full access to local system services such as D-bus and is therefore considered insecure.

#### Network: container

With the network set to `container` a container will share the network stack of another container. The other container's name must be provided in the format of `--network container:<name|id>`. Note that `--add-host` `--hostname` `--dns` `--dns-search` `--dns-option` and `--mac-address` are invalid in `container` netmode, and `--publish` `--publish-all` `--expose` are also invalid in `container` netmode.

Example running a Redis container with Redis binding to `localhost` then running the `redis-cli` command and connecting to the Redis server over the `localhost` interface.

```
$ docker run -d --name redis example/redis --bind 127.0.0.1
$ # use the redis container's network stack to access localhost
$ docker run --rm -it --network container:redis example/redis-cli -h 127.0.0.1

```

#### User-defined network

You can create a network using a Docker network driver or an external network driver plugin. You can connect multiple containers to the same network. Once connected to a user-defined network, the containers can communicate easily using only another container's IP address or name.

For `overlay` networks or custom plugins that support multi-host connectivity, containers connected to the same multi-host network but launched from different Engines can also communicate in this way.

The following example creates a network using the built-in `bridge` network driver and running a container in the created network

```
$ docker network create -d bridge my-net
$ docker run --network=my-net -itd --name=container3 busybox

```

### Managing /etc/hosts[](https://docs.docker.com/engine/reference/run/#managing-etchosts)

Your container will have lines in `/etc/hosts` which define the hostname of the container itself as well as `localhost` and a few other common things. The `--add-host` flag can be used to add additional lines to `/etc/hosts`.

```
$ docker run -it --add-host db-static:86.75.30.9 ubuntu cat /etc/hosts

172.17.0.22     09d03f76bf2c
fe00::0         ip6-localnet
ff00::0         ip6-mcastprefix
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
127.0.0.1       localhost
::1	            localhost ip6-localhost ip6-loopback
86.75.30.9      db-static

```

If a container is connected to the default bridge network and `linked` with other containers, then the container's `/etc/hosts` file is updated with the linked container's name.

> Note
>
> Since Docker may live update the container's `/etc/hosts` file, there may be situations when processes inside the container can end up reading an empty or incomplete `/etc/hosts` file. In most cases, retrying the read again should fix the problem.
>
>



FROM

Usage:

-   `FROM <image>`
-   `FROM <image>:<tag>`
-   `FROM <image>@<digest>`

Information:

-   `FROM` must be the first non-comment instruction in the Dockerfile.
-   `FROM` can appear multiple times within a single Dockerfile in order to create multiple images. Simply make a note of the last image ID output by the commit before each new `FROM` command.
-   The `tag` or `digest` values are optional. If you omit either of them, the builder assumes a `latest` by default. The builder returns an error if it cannot match the `tag` value.

[Reference](https://docs.docker.com/engine/reference/builder/#from) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#from)

 |
|

MAINTAINER

Usage:

-   `MAINTAINER <name>`

The `MAINTAINER` instruction allows you to set the Author field of the generated images.

[Reference](https://docs.docker.com/engine/reference/builder/#maintainer)

 |
|

RUN

Usage:

-   `RUN <command>` (shell form, the command is run in a shell, which by default is `/bin/sh -c` on Linux or `cmd /S /C` on Windows)
-   `RUN ["<executable>", "<param1>", "<param2>"]` (exec form)

Information:

-   The exec form makes it possible to avoid shell string munging, and to `RUN` commands using a base image that does not contain the specified shell executable.
-   The default shell for the shell form can be changed using the `SHELL` command.
-   Normal shell processing does not occur when using the exec form. For example, `RUN ["echo", "$HOME"]` will not do variable substitution on `$HOME`.

[Reference](https://docs.docker.com/engine/reference/builder/#run) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#run)

 |
|

CMD

Usage:

-   `CMD ["<executable>","<param1>","<param2>"]` (exec form, this is the preferred form)
-   `CMD ["<param1>","<param2>"]` (as default parameters to ENTRYPOINT)
-   `CMD <command> <param1> <param2>` (shell form)

Information:

-   The main purpose of a `CMD` is to provide defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case you must specify an `ENTRYPOINT` instruction as well.
-   There can only be one `CMD` instruction in a Dockerfile. If you list more than one `CMD` then only the last `CMD` will take effect.
-   If `CMD` is used to provide default arguments for the `ENTRYPOINT` instruction, both the `CMD` and `ENTRYPOINT` instructions should be specified with the JSON array format.
-   If the user specifies arguments to `docker run` then they will override the default specified in `CMD`.
-   Normal shell processing does not occur when using the exec form. For example, `CMD ["echo", "$HOME"]` will not do variable substitution on `$HOME`.

[Reference](https://docs.docker.com/engine/reference/builder/#cmd) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#cmd)

 |
|

LABEL

Usage:

-   `LABEL <key>=<value> [<key>=<value> ...]`

Information:

-   The `LABEL` instruction adds metadata to an image.
-   To include spaces within a `LABEL` value, use quotes and backslashes as you would in command-line parsing.
-   Labels are additive including `LABEL`s in `FROM` images.
-   If Docker encounters a label/key that already exists, the new value overrides any previous labels with identical keys.
-   To view an image's labels, use the `docker inspect` command. They will be under the `"Labels"` JSON attribute.

[Reference](https://docs.docker.com/engine/reference/builder/#label) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#label)

 |
|

EXPOSE

Usage:

-   `EXPOSE <port> [<port> ...]`

Information:

-   Informs Docker that the container listens on the specified network port(s) at runtime.
-   `EXPOSE` does not make the ports of the container accessible to the host.

[Reference](https://docs.docker.com/engine/reference/builder/#expose) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#expose)

 |
|

ENV

Usage:

-   `ENV <key> <value>`
-   `ENV <key>=<value> [<key>=<value> ...]`

Information:

-   The `ENV` instruction sets the environment variable `<key>` to the value `<value>`.
-   The value will be in the environment of all "descendant" Dockerfile commands and can be replaced inline as well.
-   The environment variables set using `ENV` will persist when a container is run from the resulting image.
-   The first form will set a single variable to a value with the entire string after the first space being treated as the `<value>` - including characters such as spaces and quotes.

[Reference](https://docs.docker.com/engine/reference/builder/#env) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#env)

 |
|

ADD

Usage:

-   `ADD <src> [<src> ...] <dest>`
-   `ADD ["<src>", ... "<dest>"]` (this form is required for paths containing whitespace)

Information:

-   Copies new files, directories, or remote file URLs from `<src>` and adds them to the filesystem of the image at the path `<dest>`.
-   `<src>` may contain wildcards and matching will be done using Go's filepath.Match rules.
-   If `<src>` is a file or directory, then they must be relative to the source directory that is being built (the context of the build).
-   `<dest>` is an absolute path, or a path relative to `WORKDIR`.
-   If `<dest>` doesn't exist, it is created along with all missing directories in its path.

[Reference](https://docs.docker.com/engine/reference/builder/#add) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#add-or-copy)

 |
|

COPY

Usage:

-   `COPY <src> [<src> ...] <dest>`
-   `COPY ["<src>", ... "<dest>"]` (this form is required for paths containing whitespace)

Information:

-   Copies new files or directories from `<src>` and adds them to the filesystem of the image at the path `<dest>`.
-   `<src>` may contain wildcards and matching will be done using Go's filepath.Match rules.
-   `<src>` must be relative to the source directory that is being built (the context of the build).
-   `<dest>` is an absolute path, or a path relative to `WORKDIR`.
-   If `<dest>` doesn't exist, it is created along with all missing directories in its path.

[Reference](https://docs.docker.com/engine/reference/builder/#copy) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#add-or-copy)

 |
|

ENTRYPOINT

Usage:

-   `ENTRYPOINT ["<executable>", "<param1>", "<param2>"]` (exec form, preferred)
-   `ENTRYPOINT <command> <param1> <param2>` (shell form)

Information:

-   Allows you to configure a container that will run as an executable.
-   Command line arguments to `docker run <image>` will be appended after all elements in an exec form `ENTRYPOINT` and will override all elements specified using `CMD`.
-   The shell form prevents any `CMD` or run command line arguments from being used, but the `ENTRYPOINT` will start via the shell. This means the executable will not be PID 1 nor will it receive UNIX signals. Prepend `exec` to get around this drawback.
-   Only the last `ENTRYPOINT` instruction in the Dockerfile will have an effect.

[Reference](https://docs.docker.com/engine/reference/builder/#entrypoint) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#entrypoint)

 |
|

VOLUME

Usage:

-   `VOLUME ["<path>", ...]`
-   `VOLUME <path> [<path> ...]`

Creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers.

[Reference](https://docs.docker.com/engine/reference/builder/#volume) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#volume)

 |
|

USER

Usage:

-   `USER <username | UID>`

The `USER` instruction sets the user name or UID to use when running the image and for any `RUN`, `CMD` and `ENTRYPOINT` instructions that follow it in the Dockerfile.

[Reference](https://docs.docker.com/engine/reference/builder/#user) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#user)

 |
|

WORKDIR

Usage:

-   `WORKDIR </path/to/workdir>`

Information:

-   Sets the working directory for any `RUN`, `CMD`, `ENTRYPOINT`, `COPY`, and `ADD` instructions that follow it.
-   It can be used multiple times in the one Dockerfile. If a relative path is provided, it will be relative to the path of the previous `WORKDIR` instruction.

[Reference](https://docs.docker.com/engine/reference/builder/#workdir) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#workdir)

 |
|

ARG

Usage:

-   `ARG <name>[=<default value>]`

Information:

-   Defines a variable that users can pass at build-time to the builder with the `docker build` command using the `--build-arg <varname>=<value>` flag.
-   Multiple variables may be defined by specifying `ARG` multiple times.
-   It is not recommended to use build-time variables for passing secrets like github keys, user credentials, etc. Build-time variable values are visible to any user of the image with the docker history command.
-   Environment variables defined using the `ENV` instruction always override an `ARG` instruction of the same name.
-   Docker has a set of predefined `ARG` variables that you can use without a corresponding ARG instruction in the Dockerfile.
    -   `HTTP_PROXY` and `http_proxy`
    -   `HTTPS_PROXY` and `https_proxy`
    -   `FTP_PROXY` and `ftp_proxy`
    -   `NO_PROXY` and `no_proxy`

[Reference](https://docs.docker.com/engine/reference/builder/#arg)

 |
|

ONBUILD

Usage:

-   `ONBUILD <Dockerfile INSTRUCTION>`

Information:

-   Adds to the image a trigger instruction to be executed at a later time, when the image is used as the base for another build. The trigger will be executed in the context of the downstream build, as if it had been inserted immediately after the `FROM` instruction in the downstream Dockerfile.
-   Any build instruction can be registered as a trigger.
-   Triggers are inherited by the "child" build only. In other words, they are not inherited by "grand-children" builds.
-   The `ONBUILD` instruction may not trigger `FROM`, `MAINTAINER`, or `ONBUILD` instructions.

[Reference](https://docs.docker.com/engine/reference/builder/#onbuild) - [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#onbuild)

 |
|

STOPSIGNAL

Usage:

-   `STOPSIGNAL <signal>`

The `STOPSIGNAL` instruction sets the system call signal that will be sent to the container to exit. This signal can be a valid unsigned number that matches a position in the kernel's syscall table, for instance `9`, or a signal name in the format SIGNAME, for instance `SIGKILL`.

[Reference](https://docs.docker.com/engine/reference/builder/#stopsignal)

 |
|

HEALTHCHECK

Usage:

-   `HEALTHCHECK [<options>] CMD <command>` (check container health by running a command inside the container)
-   `HEALTHCHECK NONE` (disable any healthcheck inherited from the base image)

Information:

-   Tells Docker how to test a container to check that it is still working
-   Whenever a health check passes, it becomes `healthy`. After a certain number of consecutive failures, it becomes `unhealthy`.
-   The `<options>` that can appear are...
    -   `--interval=<duration>` (default: 30s)
    -   `--timeout=<duration>` (default: 30s)
    -   `--retries=<number>` (default: 3)
-   The health check will first run `interval` seconds after the container is started, and then again `interval` seconds after each previous check completes. If a single run of the check takes longer than `timeout` seconds then the check is considered to have failed. It takes `retries` consecutive failures of the health check for the container to be considered `unhealthy`.
-   There can only be one `HEALTHCHECK` instruction in a Dockerfile. If you list more than one then only the last `HEALTHCHECK` will take effect.
-   `<command>` can be either a shell command or an exec JSON array.
-   The command's exit status indicates the health status of the container.
    -   `0`: success - the container is healthy and ready for use
    -   `1`: unhealthy - the container is not working correctly
    -   `2`: reserved - do not use this exit code
-   The first 4096 bytes of stdout and stderr from the `<command>` are stored and can be queried with `docker inspect`.
-   When the health status of a container changes, a `health_status` event is generated with the new status.

[Reference](https://docs.docker.com/engine/reference/builder/#healthcheck)

 |
|

SHELL

Usage:

-   `SHELL ["<executable>", "<param1>", "<param2>"]`

Information:

-   Allows the default shell used for the shell form of commands to be overridden.
-   Each `SHELL` instruction overrides all previous `SHELL` instructions, and affects all subsequent instructions.
-   Allows an alternate shell be used such as `zsh`, `csh`, `tcsh`, `powershell`, and others.

[Reference](https://docs.docker.com/engine/reference/builder/#shell)

 |