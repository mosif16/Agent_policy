# Codex Sandbox Limitations — September 22, 2025

## Context
- Codex executes tasks inside a sandboxed environment to protect local systems, enforce approvals, and contain risky commands. citeturn0search1turn0search4
- Sandbox behavior varies by operating system and configuration flags, so teams must validate policies per deployment target. citeturn0search4turn0search6

## Sandbox Architecture
- **macOS:** Codex wraps commands with Apple Seatbelt (`sandbox-exec`), restricting writes to project-scoped directories and blocking outbound network traffic. citeturn0search0turn0search4
- **Linux:** CLI relies on Landlock/seccomp or Docker-based isolation; misconfigured containers can disable sandbox guarantees, triggering fallback errors. citeturn0search4turn0search7
- **Windows:** Requires WSL2; native Windows execution fails because sandbox drivers are unavailable. citeturn0search0turn0search7

## Operational Modes & Approvals
- Modes (`--suggest`, `--auto-edit`, `--full-auto`) adjust approval prompts and sandbox strictness, ranging from read-only auto approvals to full workspace-write autonomy. citeturn0search4turn0search6
- Approval settings (`--ask-for-approval`) determine when Codex can rerun commands outside the sandbox after failures, which is required for networked installs like `npm install`. citeturn0search4

## Network & Resource Constraints
- Default sandboxes deny outbound network access; opting in to egress is manual and recommended only when necessary to fetch dependencies or documentation. citeturn0search0turn0search3turn0search5turn0search11
- Sandbox resources (CPU, memory, execution time) are finite; long-running tests or large datasets can hit timeouts or exceed context windows, requiring task segmentation. citeturn0search2turn0search5

## Execution Workflow Limitations
- Tasks run asynchronously with limited mid-task intervention; users must cancel and re-issue instructions to correct course. citeturn0search2
- Codex cannot interact with GUIs or visual assets directly; sandboxed runs focus on code and command-line tooling. citeturn0search2

## Data Handling & Compliance
- Documentation notes that Zero Data Retention (ZDR) organizations may be blocked because Codex relies on stored responses; workaround requires disabling response storage. Conflicting guidance across releases necessitates policy verification before rollout. citeturn0search0turn0search4
- Codex transmits prompts, summaries, and diffs to OpenAI’s API; sensitive repositories should enforce manual redaction and run additional security reviews. citeturn0search10

## Known Issues & Failure Cases
- `Sandbox was mandated, but no sandbox is available!` errors arise when OS-level isolation APIs are missing (e.g., WSL2 misconfiguration); remediate by adjusting Docker/WSL sandbox support or relaxing flags within a trusted container. citeturn0search7turn0search4
- Sandbox cache conflicts and Node.js instability can interrupt sessions; restarting Codex or clearing temporary directories is a common workaround. citeturn0search10

## Mitigation Checklist
- Validate sandbox mode on every machine (Seatbelt profile test on macOS, Landlock/seccomp capability check on Linux). citeturn0search4turn0search6
- Maintain approval defaults (`--ask-for-approval untrusted`) when working on regulated codebases; only escalate to `on-failure` or `never` within air-gapped containers. citeturn0search4turn0search6
- Provide mock services and seeded data to compensate for blocked network/API dependencies. citeturn0search3turn0search11
- Split large or long-running tasks into smaller prompts to avoid sandbox timeouts and expedite review cycles. citeturn0search2turn0search5
- Document ZDR configuration decisions and verify compliance with organizational data-retention policies before enabling Codex on production repositories. citeturn0search0turn0search4

## Future Outlook
- OpenAI indicates plans for more interactive task steering and optional internet access, which may loosen current sandbox constraints but will require revisiting governance controls. citeturn0search2turn0search3
