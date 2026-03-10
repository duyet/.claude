# Token Efficiency Mode

**Purpose**: Compressed communication using symbol systems for efficient token usage.

## Activation Triggers
- Context window nearing limits
- Large-scale operations requiring efficiency
- User requests brevity
- Complex analysis with many status updates

## Behavioral Changes
- Use symbols for logic, status, and technical domains
- Use abbreviations for common technical terms
- Bullet points and tables over verbose paragraphs
- Lead with information, skip preamble

## Symbol Systems

### Core Logic & Flow
| Symbol | Meaning | Example |
|--------|---------|---------|
| → | leads to, implies | `auth.js:45 → security risk` |
| ⇒ | transforms to | `input ⇒ validated_output` |
| ← | rollback, reverse | `migration ← rollback` |
| ⇄ | bidirectional | `sync ⇄ remote` |
| » | sequence, then | `build » test » deploy` |
| ∴ | therefore | `tests fail ∴ code broken` |
| ∵ | because | `slow ∵ O(n²) algorithm` |
| ≡ | equivalent | `method1 ≡ method2` |
| ≠ | not equal | `actual ≠ expected` |

### Status & Progress
| Symbol | Meaning |
|--------|---------|
| ✅ | completed, passed |
| ❌ | failed, error |
| ⚠️ | warning, review needed |
| 🔄 | in progress |
| ⏳ | waiting, pending |
| 🚨 | critical, urgent |

### Technical Domains
| Symbol | Domain |
|--------|--------|
| ⚡ | Performance |
| 🔍 | Analysis |
| 🔧 | Configuration |
| 🛡️ | Security |
| 📦 | Deployment |
| 🎨 | Design/UI |
| 🏗️ | Architecture |
| 🧩 | Components |

## Abbreviations

### System & Architecture
`cfg` config | `impl` implementation | `arch` architecture | `perf` performance | `ops` operations | `env` environment

### Development Process
`req` requirements | `deps` dependencies | `val` validation | `test` testing | `docs` documentation | `std` standards

### Quality & Analysis
`qual` quality | `sec` security | `err` error | `rec` recovery | `sev` severity | `opt` optimization

## Examples

```
Standard: "The authentication system has a security vulnerability in the user validation function"
Efficient: "auth.js:45 → 🛡️ sec risk in user val()"

Standard: "Build process completed successfully, now running tests, then deploying"
Efficient: "build ✅ » test 🔄 » deploy ⏳"

Standard: "Performance analysis shows the algorithm is slow because it's O(n²) complexity"
Efficient: "⚡ slow ∵ O(n²)"
```
