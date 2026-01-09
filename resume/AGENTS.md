# AGENTS.md

This file contains guidelines and commands for agentic coding agents working in this Typst resume repository.

## Project Overview

This is a Typst-based resume generator that uses YAML data files and Typst templates to generate PDF resumes. 

**IMPORTANT**: The resume uses the shared `../config.yaml` file from the parent portfolio directory. This ensures the website and resume stay in sync.

The project structure includes:
- `template.typ` - Main template with styling and component definitions
- `yml.typ` - YAML-to-Typst integration layer
- `resume.typ` - Main entry point that loads YAML data and renders the resume
- `../config.yaml` - Shared resume data in YAML format (used by both website and resume)
- `resume.pdf` - Generated output

## Build/Render Commands

### Generate PDF Resume
```bash
# IMPORTANT: Must use --root .. to access parent config.yaml
typst compile --root .. resume.typ resume.pdf
```

### Watch Mode (for development)
```bash
# IMPORTANT: Must use --root .. to access parent config.yaml
typst watch --root .. resume.typ
```

### Render to different formats
```bash
# Render to PNG (for preview)
typst compile resume.typ resume.png

# Render to SVG
typst compile resume.typ resume.svg
```

### Single Component Testing
Since this is a Typst project, testing is visual. To test individual components:
1. Create a test file importing the component
2. Render with `typst compile test.typ test.pdf`

## Code Style Guidelines

### Typst Style
- Use 2-space indentation
- Use snake_case for function and variable names
- Use kebab-case for file names
- Add blank lines between major function blocks
- Use descriptive parameter names in function definitions

### Import Organization
```typst
// Standard library imports first
#import "@preview/fontawesome:0.6.0": *

// Local imports second
#import "template.typ": resume, header, resume_heading
#import "yml.typ": yml_resume
```

### Function Definition Style
```typst
#let function_name(
  param1: "default_value",
  param2: "another_default",
  ..rest
) = {
  // Function body
  // Use consistent spacing
  // Add comments for complex logic
}
```

### YAML Data Structure
- Use snake_case for all keys
- Group related data under logical sections
- Maintain consistent date formats (e.g., "Month YYYY — Present")
- Use bullet points for lists of achievements/responsibilities

### Component Naming Conventions
- Template components: `snake_case` (e.g., `resume_heading`, `exp_item`)
- YAML integration functions: `yml_section_name` (e.g., `yml_experience`, `yml_education`)
- Data structure keys: `snake_case` (e.g., `personal`, `projects`, `experience`)

### Error Handling
- Validate YAML structure before processing
- Provide meaningful error messages for missing required fields
- Use default values where appropriate to prevent rendering failures

### Documentation Style
- Use brief, descriptive comments above complex functions
- Document parameter purposes in function definitions
- Include usage examples in README.md

## File Organization

```
/
├── template.typ     # Main template and styling
├── yml.typ         # YAML integration layer
├── resume.typ      # Entry point and data loading
├── ../config.yaml  # Shared resume data (used by both website and resume)
├── resume.pdf      # Generated output
└── README.md       # Project documentation
```

## Development Workflow

1. Edit `../config.yaml` to update content (shared with website)
2. Run `typst watch --root .. resume.typ` for live preview
3. Modify styling in `template.typ` if needed
4. Test changes by viewing the generated PDF
5. Commit changes when satisfied

## Dependencies

- Typst compiler (latest version)
- FontAwesome preview package (`@preview/fontawesome:0.6.0`)

## Common Issues and Solutions

### YAML Parsing Errors
- Check for proper indentation (2 spaces)
- Ensure all strings are properly quoted
- Validate YAML syntax using online validators

### Font Issues
- Ensure "New Computer Modern" font is available
- Use `typst fonts` to list available fonts
- Fall back to system fonts if needed

### Layout Issues
- Adjust margins in `template.typ` page settings
- Modify spacing in component functions
- Use `v()` and `h()` for vertical/horizontal spacing

## Performance Notes

- Typst compilation is fast (< 1 second for this resume)
- Watch mode provides instant updates
- PDF size is typically < 100KB

## Testing Strategy

Since this is a document generation project:
- Visual testing by rendering PDFs
- Check all sections render properly
- Verify links and formatting
- Test with different data scenarios
- Validate YAML structure integrity