Basic terraform for kubernetes cluster
=



Getting json credentials
-
in UI 
IAM & admin
 1. Service accounts create service
 1. Choose appropriate role [admin over kube at the very least]
 1. Choose Account with key and json or create key separately
 1. Copy and run the command provided in the connect UI
 1. Run ```kubectl config get-contexts ``` To make sure you have context


timeouts are common retry a few times with good line connectivity

For some reason it inited with old version and needed some fixing that i did in the UI.
This should be fixed.


GCL
-
```
gcloud container node-pools create rtp --zone europe-west1-b --cluster rtp-0 --machine-type n1-standard-4




```
