---
description: Send To
icon: fontawesome/regular/share-from-square
---

# :fontawesome-regular-share-from-square: Send To

Send To is a feature in Windows' right-click (context) menu that can be launch scripts with the file(s) you selected

![Typing shell:sendto in Windows' Run dialog (Win+R)](../assets/images/video/sendto/context menu example.png){ width="600" }


# Opening the Send To folder

It can be opened by typing `shell:sendto` in the run dialog (Win+R)

![Typing shell:sendto in Windows' Run dialog (Win+R)](../assets/images/video/sendto/winrshellsendto.png){ width="450" }

Here you can make and remove shortcuts to scripts and folders


![Send To folder](../assets/images/video/sendto/sendtofolder.png){ width="450" }

## Script arguments behavior

!!! Info
    *Executable* means be any of the following:
    
    * A shortcut to an executable or batch file
    * An executable or batchfile, literally

Dragging file(s) on an executable, and doing Send To -> that executable has the same behavior: 

That executable gets launched with each argument being the full file path of the file(s) selected

```
example.cmd "D:\vids\clip1.mp4" "D:\vids\clip2.mp4"
```

## Folder behavior

You can also place shortcuts to folder if you want to be able to copy / move folder to specific places from any folder in the Explorer:

* Simply left clicking will <u>copy</u> the file
* <kbd>SHIFT</kbd> clicking it will <u>move</u> the file