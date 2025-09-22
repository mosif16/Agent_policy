<?xml version="1.0" encoding="UTF-8"?>
<Swift6AgentGuidelines date="2025-09-20" version="1.0">
  <Scope>
    <Assumption>Xcode 16.x on macOS 14.5+ with the bundled Swift 6 toolchain.</Assumption>
    <Assumption>Targets include iOS, macOS, tvOS, watchOS, and visionOS apps or Swift packages consumed by those apps.</Assumption>
    <Assumption>Agent interventions focus on enforceable, auditable changes and documentation updates.</Assumption>
  </Scope>
  <OperatingPrinciples>
    <Principle id="P1">Prefer incremental, target-scoped migrations so Xcode diagnostics stay reviewable.</Principle>
    <Principle id="P2">Keep Strict Concurrency at Complete before raising SWIFT_VERSION to 6.0.</Principle>
    <Principle id="P3">Document every escape hatch (`@preconcurrency`, `@unchecked Sendable`, `nonisolated(unsafe)`) with a removal owner and date.</Principle>
    <Principle id="P4">Mirror Xcode build settings in CI and SwiftPM to avoid divergent diagnostics.</Principle>
    <Principle id="P5">Leverage Xcode tooling (Swift Assist, Instruments) but require human review before shipment.</Principle>
  </OperatingPrinciples>
  <Setup>
    <Action priority="high">Verify `SWIFT_VERSION=6.0` and `SWIFT_STRICT_CONCURRENCY=Complete` in project, target, and `.xcconfig` layers before code modifications.</Action>
    <Action priority="high">Ensure Swift packages referenced by the project enable Strict Concurrency using the appropriate upcoming-feature flags.</Action>
    <Action priority="medium">Capture toolchain build numbers (e.g., Xcode 16.1 (16A123)) in change logs for traceability.</Action>
  </Setup>
  <MigrationWorkflow>
    <Step index="1">Select a module with manageable blast radius (UI or leaf frameworks) and freeze feature work.</Step>
    <Step index="2">Resolve Strict Concurrency diagnostics surfaced by Xcode 16 before toggling Swift 6 language mode.</Step>
    <Step index="3">Update documentation and dashboards with module status, outstanding warnings, and dependency blockers.</Step>
    <Step index="4">Repeat for the next module, auditing shared utilities and binary dependencies between iterations.</Step>
  </MigrationWorkflow>
  <ConcurrencySafety>
    <Rule id="C1">Replace shared mutable globals with actors or `@MainActor`-isolated constructs; only allow `nonisolated(unsafe)` under documented escalation.</Rule>
    <Rule id="C2">Require `Sendable` annotations at public boundaries and review unchecked conformances each release.</Rule>
    <Rule id="C3">Adopt Swift 6 Synchronization APIs (`Atomic`, `Mutex`, `Latch`) instead of bespoke locking primitives.</Rule>
    <Rule id="C4">Introduce noncopyable (`~Copyable`) types for scarce resources and expose copyable facades only when legacy consumers need them.</Rule>
    <Rule id="C5">Adopt typed throws where error domains are closed so Xcode fix-its can guide exhaustive handling.</Rule>
  </ConcurrencySafety>
  <ToolingDiagnostics>
    <Directive id="T1">Run Instruments ➝ Swift Concurrency template on device builds after each major migration step.</Directive>
    <Directive id="T2">Use Swift Assist for scaffolding but require code review confirmation prior to merge.</Directive>
    <Directive id="T3">Monitor Xcode release notes and forum advisories for concurrency-related toolchain regressions.</Directive>
  </ToolingDiagnostics>
  <TestingAutomation>
    <Guideline id="TA1">Author new suites with Swift Testing (`@Suite`, `@Test`, `#expect/#require`) and tag concurrency-sensitive cases for Xcode Cloud filters.</Guideline>
    <Guideline id="TA2">Keep legacy XCTest only for APIs that demand it (UI, performance) and plan phased retirement.</Guideline>
    <Guideline id="TA3">Align CI commands (`swift test --enable-upcoming-feature StrictConcurrency` or Swift 6 native) with local Xcode diagnostics.</Guideline>
  </TestingAutomation>
  <Dependencies>
    <Policy id="D1">Track Swift Package readiness via maintainers’ Swift 6 declarations; escalate blockers to upstream owners.</Policy>
    <Policy id="D2">Wrap lagging dependencies in dedicated modules with documented shims and removal targets.</Policy>
    <Policy id="D3">Re-test binary dependencies after every Xcode point release to catch toolchain-level fixes (e.g., `withCheckedContinuation`).</Policy>
  </Dependencies>
  <LivingChecklist>
    <Metric name="swiftVersion">Target-specific Swift language mode (5.x vs 6.0).</Metric>
    <Metric name="strictConcurrency">Strict Concurrency level (Minimal, Targeted, Complete).</Metric>
    <Metric name="typedThrowsCoverage">Percentage of public APIs adopting typed throws where appropriate.</Metric>
    <Metric name="escapeHatches">Count of active escape hatches with owners and removal dates.</Metric>
    <Metric name="toolchainVersion">Current Xcode build verified against project.</Metric>
  </LivingChecklist>
  <References>
    <Reference id="R1" source="Swift.org" title="Swift Concurrency Adoption Guidelines" accessed="2025-09-20"/>
    <Reference id="R2" source="Donny Wals" title="How to plan a migration to Swift 6" updated="2025-07-07"/>
    <Reference id="R3" source="Swift.org Blog" title="Announcing Swift 6" published="2024-09-10"/>
    <Reference id="R4" source="Apple Developer Documentation" title="Swift Testing" accessed="2025-09-20"/>
    <Reference id="R5" source="InfoWorld" title="Apple's Xcode 16 adds AI-powered code completion" published="2024-06-13"/>
    <Reference id="R6" source="Apple Developer Forums" title="Swift 6 without SWIFT_STRICT_CONCURRENCY=COMPLETE" accessed="2025-09-20"/>
  </References>
</Swift6AgentGuidelines>
