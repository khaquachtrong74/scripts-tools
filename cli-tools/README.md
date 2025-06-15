---
tags:
  - Introduction
  - Explain
---
---

# get-computer-information

```bash
./get-computer-information
```

Return some information like this

```bash
# btw, I use NixOs btw, btw
Hostname:  nixos
Platform:  nixos 25.11 (Xantusia)
CPU:  11th Gen Intel(R) Core(TM) i5-11400H @ 2.70GHz
RAM:  15771  MB
Disk:  160184  MB
```

# live-server-local

Yeah, it work like live-server extension on `visualcode`, you just need add directory of your source to flag `-path=`, maybe absolute path or relative path is fine.

```bash
./live-server-local -path="Your/directory"

# Or maybe your src is in currently directory you just
./live-server-local -path # I set default path is ./ so don't worry
```

If you want to automatically change what `*.html`, please add tag meta below with `http-equiv` into your `*.html` file

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Auto refresh for live-server-local cli tools from Go -->
    <meta http-equiv="refresh" content="5" > 
    <title>Documents</title>
</head>
<body>...</body>
</html>
...
```

# todo-app

Yeah, this is todo  app run on `CLI` with some features I add.
Describe
```bash
./todo-app -h
Usage of ./todo-app:
	-clear #bool
		Switch true to `clear` boltDB #Database
	-priority int
		Enter priority of task # default 0
	-read #bool
		Switch true to `read` task today bro!
	-task #string
		Enter your task today! (default "Default task")
```
