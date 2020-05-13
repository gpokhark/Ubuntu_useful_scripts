# `grep` and `sed` - search and replace a string in files recursively
Avoid the usage where single quotes `'` and forward slash `/` are used for the `sed`.
```shell
grep -rl "<Eigen/Core>" . | xargs sed -i 's/<Eigen\/Core>/\"Eigen\/Core\"/g'
# grep -rl "detectorType = \"SHITOMASI\"\;" ./src/* | xargs sed -i 's/detectorType = \"SHITOMASI\"\;/detectorType = \"HARRIS\"\;/g'
```
Prefer the usage where double quotes are used `""` with the pipe `|` symbol for `sed`.

[grep and sed usage stackoverflow](https://stackoverflow.com/questions/33473291/how-to-use-variable-names-when-grep-and-sed-are-combined)
```bash
grep -rl "detectorType = \"${detectorType_arr[$((det_COUNT - 1))]}\"\;" ./src/*.cpp | xargs sed -i "s|detectorType = \"${detectorType_arr[$((det_COUNT - 1))]}\"\;|detectorType = \"$i\"\;|g"
```

# `shuf` and `mv` - shuffle and move random number of files
[shuf and mv usage stackoverflow](https://stackoverflow.com/questions/14033129/how-to-move-a-given-number-of-random-files-on-unix-linux-os)

Use a combination of `shuf` and `xargs` (it's a good idea to look at their documentation with man):

`shuf -n 10 -e * | xargs -i mv {} path-to-new-folder`

The command above selects 10 random files of the current folder (the * part) and then move them to the new folder.

Update
Although longer, one might find this version even simpler to understand:

`ls | shuf -n 10 | xargs -i mv {} path-to-new-folder`

`shuf` just generates a random permutation of the standard input, limiting the results to 10 (like using head, but probably faster).

```bash
shuf -n 1250 -e *|xargs -i mv {} /home/DL_PyTorch/Cat_Dog_data/test/Dog
```
# Git alias
| Command | Git command | Actual Alias |
|---|---|---|
| Git stash status | `git sstash` | `sstash = status --show-stash` |
| Git log one line graph | `git lol` | `lol = log --oneline --graph` |
| Git history | `git hist` | `hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short` |
| One liner with colors | `git l1` | `l1 = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short` |
| Graph one liner | `git l2` | `l2 = log --graph --oneline --decorate --all` |
| Details about the last commit | `git last` | ``` last = log -p -1 [filter "lfs"] required = true clean = git-lfs clean -- %f smudge = git-lfs smudge -- %f process = git-lfs filter-process``` |

# Git Stash
[How to git stash only untracked files?](https://stackoverflow.com/questions/39026156/how-to-git-stash-only-untracked-files)

You can do it with alias in `~/.gitconfig`: 
```
stash-untracked = "!f() { \ git stash; \ git stash -u; \ git stash pop stash@{1}; \ }; f" 
```
And then just do `git stash-untracked`  

`git stash pop` throws away the (topmost, by default) stash after applying it, whereas `git stash apply` leaves it in the stash list for possible later reuse (or you can then `git stash drop` it). 

This happens unless there are conflicts after `git stash pop`, in which case it will not remove the stash, leaving it to behave exactly like `git stash apply`. 

Another way to look at it: `git stash pop` is `git stash apply && git stash drop`. 

# Find
[Help](https://ss64.com/bash/find.html)

To test the command before actually doing anything
```
find . -iname '*(1)*' -print
```

## Examples
List filenames matching the name Alice or ALICE (case insensitive), search in the current folder (.) only:
```
find . -maxdepth 1 -iname "alice" -print0
```

# Find and mv
First check the output
```
find . -iname '*(1)*' -print

```
To search in the current folder only specify `-maxdepth` as `1`
```
find . -maxdepth  1 -iname '*(1)*' -print
```
For find and move, use in conjunction with the `-exec` command
```
find . -maxdepth 1 -iname '*(1)*' -exec mv '{}' ./duplicates/ \;
```

# VMware Workstation

[VMware Error - Could not open /dev/vmmon: No such file or directory](https://askubuntu.com/questions/1096052/vmware-15-error-on-ubuntu-18-4-could-not-open-dev-vmmon-no-such-file-or-dire)!

# ROS Installations
- Installed ROS melodic - http://wiki.ros.org/melodic/Installation/Ubuntu
- Check the [~/.bashrc file](./bashrc) for the bashrc setup. Anaconda and ROS causes lot of issues together, so you need [to remove anaconda from the PATH variable when you want to work with ROS](http://wiki.ros.org/IDEs)
- If there is [ROS_IP error](https://answers.ros.org/question/308799/melodic-network-setup-invalid-ros_ip-protocol-should-not-be-included/)
- [Gazebo [Err] [REST.cc:205] Error in REST request.](https://www.youtube.com/watch?v=ftDz_EVoatw)

# Cleaning and Freeing up memory
- [7 Simple Ways To Free Up Space On Ubuntu and Linux Mint](https://itsfoss.com/free-up-space-ubuntu-linux/)
- [Remove Unnecessary Configuration Files On Debian-based Systems](https://www.ostechnix.com/remove-unnecessary-configuration-files-on-debian-based-systems/)
 - [5 Simple Ways To Free Up Space on Ubuntu](https://www.omgubuntu.co.uk/2016/08/5-ways-free-up-space-on-ubuntu)
 - [Delete temporary files](https://stackoverflow.com/questions/33561125/how-to-clean-delete-temporary-files-if-they-exist-in-ubuntu-os) - `sudo rm -rf /tmp/*`