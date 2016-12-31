GitLab's New Project/Init Repo Example
=======================

# Git global setup

```
git config --global user.name "Tom Kuecken"
git config --global user.email "tomkuecken@gmail.com"
```

# Create a new repository

```
git clone git@gitlab.com:tomkuecken/a.git
cd a
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```

# Existing folder or Git repositoory

```
cd existing_folder
git init
git remote add origin git@gitlab.com:tomkuecken/a.git
git add .
git commit
git push -u origin master
```