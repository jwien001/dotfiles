#!/bin/bash

__kube_ps1()
{
    # Get current context
    #CONTEXT=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
    #CONTEXT=$(kubectl config current-context 2>/dev/null)
    CONTEXT=$(kubectl config view --minify --output 'jsonpath={.current-context}' 2> /dev/null)

    if [ -n "$CONTEXT" ]; then
        echo "[${CONTEXT}]"
    fi
}
