= git_submodule: |-
== Adding a submodule to a superproject.
  
  $ git submodule add <repository>
    Add the given repository as a submodule to the current git project.
  
== After cloning the superproject, the submodule directories will exist, but they will be empty.
  
  $ git submodule status
  Show the status of the submodules.
  
== Actually pulling down the submodules is a two-step process.
  
  $ git submodule init
  $ git submodule update
  
== Update A Submodule

  $ git remote update
  $ git merge origin/master
   OR
  $ git pull

=== Gotcha: submodules do not checkout master by default, it checks out a specific commit relative to the superproject (somewhat like a tag).  To do any work, make sure you checkout master or another branch.
  
  $ cd my_submodule
  $ git branch
  * (no branch)
    master
  $ git checkout master
  
=== Gotcha: when publishing (pushing) make sure you publish the submodule changes first, followed by the superproject.  Otherwise others will have problems cloning the repository.
  
  $ git commit -m "Updated the my_submodule from within the superproject."
  $ git push
  $ cd ..
  $ git add my_submodule
  $ git commit -m "Updated my_submodule."
  $ git push
