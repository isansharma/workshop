# 8-Week Senior DevOps + AI Engineering Practice Program

## Audience and assumptions
- Target: DevOps engineer with approximately 6 years of experience.
- Existing knowledge: basic AWS, Jenkins, Kubernetes, Ansible, Linux and CI/CD.
- Duration: 8 weeks / 56 days.
- Effort: 5 hours per day, approximately 280 hours.
- Method: one production-style capstone, continuous troubleshooting, documentation and interview preparation.

## Daily structure
1. 60 min: theory and official documentation.
2. 150 min: hands-on implementation.
3. 60 min: break/fix lab or production scenario.
4. 30 min: notes, diagrams, interview questions and Git commits.

## Lab foundation

### Local environment
Use Ubuntu 24.04, Git, Docker, kubectl, Helm, kind or k3d, Terraform, Ansible, Python, Bash, jq, curl, yq and a local container registry. Use AWS only for short-lived labs where cost is controlled.

### Repository structure
```text
devops-platform/
  app/
  docker/
  terraform/
  ansible/
  kubernetes/
  helm/
  gitops/
  observability/
  security/
  ai-ops/
  runbooks/
  docs/
```

### Capstone application
Create a small API with:
- health, readiness and metrics endpoints;
- configurable environment variables;
- database dependency;
- structured JSON logs;
- unit and integration tests;
- Docker image;
- Kubernetes manifests and Helm chart;
- CI/CD pipeline;
- dashboards, alerts and tracing.

---

# Week 1 — Linux, Networking, Git and Production Troubleshooting

## Learning objectives
Move from command familiarity to system-level diagnosis.

### Topics
- Linux boot, processes, services, systemd and journald.
- CPU, memory, load average, disk I/O, inode exhaustion and file descriptors.
- Signals, process states, zombies and graceful shutdown.
- Filesystems, mounts, permissions, ACLs, capabilities and sudo.
- SSH hardening, key authentication, tunnels and bastion access.
- DNS, TCP/IP, UDP, HTTP/HTTPS, TLS, routing, NAT, proxies and load balancers.
- `ss`, `ip`, `dig`, `curl`, `tcpdump`, `traceroute`, `lsof`, `strace`, `vmstat`, `iostat`, `sar`.
- Git internals, rebase, cherry-pick, reflog, bisect, hooks and branching strategy.

## Hands-on labs
1. Build a systemd service for the capstone API.
2. Break permissions, ports, DNS and environment variables; diagnose each failure.
3. Simulate high CPU, memory pressure, disk-full and file-descriptor exhaustion.
4. Capture an HTTP request with tcpdump and inspect TLS with openssl.
5. Use `git bisect` to find a deliberately introduced defect.
6. Write a Linux production troubleshooting runbook.

## Deliverables
- Linux troubleshooting cheat sheet.
- Network troubleshooting decision tree.
- Git workflow document.
- Five incident reports using: symptom → hypothesis → evidence → fix → prevention.

## Resources
- Linux man pages: https://man7.org/linux/man-pages/
- The Linux Command Line: https://linuxcommand.org/tlcl.php
- Pro Git: https://git-scm.com/book/en/v2
- Julia Evans networking zines: https://wizardzines.com/

---

# Week 2 — Docker, Containers and Kubernetes Core

## Topics
- Container namespaces, cgroups, overlay filesystems and image layers.
- Dockerfile optimization, multi-stage builds, build cache and reproducibility.
- Rootless containers, non-root images, capabilities and read-only filesystems.
- Image tagging, digests, registries, signing and vulnerability scanning.
- Kubernetes API, control plane, scheduler, controller manager and etcd.
- Pods, Deployments, ReplicaSets, Services, Ingress/Gateway API.
- ConfigMaps, Secrets, probes, requests/limits, QoS and scheduling.
- Volumes, StatefulSets, Jobs, CronJobs and PodDisruptionBudgets.
- Labels, selectors, annotations and owner references.

## Hands-on labs
1. Build a small image under 100 MB where practical.
2. Run it as a non-root user with a read-only root filesystem.
3. Deploy it to kind/k3d.
4. Add readiness, liveness and startup probes.
5. Configure resource requests/limits and test OOM behavior.
6. Break Service selectors, probes and image tags; troubleshoot.
7. Create a Helm chart with values for dev/stage/prod.

## Deliverables
- Secure Dockerfile.
- Helm chart.
- Kubernetes troubleshooting runbook.
- Architecture diagram of the cluster.

## Resources
- Docker docs: https://docs.docker.com/
- Kubernetes docs: https://kubernetes.io/docs/
- Kubernetes tutorials: https://kubernetes.io/docs/tutorials/
- Helm docs: https://helm.sh/docs/

---

# Week 3 — AWS, Terraform and Ansible

## AWS topics
- IAM users, roles, policies, STS and least privilege.
- VPC, subnets, route tables, NAT, security groups and NACLs.
- EC2, ALB, Auto Scaling, S3, RDS, ECR, CloudWatch and Systems Manager.
- Availability Zones, multi-AZ design and backup strategy.
- Cost controls, tagging, budgets and temporary lab accounts.
- EKS architecture, node groups, IAM roles for service accounts/workload identity.

## Terraform topics
- Providers, resources, data sources, variables, outputs and locals.
- State, locking, remote backends and state security.
- Modules, composition, workspaces and environment separation.
- Plan/apply lifecycle, drift, import, taint/replacement and dependency graphs.
- Testing, formatting, validation, policy as code and CI checks.
- Secrets management and avoiding secrets in state.

## Ansible topics
- Inventory, variables, facts, handlers and idempotency.
- Roles, templates, conditionals, loops and tags.
- Vault, check mode, diff mode and error handling.
- Dynamic inventory and cloud provisioning.
- Ansible versus Terraform: provisioning vs configuration.

## Hands-on labs
1. Provision a VPC, subnets, security groups and an EC2 host with Terraform.
2. Configure the host using Ansible.
3. Build reusable Terraform modules and Ansible roles.
4. Store state remotely and demonstrate state locking.
5. Introduce drift and detect/remediate it.
6. Deploy the application to ECR and EKS or a local Kubernetes cluster.
7. Add cost tags and destroy all temporary resources.

## Deliverables
- Terraform module repository.
- Ansible role collection.
- AWS reference architecture.
- IAM least-privilege policy examples.
- Cost and teardown checklist.

## Resources
- Terraform docs: https://developer.hashicorp.com/terraform/docs
- AWS Well-Architected: https://aws.amazon.com/architecture/well-architected/
- AWS EKS best practices: https://aws.github.io/aws-eks-best-practices/
- Ansible docs: https://docs.ansible.com/

---

# Week 4 — CI/CD, GitOps and Release Engineering

## Topics
- CI principles, pipeline design and artifact promotion.
- Jenkins controllers, agents, credentials, shared libraries and pipeline-as-code.
- Build isolation, caching, parallel stages and pipeline resilience.
- Unit, integration, contract, security and smoke tests.
- Artifact repositories, immutable versioning and provenance.
- GitOps principles, reconciliation and desired state.
- Argo CD, sync waves, health checks, drift and rollback.
- Helm release management.
- Blue/green, canary, rolling and progressive delivery.
- Database migrations and backward-compatible releases.
- Feature flags, change management and release metrics.

## Hands-on labs
1. Build a Jenkins pipeline: lint → test → build → scan → publish → deploy.
2. Add a shared Jenkins library.
3. Add SBOM and image scanning.
4. Promote the same immutable image through environments.
5. Install Argo CD and deploy from Git.
6. Simulate drift and recover through reconciliation.
7. Implement blue/green or canary deployment.
8. Create a failed deployment and execute rollback.

## Deliverables
- Complete CI/CD pipeline.
- GitOps repository.
- Release strategy document.
- Rollback runbook.
- DORA metrics dashboard or report.

## Resources
- Jenkins docs: https://www.jenkins.io/doc/
- Argo CD docs: https://argo-cd.readthedocs.io/
- OpenGitOps: https://opengitops.dev/
- DORA: https://dora.dev/

---

# Week 5 — Observability, SRE and Reliability

## Topics
- Metrics, logs, traces and profiles.
- OpenTelemetry architecture and instrumentation.
- Prometheus, exporters, PromQL, recording rules and Alertmanager.
- Grafana dashboards and alert design.
- Loki or Elasticsearch/OpenSearch for logs.
- Distributed tracing with Tempo or Jaeger.
- SLIs, SLOs, SLAs, error budgets and burn-rate alerts.
- Incident response, severity, escalation and communication.
- Postmortems, blameless culture and corrective actions.
- Capacity planning, load testing and performance budgets.
- High availability, graceful degradation, retries, timeouts, circuit breakers and backpressure.

## Hands-on labs
1. Instrument the application with metrics and traces.
2. Deploy Prometheus and Grafana.
3. Create RED and USE dashboards.
4. Configure alerts for latency, error rate, saturation and availability.
5. Add structured logs and correlation IDs.
6. Run load tests with k6.
7. Introduce latency, errors, CPU pressure and dependency failure.
8. Write a complete incident postmortem with SLO impact.

## Deliverables
- Observability stack.
- Four dashboards.
- Alert rules with runbooks.
- SLO document.
- Two game-day reports.

## Resources
- Google SRE books: https://sre.google/books/
- OpenTelemetry docs: https://opentelemetry.io/docs/
- Prometheus docs: https://prometheus.io/docs/
- Grafana docs: https://grafana.com/docs/

---

# Week 6 — DevSecOps, Kubernetes Security and Advanced Cloud

## Topics
- Threat modeling and security ownership.
- Secrets management, KMS, Vault and external secret operators.
- IAM, workload identity and short-lived credentials.
- Container image scanning, SBOM, signing and provenance.
- SAST, SCA, DAST and IaC scanning.
- Kubernetes RBAC, NetworkPolicies, admission control and Pod Security Standards.
- Kyverno or OPA Gatekeeper policy as code.
- Supply-chain attacks, dependency pinning and protected branches.
- TLS, mTLS, certificate rotation and ingress security.
- Backup, restore, RTO, RPO and disaster recovery.
- Multi-account AWS design, landing zones and guardrails.
- Service mesh concepts and when not to use one.

## Hands-on labs
1. Scan images with Trivy.
2. Generate an SBOM with Syft or an equivalent tool.
3. Sign an image and verify it in CI.
4. Enforce non-root, dropped capabilities and resource limits with Kyverno.
5. Create namespace isolation using RBAC and NetworkPolicies.
6. Remove static cloud credentials and use workload identity where available.
7. Encrypt secrets and demonstrate rotation.
8. Back up and restore Kubernetes application state.
9. Write a threat model for the platform.

## Deliverables
- Security gates in CI/CD.
- Kubernetes policy bundle.
- Threat model.
- Disaster recovery runbook.
- Security incident response checklist.

## Resources
- Kubernetes security: https://kubernetes.io/docs/concepts/security/
- OWASP: https://owasp.org/
- Trivy: https://trivy.dev/
- Kyverno: https://kyverno.io/docs/
- NIST SSDF: https://csrc.nist.gov/Projects/ssdf

---

# Week 7 — Platform Engineering, Advanced Kubernetes and AI for DevOps

## Platform engineering
- Internal Developer Platforms and developer experience.
- Golden paths, templates and self-service workflows.
- Backstage concepts and software catalogs.
- Crossplane concepts for infrastructure APIs.
- Multi-tenancy, quotas, namespaces and platform guardrails.
- Cluster autoscaling, Karpenter concepts and workload autoscaling.
- KEDA, event-driven scaling and queue-based architectures.
- Multi-cluster strategy, fleet management and disaster recovery.
- Cost allocation, FinOps and idle-resource cleanup.

## Advanced Kubernetes
- CRDs, controllers, operators and reconciliation.
- Admission webhooks and API aggregation.
- Scheduling, affinity, taints, topology spread and priority classes.
- etcd backup and recovery.
- Gateway API, ingress security and traffic management.
- GPU scheduling concepts, node pools and resource isolation.

## AI trends to study and practice
- AI-assisted coding and infrastructure generation.
- Agentic workflows: agents that inspect repositories, run tests and propose changes.
- MCP-style tool integration and tool permission boundaries.
- RAG over internal runbooks, architecture documents and incident history.
- AIOps: alert grouping, anomaly detection, incident summarization and root-cause assistance.
- LLM observability: latency, token usage, cost, model errors, tool calls and evaluation.
- AI security: prompt injection, data leakage, excessive agency, insecure tool execution and supply-chain risk.
- Human-in-the-loop approvals for production changes.
- AI workload operations: model serving, GPU capacity, autoscaling and inference cost.
- Evaluation: groundedness, correctness, regression tests and red-team cases.

## Hands-on labs
1. Create a platform template that generates a service repo, Dockerfile, Helm chart and CI pipeline.
2. Build a local RAG assistant over your runbooks using an embedding model and vector store.
3. Build a read-only incident assistant that queries logs/metrics and produces a cited diagnosis.
4. Add approval before any write action.
5. Create an MCP-like tool interface for safe commands such as `get_pods`, `get_events` and `get_deployment`.
6. Evaluate the assistant against 20 known incidents.
7. Add prompt-injection and secret-exfiltration tests.
8. Run a local model with Ollama or use a low-cost hosted API; track latency and token cost.

## Deliverables
- Platform template.
- Runbook RAG assistant.
- Read-only incident agent.
- AI threat model.
- Evaluation report and cost dashboard.

## Resources
- Kubernetes Agent Sandbox: https://kubernetes.io/blog/2026/03/20/running-agents-on-kubernetes-with-agent-sandbox/
- Google production AI agents guide: https://cloud.google.com/blog/products/ai-machine-learning/a-devs-guide-to-production-ready-ai-agents
- OpenTelemetry: https://opentelemetry.io/
- Backstage: https://backstage.io/docs/
- MCP specification: https://modelcontextprotocol.io/
- Ollama: https://ollama.com/
- LangGraph: https://langchain-ai.github.io/langgraph/

---

# Week 8 — Capstone, Failure Engineering and Interview Readiness

## Capstone requirements
Deploy the application through the full platform:

1. Developer commit.
2. Automated tests and linting.
3. Image build and vulnerability scan.
4. SBOM and image signing.
5. Artifact publication.
6. GitOps update.
7. Kubernetes deployment.
8. Metrics, logs and traces.
9. Alerting and incident response.
10. Rollback and postmortem.
11. AI assistant provides read-only operational support.
12. Human approval is required for production-changing actions.

## Failure scenarios
Practice at least 12:
- bad image tag;
- failing readiness probe;
- CrashLoopBackOff;
- OOMKilled;
- DNS failure;
- Service selector mismatch;
- broken ingress/TLS;
- expired certificate;
- node pressure;
- Terraform drift;
- leaked secret in CI;
- failed database migration;
- noisy alert storm;
- GitOps drift;
- unavailable dependency;
- excessive cloud cost.

## Architecture review
Explain:
- why each component exists;
- alternatives considered;
- failure modes;
- security boundaries;
- scaling limits;
- cost drivers;
- backup and recovery;
- observability strategy;
- deployment and rollback strategy;
- how AI is controlled and evaluated.

## Interview preparation
Prepare concise, practical answers for:
- Design a highly available AWS platform.
- Debug a Kubernetes production outage.
- Design a secure CI/CD pipeline.
- Explain Terraform state and drift.
- Design GitOps for multiple environments.
- Define and calculate an SLO.
- Handle a secret leak.
- Reduce cloud cost without harming reliability.
- Design multi-tenant Kubernetes.
- Explain how an AI agent can safely operate infrastructure.
- Compare Jenkins, GitHub Actions and GitLab CI.
- Compare Helm, Kustomize and operators.
- Explain when not to use Kubernetes or a service mesh.

## Final deliverables
- Git repository with complete capstone.
- Architecture and threat-model diagrams.
- CI/CD and GitOps configuration.
- Terraform and Ansible code.
- Observability dashboards and alerts.
- Security policy bundle.
- Disaster recovery and incident runbooks.
- AI assistant with evaluation results.
- Ten STAR-format project stories.
- Resume bullets based on measurable outcomes.

---

# Weekly time allocation

| Week | Main focus | Hours |
|---|---|---:|
| 1 | Linux, networking, Git, troubleshooting | 35 |
| 2 | Docker and Kubernetes | 35 |
| 3 | AWS, Terraform, Ansible | 35 |
| 4 | CI/CD and GitOps | 35 |
| 5 | Observability and SRE | 35 |
| 6 | DevSecOps and advanced cloud | 35 |
| 7 | Platform engineering and AI | 35 |
| 8 | Capstone and interviews | 35 |
| **Total** | | **280** |

# Rules for effective practice

- Do not only follow tutorials; break systems deliberately.
- Keep all code in Git and make daily commits.
- Write a short runbook for every failure you solve.
- Prefer official documentation for final verification.
- Use local Kubernetes for most experiments and short-lived cloud resources for AWS-specific labs.
- Never give an AI agent unrestricted production credentials.
- Make AI actions read-only by default and require explicit approval for changes.
- Measure outcomes: deployment frequency, lead time, failure rate, recovery time, latency, cost and security findings.
- At the end of each week, explain the architecture aloud without notes.

# Suggested certification/reference alignment

This roadmap supports preparation for:
- AWS Solutions Architect Associate/Professional topics.
- Certified Kubernetes Administrator (CKA).
- Certified Kubernetes Security Specialist (CKS).
- Terraform Associate concepts.
- SRE and platform engineering interviews.

Certifications are optional; the capstone and troubleshooting evidence are the primary proof of skill.
