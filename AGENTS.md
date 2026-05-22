# AGENTS.md


## Development Workspace Router Law

This repo inherits the workspace-wide agent law at `/Users/thekryptodragon/Development/AGENTS.md`.

All AI agents, regardless of vendor or model family, must follow that Development-root law plus this repo's local rules. Before non-trivial work, read:

1. `/Users/thekryptodragon/Development/AGENTS.md`
2. this repo's `AGENTS.md`
3. `/Users/thekryptodragon/Development/sirsi-pantheon/.agents/idea-router/state.json`
4. `/Users/thekryptodragon/Development/sirsi-pantheon/.agents/idea-router/agents.json`
5. any router item addressed to this repo's registered agent id

Router etiquette is mandatory: use `/plan`, `/goal`, ETA fields, repo-segmented ownership, verification evidence, and router writeback. Agent type does not matter; Codex, Claude, Gemini, Gemma, Qwen, and future agents obey the same contract.

## Universal Idea Router Startup Protocol

Every AI agent working in this repository, including Codex, Claude, Gemini, Qwen, or future agents, MUST learn and use the Idea Router before starting non-trivial work.

1. Read this `AGENTS.md` first.
2. Check for a repo-local router at `.agents/idea-router/`.
3. If no repo-local router exists, use the portfolio router at `/Users/thekryptodragon/Development/sirsi-pantheon/.agents/idea-router/`.
4. Read router `state.json`, `README.md`, and any pending item addressed to this repo's registered agent id before beginning unrelated work.
5. New work must include `/plan` and `/goal` and must continue until the `/goal` is met, blocked with evidence, or impossible with a stated reason.
6. Work is repo-segmented by default. Do not edit another repository unless a written super-agent mandate names the repos and grants that scope.
7. Router targets must use registered agent ids such as `codex-homebrew-tools`, `claude-homebrew-tools`, `codex-pantheon`, or another entry in `agents.json`.

User shorthand: `ctr` means check the router.

## Net Goal-Weaving & Architecture Doctrine

Net 𓁯, The Weaver, keeps this repo aligned to the portfolio product goals. Agents must work independently toward the full `/goal` where possible and must include `eta_for_review`, `next_check_at`, or `estimated_duration` in router handoffs.

- This repo is distribution-only. Keep it minimal.
- Only Homebrew formulae, casks, README, and release automation artifacts belong here.
- Do not add product code or paid vendor integrations.
- Product surface target: none; this repo distributes other products.

## Lean Engineering Doctrine

These principles are derived from a multi-day collapse of overengineered router infrastructure (push-model daemons, dispatch ledgers, snowflake IDs, polling timers, agent registries, NOTIFY env gates) into ~150 LOC of one Go package + four CLI verbs + one launchd plist. Net -454 LOC across the refactor. Apply these BEFORE proposing architecture, not as a post-hoc trim. These principles are universal across vendor and model family (Codex, Claude, Gemini, Gemma, Qwen, future agents).

1. **Question polling before tuning it.** Before adding a "every N seconds" timer, ask: is there an event source — `WatchPaths`, `inotify`, FSEvents, git hook, Claude Code hook event, webhook, MCP notification — that fires only when state actually changes? Polling is the right shape ONLY when the source of truth is remote (HTTP API) or you genuinely need continuous samples (CPU, RAM, frame timing). For local file state, event-driven wins on lean every time. If you find yourself tuning an interval, you are usually one layer too deep — the question is whether the loop should exist at all.

2. **No belt-and-suspenders.** If the primary mechanism already fails loud (cobra error → stderr → log, non-zero exit, exception bubbles up), do not add a second-tier validator/canary/guard on top. Each extra "safety check" is noise that drifts, rots, and obscures the actual failure when something goes wrong. One loud failure path beats two quiet ones.

3. **Replace, don't accrete.** When a new mechanism subsumes an old one, default to deletion of the old, not coexistence. "Additive-only" is a safety rule for in-flight refactors, not a permanent policy. Once the new path is verified end-to-end, the old code is dead weight. Track destruction in proportion to addition: a refactor PR that adds 500 LOC without deleting any is a smell.

4. **Smallest package wins.** One file beats two. One config beats two configs plus a wrapper script. One CLI verb beats four verbs that compose to the same operation. When the answer is "add a launchd plist," it is 30 lines of XML, not a new Go subcommand wrapping launchctl. When the answer is "register a thread," it is `sirsi thread register`, not a registry-orchestrator framework.

5. **Three options that look the same is no choice.** When presenting alternatives to the user, the options must differ on a load-bearing axis: deployment, durability, blast radius, latency, failure mode. If they differ only on cosmetics or framing, collapse to ONE recommendation. Asking the user to pick among indistinguishable shapes wastes their attention and signals architectural confusion.

6. **Question the model, not just the parameter.** When the user asks for "every 4 minutes," they may actually mean "wake on activity, not on a schedule." Anchoring on the literal parameter and tuning it is a common failure mode. The lean answer is usually one architectural layer up from where the question landed. Solve the underlying need, not the literal request, then report what you did.

7. **Direct communication.** Lead with the verdict or the result, not the preamble. End-of-turn summary is one or two sentences. No over-apology, no recap, no thanks-for-the-question, no "Great!" or "Perfect!". Brief beats verbose. Silent beats brief when there is nothing to add. The user reads the diff, not the celebration.

8. **Polling is for remote sources only.** A local file-based queue, a local config file, a local lock file — all of these have an event source already. If a process exists solely to read a local file on an interval, it is the wrong shape. Replace with `WatchPaths`, a git hook, or fold the read into the consumer's wake path.

9. **Identity by string, not by registry.** When designing multi-actor protocols, default to "any string id can participate" rather than "named entities must register first." Registration is optional metadata for human readability, not a precondition for participation. The router collapse proved that an `agents.json` registry was not load-bearing for the actual file-based queue — any agent id that writes a file gets routed.

10. **Atomicity at the filesystem boundary.** File creation is atomic; metadata in a separate sidecar JSON is not. When the design includes "write a file AND update a registry," collapse to "write a file with frontmatter that carries all the state." Two writes can race; one cannot.

These principles are referenced as `AGENTS.md §Lean #<n>` in commit messages, ADRs, and router proposals. Cite, do not paraphrase.
