# Swift 6 Best Practices for Xcode 16 (September 20, 2025)

## Scope & Assumptions
- Targets are built with Xcode 16.x on macOS 14.5 or later, using the Swift 6 compiler bundled with the toolchain.
- Guidance favors production iOS, macOS, tvOS, watchOS, and visionOS apps using Swift 6 language mode or staged adoption via upcoming-feature flags.
- Treat this as a baseline checklist—extend with team automation (CI, lint rules, dashboards) and product-specific guardrails.

## Xcode Setup & Build Settings
- Confirm projects compile with the Xcode 16 toolset so you can use Swift Assist, predictive completion, updated previews, and enhanced diagnostics during migration; these features accelerate iteration and surface Swift 6 issues inline.
- Set the `SWIFT_VERSION` build setting to `6.0` per target when you are ready to commit to the new language mode; use per-configuration overrides (Debug vs. Release) only as a short-term escape hatch.
- Enable Strict Concurrency Checking (`SWIFT_STRICT_CONCURRENCY`) at the target level, progressing Minimal → Targeted → Complete while still in Swift 5.x compatibility mode. Lock it to Complete before flipping `SWIFT_VERSION` so Xcode-derived warnings become Swift 6 errors before the language mode change.
- If you manage settings through `.xcconfig` files, commit explicit values for both `SWIFT_VERSION` and `SWIFT_STRICT_CONCURRENCY` to keep CI, Xcode, and SwiftPM in sync.
- For Swift packages embedded in Xcode projects, add `.enableUpcomingFeature("StrictConcurrency")` (Swift 6 tools) or `.enableExperimentalFeature("StrictConcurrency")` (Swift 5.10 tools) so Xcode and command-line builds report the same diagnostics.

## Migration Workflow in Xcode
- Take an inventory of modules and dependencies, then migrate one target at a time: enable Complete checking on a scoped module (UI layers often migrate first with `@MainActor` defaults), clear warnings, and only then raise its `SWIFT_VERSION`.
- Keep migration branches short-lived. Apply a feature freeze on the module you are upgrading so code review attention stays on concurrency fixes rather than unrelated feature churn.
- Capture third-party and internal dependencies that still compile in Swift 5 mode. Track required shims (`@preconcurrency`, `@unchecked Sendable`, `nonisolated(unsafe)`) in an inventory so you can remove them once upstream updates ship.
- When Xcode surfaces unexpected diagnostics, check current release notes and Developer Forum threads before disabling checks; new toolchain builds often clarify defaults (for example, Xcode 16 defaults to Swift 5 language mode unless you explicitly raise `SWIFT_VERSION`).

## Concurrency Safety Patterns
- Replace shared mutable globals with actors or `@MainActor`-isolated types. Mark any temporary `nonisolated(unsafe)` escape hatches with tracking issues and removal dates.
- Require `Sendable` at public boundaries. Review unchecked conformances each release to catch newly `Sendable`-safe dependencies.
- Prefer the Swift 6 Synchronization library (atomic operations, new mutex API) over custom locking so the compiler can reason about ownership.
- Introduce noncopyable (`~Copyable`) types for scarce resources such as file handles or GPU buffers. Provide copyable facades only when legacy callers need value semantics.
- Adopt typed throws in APIs where error domains are well-bounded so Xcode can surface precise fix-it suggestions and call-site exhaustiveness checks.

## Tooling & Diagnostics in Xcode
- Run Instruments’ Swift Concurrency template (Product → Profile) on device builds to visualize tasks, actors, and suspension points; use the timeline to spot accidental MainActor hops or runaway detached tasks.
- Use Swift Assist and predictive code completion to scaffold migration work, but require reviewer validation before committing generated code.
- Monitor Xcode dot releases and forum threads for concurrency fixes; the Swift 6 compiler defaults to Swift 5 language mode, so verify `SWIFT_STRICT_CONCURRENCY` stayed at Complete after each update before publishing builds.

## Testing & Automation
- Standardize on Swift Testing for new unit suites: declare suites with `@Suite`, tests with `@Test`, and adopt `#expect`/`#require` for intent-revealing assertions. Keep XCTest targets only for UI and performance APIs that still require it.
- In CI, run `swift test --enable-upcoming-feature StrictConcurrency` (Swift 5.10) or native Swift 6 builds to ensure command-line diagnostics match what Xcode developers see.
- Tag Swift Testing cases (for example `.tags(.concurrency)`) so the Xcode Test navigator and Xcode Cloud can filter long-running or device-specific suites.
- Prefer async test helpers over legacy expectations; Swift Testing integrates with actors so `await`ing actor calls keeps tests readable and surfaces isolation violations early.

## Dependency & Ecosystem Readiness
- Track Swift Package dependencies’ Swift 6 support status. Encourage maintainers to adopt Strict Concurrency and publish updated releases so you can delete interim shims quickly.
- When upstream fixes lag, wrap their APIs in dedicated modules and gate them with `@preconcurrency` or unchecked `Sendable` annotations, annotated with TODO dates for later removal.
- Audit binary dependencies (XCFrameworks, Catalyst builds) against current Xcode release notes to catch known concurrency bugs (for example, `withCheckedContinuation` fixes landing in 6.x toolchain updates). Retest after each Xcode update.

## Living Checklist
- Maintain a dashboard that tracks each target’s `SWIFT_VERSION`, strict concurrency level, typed-throws adoption, and outstanding opt-outs (`nonisolated(unsafe)`, unchecked `Sendable`).
- Automate lint rules that flag new unchecked conformances or `nonisolated(unsafe)` declarations without linked issue IDs.
- Schedule quarterly dependency reviews and test runs on the latest Xcode point release to catch regressions early.
- Keep sprint retros focused on Swift 6 hygiene: review new warnings, confirm Instruments traces are clean, and update the migration playbook with lessons learned.

[^1]: Swift.org – “Swift Concurrency Adoption Guidelines.”
[^2]: Donny Wals – “How to plan a migration to Swift 6,” updated July 7, 2025.
[^3]: Swift.org Blog – “Announcing Swift 6,” September 2024.
[^4]: Apple Newsroom – “Apple empowers developers and fuels innovation with new tools and resources,” June 10, 2024.
[^5]: InfoWorld – “Apple’s Xcode 16 adds AI-powered code completion,” June 13, 2024.
[^6]: Apple Developer Documentation – “Swift Testing.”
[^7]: Surf Studio – “Swift Concurrency Instrument: чем он полезен iOS-разработчику,” May 26, 2023.
[^8]: Apple Developer Forums – “Is there a way to use Swift 6 without SWIFT_STRICT_CONCURRENCY=COMPLETE?,” September 18, 2024.
