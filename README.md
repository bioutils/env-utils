# README for `export_env`

simple bash function to export .env, or any specified file.env.

will not export comment lines

equivalent to `export $(grep -v '^#' my_custom.env | xargs)`

## USAGE
```
source export_env.sh

# export .env to environmental variables
_export_env 

# specify file.env
_export_env custom.env
```


## Walkthrough
Showing functionality

### test first, baseline
```
# should be empty - 
echo $SOMEVAR

python3 printest.py

bash printest.sh
```

### load function
```
export export_env.sh
```

### test nothing is exported yet
...

### Run function
```
# default usage, looking for .env
_export_env 

# specify custom env file
_export_env custom.env

# test error handling with non-existent file
_export_env junk.env
File junk.env not found!

# test that comment lines are not exported
_export_env comment.env
```

### now test again
...

### Also note
a variable can be in bash scope, but not environmental variable/session scope

```
$ SOMEVAR="yuck"
$ echo $SOMEVAR
yuck
$ bash printest.sh
$
```

unset variable (make sure to not use $SOMEVAR)
```
$ unset SOMEVAR 
$ echo $SOMEVAR
```

get list of all environmental variables
```
$ env
```


