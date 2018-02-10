#! /bin/sh

# run python application in virtualenv
#
# Example:
#   virtualenv venv && venv/bin/activate
#   pip install my-app
#   deactivate
#
#   ./run_in_pyenv.sh /dir/to/pyenv my-app [args...]
#
#   alias my-app="run_in_pyenv.sh /dir/to/pyenv my-app"
#   my-app [args...]


if [[ $# -lt 2 ]]; then
    echo "Usage: $(basename $0) VENV_PATH ENTRY_POINT"
    exit 1
fi;

venv=$1;
app=$2;
shift 2

(source "$venv/bin/activate" > /dev/null; "$app" "$@"; deactivate)

