#! /bin/bash


isItInstalled(){
    local res=$(apt-cache policy $1)
    #res
    echo $res | grep Installed > /dev/null
    if [ $? -eq 1 ]
    then
        echo "$1 not found"
        return 2
    else
        echo $res | grep 'Installed:' | awk {'print $3'}
        # var=$(echo "$myvar" | awk {'print $3'})
        restwo=$(grep 'Installed'<<<"$res")
        # restwo=$(grep -F 'Installed:' $res)
        echo $restwo
        # if [ $res_two -z ]
        # then
        #     echo "$1 not installed"
        #     return 1
        # fi
    fi

    # local res=$(apt-cache policy $1 | grep Installed | awk {'print $2'})
    # #echo $res
    # if [ $res == "(none)" ]
    # then
    #     #echo 'false'
    #     return 1
    # else
    #     #echo "true"
    #     return 0
    # fi
}

echo "A Real (installed) Package"
isItInstalled 'npm'
echo $?
echo "A Fake Package"
isItInstalled 'somethingElse'
echo $?
echo" A Real (UNinstalled) Package"
isItInstalled 'pkg-js-tools'
echo $?
echo "An Indeterminate Package:"
isItInstalled 'node'
echo $?

