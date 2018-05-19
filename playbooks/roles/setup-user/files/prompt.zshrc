# vim: ft=sh

### PROMPT
_prompt_return_code()
{
    if [[ $? -ne 0 ]]; then
        echo "%B%F{9}(%?)%f%b"
    fi
}

_prompt_right()
{
    echo "%(?.%F{192}✓%f.%B%F{1}%? ✗%f%b)"
}

set_prompt()
{
    RPROMPT="$(_prompt_right)"
    PROMPT="$(_prompt_return_code)%B%F{166}%n%f@%F{34}%m%f%b:%F{35}%~%f>
$ "
}

set_prompt

