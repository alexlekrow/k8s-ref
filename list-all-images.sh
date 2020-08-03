#!/usr/bin/env bash
# Stolen from https://kubernetes.io/docs/tasks/access-application-cluster/list-all-running-container-images/
# The command below will recursively return all fields named image for all items returned.
kubectl get pods --all-namespaces -o jsonpath="{..image}" |\
tr -s '[[:space:]]' '\n' |\
sort |\
uniq -c

#------------------------------------------------------------------------------------------------------------------
# As an alternative, it is possible to use the absolute path to the image field within the Pod. 
# This ensures the correct field is retrieved even when the field name is repeated, e.g. many fields are called 
# name within a given item:

#kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}"
#The jsonpath is interpreted as follows:

# .items[*]: for each returned value
# .spec: get the spec
# .containers[*]: for each container
# .image: get the image
