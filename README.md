# EKS Cluster Upgrade Guide

## Step 1: Check Existing Version

```bash
aws eks describe-cluster \
--name project-eks \
--region us-east-1 \
--query "cluster.version"
```

Before going to upgrade we have to enable cordon to nodes to not deploy any pods on old node while doing version upgrade

```bash
kubectl cordon <old node>
kubectl cordon ip-10-0-3-8.ec2.internal
kubectl cordon ip-10-0-4-252.ec2.internal
```

## Step 2: Upgrade EKS Control Plane

Run:

```bash
aws eks update-cluster-version \
--region us-east-1 \
--name project-eks \
--kubernetes-version 1.32
```

## Step 3: Upgrade Node Groups

Once control plane upgrade completes, update worker nodes.

Option A — Rolling upgrade (recommended)

```bash
aws eks update-nodegroup-version \
  --cluster-name project-eks \
  --nodegroup-name eks-node-group \
  --kubernetes-version 1.32 \
  --region us-east-1
```

## Upgrade EKS Add-ons

Upgrade important components:

- CoreDNS
- kube-proxy
- VPC CNI

## Step 4: Upgrade Addons

Update each addon:

Example VPC CNI

```bash
aws eks update-addon \
--cluster-name project-eks \
--addon-name vpc-cni
```

Example CoreDNS

```bash
aws eks update-addon \
--cluster-name project-eks \
--addon-name coredns
```

Example kube-proxy

```bash
aws eks update-addon \
--cluster-name project-eks \
--addon-name kube-proxy
```

Example EBS CSI

```bash
aws eks update-addon \
--cluster-name project-eks \
--addon-name aws-ebs-csi-driver
```

Old node  
↓  
Drain  
↓  
Replace with new node  
↓  
Reschedule pods
