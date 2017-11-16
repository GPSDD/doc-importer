#!/bin/bash

case "$1" in
    pull-sub)
        (cd executor && git pull origin $2)
        (cd orchestrator && git pull origin $2)
        (cd writter && git pull origin $2)
        ;;
    co-sub)
        (cd executor && git checkout $2)
        (cd orchestrator && git checkout $2)
        (cd writter && git checkout $2)
        ;;

    develop)
        type docker-compose >/dev/null 2>&1 || { echo >&2 "docker-compose is required but it's not installed.  Aborting."; exit 1; }
        docker-compose -f docker-compose-develop.yml build && docker-compose -f docker-compose-develop.yml up
        ;;
    test)
        type docker-compose >/dev/null 2>&1 || { echo >&2 "docker-compose is required but it's not installed.  Aborting."; exit 1; }
        docker-compose -f docker-compose-test.yml build && docker-compose -f docker-compose-test.yml up
        ;;
  *)
        echo "Usage: doc-importer.sh {test-e2e|test-unit|start|develop|test}" >&2
        exit 1
        ;;
esac

exit 0
