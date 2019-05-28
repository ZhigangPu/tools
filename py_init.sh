#! /bin/bash

init_project_dir() {
    mkdir config
    mkdir log
    mkdir src
    mkdir lib
    mkdir scripts
}

touch_ignore() {
    printf "out/\nlog/\nconfig/config.json" > .gitignore
}

copy_tools() {
    cp ~/project/tools/py_scripts/* ${PROJECT_HOME}/scripts/
}

copy_lib() {
    cp ~/project/tools/py_lib/* ${PROJECT_HOME}/lib/
}

init_config() {
    touch ${PROJECT_HOME}/config/config.json
    touch ${PROJECT_HOME}/config/config.example.json
}

init_src() {
	printf "#! /usr/bin/python3\n# author: ayron.pu\n" > ${PROJECT_HOME}/src/core.py
}

init_commit() {
    git add .
    git commit -m "[INIT] initialize project directory"
}

init_project() {
    init_project_dir
    touch_ignore
    copy_tools
    copy_lib
    init_config
    init_src
    init_commit
}

show_help() {
    echo "usage: py_init.sh -d ${YOUR_PROJECT_DIR}, e.g. py_init.py -d ./"
}

while getopts 'hd:' flag; do
    case "${flag}" in
        h) show_help ;;
        d) PROJECT_HOME="${OPTARG}"; init_project ;;
    esac
done
