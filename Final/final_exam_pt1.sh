#### Part 1: Final Exam, Chelsea Pretz

### Question 1: What is the command in UNIX terminal to create a plain-text?

notepad stuff.txt

### Question 2: What is the command that would the number of lines in a plain-text file named "foo.txt"

wc foo.txt

### Question 3: Write a one line command that pulls out the word "Hirundo" from "Birds.txt"

grep Hirundo Birds.txt

#### Part 2: git

### Question 4: What is "version control" in computer science terms? 
Version control is the ability to save certain times points for a document. May people will do a version control by saving files with different names, but this can get messy and confusing. Using programs version control can be done in a condensed manager only showing the current version, but still keeping previous versions.

### Question 5: What is git?
Git is a promgram that does version control in a clear condensed way. This is only a local version control.

#### Question 6: What is the difference between git and github?
Git is the version control program that is used on a local system. Github, like bitbucket and other online platforms, is a platform to save projects using git online. 

### Question 7: What are the three main commands used in git and github for people working on independent projects?

# Add all changes since last time (you can also change the start to specific file name)
git add *
# Commit the changes the have been made and add a message
git commit -m "Add more detail to the foo.txt, edit the README.md, ect"
# The first two steps are local and can be done without internet. 
# This step sends what is in the staging area to the online platform
git push -u origin masters

### Question 8: What is the command to look at the difference between the last commit of "bar.txt" and then the version from two commits ago?

# The difference from last commit
git diff bar.txt

# The difference from two times ago 
   # First find the commit number using git log
git log
   # Using that commit number
git diff [commitnumber]



