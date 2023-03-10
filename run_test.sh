#!/bin/sh

case $1 in
    trigger_pod_crash)
        cd devopsguru_eks_test
        ./uninstall_chart.sh
        sleep 180
        ./install_chart_misconfigured.sh
        cd ..
        ;;
    disable_pod_crash)
        cd devopsguru_eks_test
        ./uninstall_chart.sh
        sleep 180
        ./install_chart.sh
        cd ..
        ;;
    *)
        cd test_client
        python3 main.py --trigger $1
        cd ..
        ;;
esac