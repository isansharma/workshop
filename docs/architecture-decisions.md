# Architecture Decision Records

## ADR-001: Local Kubernetes

### Decision

Use kind for the initial local Kubernetes environment.

### Reason

The workshop requires Kubernetes functionality without requiring
a continuously running cloud cluster.

### Alternatives

- Minikube
- k3d
- Docker Desktop Kubernetes
- EKS

### Consequences

Positive:
- low cost
- reproducible
- fast cluster creation
- works well with Docker

Limitations:
- not identical to production EKS
- local networking differs from cloud networking
- limited multi-node resources

---

## ADR-002: Local AI

### Decision

Use Ollama for local model execution.

### Reason

The workstation contains an RTX 3070 Ti and can run suitable
quantized models locally.

### Security principle

AI tools should initially have read-only access to workshop data
and should not receive unrestricted infrastructure credentials.

---

## ADR-003: Infrastructure as Code

### Decision

Use Terraform for infrastructure provisioning.

### Configuration management

Use Ansible where host configuration management is appropriate.

---

## ADR-004: GitOps

### Decision

Introduce GitOps after CI/CD fundamentals are established.

### Candidate tooling

Argo CD.

