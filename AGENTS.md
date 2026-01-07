# AGENTS.md - AI Coding Agent Instructions

## Project Overview

Go-based portfolio website using:
- **Language**: Go 1.25.5
- **Templating**: [templ](https://templ.guide/) v0.3.960 for type-safe HTML templates
- **Configuration**: YAML-based config for personal info, projects, experience, education, skills
- **Web Framework**: Standard library `net/http`
- **Deployment**: Docker on Hetzner, published to GitHub Container Registry

## Build/Run Commands

### Development
```bash
templ generate          # Generate Go code from .templ files (REQUIRED after changes)
go run main.go          # Run the application (port :8080)
go build                # Build binary
templ fmt .             # Format templ files
```

### Testing
```bash
go test ./...                        # Run all tests
go test -run TestFunctionName ./...  # Run a single test
go test ./path/to/package            # Run tests in specific package
go test -v ./...                     # Verbose output
go test -cover ./...                 # With coverage
```

### Linting
```bash
go fmt ./...           # Format Go code
go vet ./...           # Check for suspicious constructs
staticcheck ./...      # Run staticcheck (if installed)
```

### Docker
```bash
docker build -t portfolio .      # Build image locally
docker run -p 8080:8080 portfolio # Run container
```

## Project Structure
```
portfolio/
├── main.go              # Entry point, HTTP routing
├── config.go            # YAML config types and loader
├── config.yaml          # Portfolio content (personal info, projects, etc.)
├── portfolio.templ      # Templ template sources
├── portfolio_templ.go   # Generated from templ (DO NOT EDIT)
├── go.mod, go.sum       # Go module files
├── Dockerfile           # Multi-stage container build
└── .github/workflows/   # CI/CD pipelines
```

## Code Style Guidelines

### Import Organization
Group imports with blank line separator:
```go
import (
    "fmt"
    "net/http"

    "github.com/a-h/templ"
)
```

### Naming Conventions
| Element | Style | Example |
|---------|-------|---------|
| Functions | camelCase | `educationSection`, `portfolioPage` |
| Parameters | snake_case | `graduation_year` |
| Variables | camelCase | `config` |
| Types | PascalCase | `Config`, `Personal`, `Experience` |
| Packages | lowercase | `main` |

Note: This project uses `snake_case` for parameters (non-standard Go).

### Templ Templates
- Define templates in `.templ` files
- Run `templ generate` after any `.templ` changes
- Never edit `*_templ.go` files - they are auto-generated

```templ
templ componentName(config *Config) {
    <div>Content with { config.Personal.Name }</div>
}
```

### HTTP Routing
```go
http.Handle("/", templ.Handler(portfolioPage(config)))
```

### Error Handling
```go
if err := someOperation(); err != nil {
    log.Printf("operation failed: %v", err)
    return err
}
```

### Formatting
- Tabs for indentation (Go standard)
- Run `go fmt ./...` before committing
- Run `templ fmt .` for templ files

## Configuration

Portfolio content is stored in `config.yaml`. Structure:

```yaml
personal:
  name: "Your Name"
  title: "Your Title"
  tagline: "Short description"
  email: "email@example.com"
  linkedin: "linkedin.com/in/you"
  github: "github.com/you"
  site: "yoursite.dev"
  phone: "123-456-7890"
  location: "City, State"

projects:
  - name: "Project Name"
    skills: "Tech, Stack, Used"
    date: "Date"
    points:
      - "Bullet point 1"
      - "Bullet point 2"

experience:
  - role: "Job Title"
    name: "Company"
    location: "City, State"
    date: "Start — End"
    points:
      - "Achievement 1"

education:
  - name: "University"
    degree: "Degree"
    location: "City, State"
    date: "Graduation"

skills:
  - category: "Category"
    skills: "Skill1, Skill2, Skill3"
```

## Workflow

### Making Changes
1. Edit source files (`.go`, `.templ`) or `config.yaml`
2. Run `templ generate` if templ files modified
3. Run `go fmt ./...` and `go vet ./...`
4. Test with `go run main.go`

### CI/CD Pipeline
- Triggered on version tags (`v*`)
- Builds and pushes Docker image to GHCR

### Git Commit Style
Short, lowercase, imperative: "fix link", "add education section"

## Important Notes
- **Port**: `:8080` (configurable via PORT env var)
- **Config**: `config.yaml` (configurable via CONFIG_PATH env var)
- **Generated files**: Never edit `*_templ.go`
- **Templ docs**: https://templ.guide/
- **Module path**: `github.com/ericTrautsch/portfolio`

### Install templ CLI
```bash
go install github.com/a-h/templ/cmd/templ@latest
```

## Common Patterns

### Adding a New Section
1. Add types to `config.go` if needed
2. Update `config.yaml` with new data
3. Create templ component in `portfolio.templ`:
   ```templ
   templ newSection(items []NewType) {
       <section>
           <h2>Section Title</h2>
           for _, item := range items {
               <div>{ item.Name }</div>
           }
       </section>
   }
   ```
4. Add to `portfolioPage` template
5. Run `templ generate`

### Environment Variables
- `PORT`: Server port (default: 8080)
- `CONFIG_PATH`: Path to config file (default: config.yaml)
