# michellundell/12a C/C++

## Agenda

1. Github actions
2. Assigment Setup a repository with github actions
3. Repetition

## 1. Github actions

Github actions is about automatically do actions on your code on specific actions like a commit, pull-request etc.
It can automatically perform things like compiling, run or test your program .. (anything you want).

Its great to use when managing a repository. Example: pull requests should at least be able to compile...
There is a lot of actions that could be performed, we will cover the most basic usage to check that a
pull request is compiled ...

1. Create a new repository
   Let github add a README file.
   Click on "Create repository"

2. Add an action

Click on the "(>)Actions"

Search workflows for "C++"

Select the "C/C++ with Make" workflow by clicking on  "Configure"

You will then see an editor with the code for your action that looks like:

```
name: C/C++ CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: configure
      run: ./configure
    - name: make
      run: make
    - name: make check
      run: make check
    - name: make distcheck
      run: make distcheck
```

Delete the following lines beneath the "steps:"

```
    - name: configure
      run: ./configure
    - name: make check
      run: make check
    - name: make distcheck
      run: make distcheck
```

Your action should now look like

```
name: C/C++ CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: make
      run: make
```

Now click on the green "Start Commit"

In the dialogue, the "Commit directly to main branch" should be checked. Then click on "Commit new file".

Now go back to your repository and click on "Add file"

The name should be "Makefile" with a capital letter M.

Change "Spaces" to "Tabs", and set it to 4 spaces.

Now in the Makefile write the following code:

```
target:
	echo "Running target"
	cc sample.c -o sample
	./sample
```

Scroll down and set "Commit directly to the main branch", and click "Commit new file"

Then add a new file by clicking on "Add file"

Name the file to sample.c

Add the following code to the file
```
#include <stdio.h>

int main(int argc, char **argv)
{
	printf("Here is sample.c\n");
	return(0);
}
```
Then scroll down and click "Commit new file"


So lets show what this all does....

Click on your sample.c
Edit it so it looks like


```
#include <stdio.h>

int main(int argc, char **argv)
{
	printf("Here is sample.c\n");
	printf("Here is another one"
	return(0);
}
```
Then scroll down and "Create a new branch for this commit and start a pull request. "

Then click "Propose changes"

Write a comment and click on "Create pull request"


At the "top" you see pull requests are increased, click on pull-requests ...

You will see a pull request we made has a red cross beside it. This means it did not pass the checks.

Select the pull-request

You will see something like
```
All checks have failed
     1 failing check

C/C++ CI / build (pull_request) Failing after 3s   Details
```
Now click on "Details" right of the "C/C++ CI build (pull_request)"

```
build
failed 5 minutes ago in 3s

Set up job
1s
Run actions/checkout@v3
1s
make
0s
1
Run make
4
cc sample.c -o sample
5
sample.c: In function ‘main’:
6
sample.c:6:36: error: expected ‘;’ before ‘return’
7
    6 |     printf("Hello from sample.c\n")
8
      |                                    ^
9
      |                                    ;
10
    7 |   return(0);
11
      |   ~~~~~~                            
12
make: *** [Makefile:2: target] Error 1
13
Error: Process completed with exit code 2.
Post Run actions/checkout@v3
0s
Complete job

```

Aha, by setting up an action, the code will automatically compile and the status is noted in the pull-request.
Nice, I don't want to merge any pull requests that does not compile!

Now, go back to your repository. 

Then select your branch "patch ..."

Click on the sample.c file, and edit it (click on the pen).

Add the missing semicolon (;) at the proper place after the added printf call.

Scroll down and make sure it is comitted to your branch

Click on "Commit changes"

Now click on you "pull requests" again ...

You should now see a green tick to the right of your pull request. Nice the pull request can now be merged and
the program can be compiled. 

## 2. Assigment Setup a repository with github actions

Create your own repository and make the steps of setting up an action that compiles your project.

Test it by making a branch of your code and create a pull-request and see what happens.
Simulate some errors, commit ... see what happens ...
Correct the errors, commit ... see what happens .

If you got time before lunch, try completing your C++ assignment.

If you haven't yet... add an action to compile it!


## 3.  Repetition
I will explain further anything you are unsure about in the previous lessons again.
Think about it and we do repetition of the topics you are unsure about.
The topic "everything" will not be accepted ,-)
