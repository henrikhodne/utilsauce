basepath="$(dirname "$(readlink -f $0)")/utils"
PATH="$(echo "$PATH" | tr ':' '\n' | while read line; do
    [ "${line:0:${#basepath}}" = "$basepath" ] || echo $line
done | tr '\n' ':' | sed -e 's/:://g' -e 's/:$//' -e 's/^://')"
unset line
unset basepath

for pluginpath in "$(dirname "$(readlink -f $0)")"/utils/*; do
    [ -d "$pluginpath/bin" ] && PATH="$pluginpath/bin:$PATH" || PATH="$pluginpath:$PATH"
    [ -e "$pluginpath/profile.sh" ] && source "$pluginpath/profile.sh"
done

unset pluginpath

