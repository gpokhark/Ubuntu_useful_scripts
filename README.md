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
