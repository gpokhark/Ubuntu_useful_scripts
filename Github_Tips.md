# Github basic overview
- Follow the steps mentioned here to [generate SSH key setting](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) 
- Use this command `git config --global user.email "your@mail.com"`
- Use this command `git config --global user.name "username"`
- Use `git add .` to add all files to the staging area.
- Use `git add name1 name2` to add only `name1` and `name2` file to the staging area.
- Use `git commit -m "message"` to commit the change in the repository.
- Use `git push origin master` or default command is `git push origin branch-name` to push the local changes to the github repository.
- I personally recommend using [Visual Studio Code](https://code.visualstudio.com/) as the default text editor.
- Create `.gitignore` file to add the things they you want to ignore while creating checkpoints for the code example - build folder, .dll, .exe files etc. You  can use [gitignore.io website](https://www.gitignore.io/) to help you create a default file for any language or tool.
- Always create `README.md` file to write instructions about the usage of your repository. To learn more about it you can use this [cheatsheet](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf) and or google it. You can use the the visual studio code to edit and preview the `README.md` file using an markdown preview extension inside the visual studio code.
- Open Git Bash from the start terminal, the `~` (tilda sign) stands for `root` directory, you can type the command `pwd` to have a look at the path for the working directory.
- Create two text files file1 and file2 in any directory add add random content to it. Git bash in that folder and use the command `code -d file1 file2` to compare the contents of the files.
- `.gitconfig` - file where you can aliases and any other configuration related stuff. To open this document type the command `code ~/.gitconfig`.
I would suggest copy paste the following in that file just as it is for now. You can learn more about the commands eventually.
```
[alias]
sstash = status --show-stash
lol = log --oneline --graph
hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
# One liner with colors
l1 = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short
# Graph one liner
l2 = log --graph --oneline --decorate --all
# Details about the last commit
last = log -p -1
[filter "lfs"]
	required = true
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process

```
- Use the command `git remote -v` and google more information about it.
- Use the command `git branch -a` and google more information about it.
- Read more about `git checkout branch` command.
- When you want to undo some changes read more about the commands `git reset --hard` and `git reset --soft`. *Warning - Read carefully about both command and then use accordingly.*
- After you have couple of commits and branches use the created aliases, which will give you an overall idea about the `git hist` and `git log` 
```
git lol
git hist
git l1
git l2
git last
```
- You can add various extensions to the visual studio code to view the git history or git log.
- Google and learn a bit more about the `git diff` command.
- Once you feel comfortable with the above things learn more about `git stash`[tutorial](https://www.atlassian.com/git/tutorials/saving-changes/git-stash).
- To learn more about any command you can use google or use the following command in the terminal-
    - `man command` eg. `man git add` or `man git stash` or `man git log`
    - `command --help` eg. `git reset --help` or `grep --help` or `code --help` or `ls --help`
