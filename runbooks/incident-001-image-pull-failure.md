# Incident 001 — Kubernetes Image Pull Failure

## Summary

A deployment failed because Kubernetes could not obtain the requested container image.

## Symptom

Deployment pods entered ImagePullBackOff / ErrImagePull.

## Investigation

Commands used:

```bash
kubectl get pods
kubectl describe pod <pod>
kubectl get events --sort-by=.lastTimestamp
kubectl get deployment devops-app -o yaml
kubectl get rs
Root cause
Image name is not exist or the container is not able to pull the image.
Resolution
Change correct Image name
Prevention
Always check the image name and wether it is accessible or not
Production equivalant
Consider how this failure would differ when using:

Amazon ECR
EKS
IAM
private registry authentication
image signing
CI/CD

