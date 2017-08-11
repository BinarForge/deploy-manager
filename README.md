# deploy-manager
exploring custom continuous integration solution for fun and learning


## v0.0.1 - simple bash deploy script
Idea prototyping. Script is cloning the git repository into workspace directory (create one if does not exist), runs the npm i & npm bundle commands (hardcoded for now) and then uploads it via SSH using rsync. Script is finished with workspace cleanup.