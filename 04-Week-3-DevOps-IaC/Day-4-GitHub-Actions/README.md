# Day 4 – GitHub Actions (CI/CD)

## Overview
This day sets up a Continuous Integration/Continuous Deployment pipeline using GitHub Actions, automating the build (and eventual deployment) process that was performed manually on Day 3.

## Objectives
- Set up GitHub Actions on the project repository
- Create a workflow file to build the Docker image automatically
- Verify the workflow runs successfully on trigger

## AWS Services Used
- None directly — GitHub Actions is the CI/CD platform; AWS integration is used in Day 5's deployment automation

## Prerequisites
- The Dockerized application from Day 3
- A GitHub repository for the project

## Implementation
1. **Enabled GitHub Actions** on the repository and started from the suggested "simple workflow" template.
2. **Created a workflow YAML file** (`add github actions workflow`) defining the build job — checking out the repository and building the Docker image.
3. **Triggered the workflow** and monitored its run under the Actions tab.

## Verification
- The Actions tab listed the workflow run **"add github actions workflow"** with a completed status.
- The workflow file content was reviewed directly in the GitHub UI, confirming the build steps were defined correctly (checkout → build).

## Challenges & Troubleshooting
- No blocking issues; the default GitHub Actions runner environment had Docker available out of the box, so no additional runner configuration was required for the build step.

## Key Learnings
- How GitHub Actions workflows are defined declaratively in YAML and triggered automatically by repository events (e.g., pushes).
- The value of automating the build step immediately after Docker fundamentals — every future code change now gets validated automatically instead of relying on manual `docker build` runs.

## Result
A working CI pipeline that automatically builds the Docker image whenever the workflow is triggered, laying the groundwork for the full deployment automation in Day 5.

## Skills Demonstrated
- GitHub Actions workflow configuration
- CI/CD pipeline fundamentals
- YAML-based automation authoring

## Commands Used
No CLI commands were used for this task — the workflow was configured directly through the GitHub web interface.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_GitHub_Actions_Setup.png` | GitHub Actions "Get started" screen for the repository |
| 2 | `02_Workflow_Run.png` | Completed workflow run listed under the Actions tab |
| 3 | `03_Workflow_YAML.png` | Workflow YAML file defining the build job |

## Conclusion
Automating the build via GitHub Actions removes manual, error-prone steps from the release process and sets up the trigger mechanism used for the automated AWS deployment on Day 5.
