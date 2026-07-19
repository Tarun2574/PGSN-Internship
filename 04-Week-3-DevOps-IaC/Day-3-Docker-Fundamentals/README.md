# Day 3 – Docker Fundamentals

## Overview
This day covers Docker basics: installing the Docker engine, writing a Dockerfile, building an image, and running it as a container.

## Objectives
- Install Docker
- Write a Dockerfile for an application
- Build a Docker image
- Run and verify the container

## AWS Services Used
- None directly (local/EC2 Linux environment) — this day is a prerequisite for the AWS deployment automation in Day 5

## Prerequisites
- A Linux environment (Ubuntu) with `sudo` access

## Implementation
1. **Installed Docker** on the instance using the system package manager.
2. **Wrote a Dockerfile** alongside a `requirements.txt` file, defining the application's base image, dependencies, and startup command.
3. **Built the Docker image** from the Dockerfile.
4. **Ran the container** and verified the application responded correctly.

## Verification
- The Dockerfile and `requirements.txt` were confirmed present in the project directory via a directory listing.
- The running container served the expected output: **"Hello from Docker Container!"**, confirming the image was built and executed correctly.

## Challenges & Troubleshooting
- No blocking issues; the Docker build completed using the layers defined in the Dockerfile without errors.

## Key Learnings
- How a Dockerfile declaratively defines an image's contents (base image, dependencies, copied files, entrypoint/command).
- The difference between a Docker **image** (the built, immutable artifact) and a **container** (a running instance of that image).

## Result
A working containerized application, built from a custom Dockerfile and verified running locally — the same image approach used in the Day 5 automated deployment.

## Skills Demonstrated
- Docker installation and configuration
- Dockerfile authoring
- Image build and container run/verify workflow

## Commands Used
See [`Commands.md`](./Commands.md) for the Docker commands used.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_Install_Docker.png` | Docker installation on the instance |
| 2 | `02_Dockerfile_Requirements.png` | `Dockerfile` and `requirements.txt` in the project directory |
| 3 | `03_Docker_Container_Running.png` | Running container serving "Hello from Docker Container!" |

## Conclusion
With a working Dockerfile and verified container, the application is now portable and ready to be built/deployed automatically by the GitHub Actions pipeline configured on Day 4.
