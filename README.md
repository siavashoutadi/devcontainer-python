# devcontainer-python

A comprehensive Docker-based development container image featuring Python with a curated selection of modern command-line tools and utilities designed to enhance productivity and streamline Python development workflows.

## Overview

This development container image provides a complete, pre-configured environment for Python development. Built on a lightweight Python slim base image, it includes essential development tools and modern CLI utilities that would typically require separate installation and configuration.

The image is designed to be used with VS Code's [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers), allowing you to develop inside a container while maintaining all the comfort and power of your local VS Code setup.

## What's Included

### Core Development Tools
- **Python** - Python runtime
- **Git** - Version control system with pre-configured global settings
- **build-essential** - Compiler and build tools for compiled dependencies
- **curl & wget** - HTTP and file download utilities
- **vim** - Terminal text editor

### Modern CLI Tools
- **ripgrep (rg)** - Ultra-fast text search
- **fd** - User-friendly alternative to `find`
- **delta** - Syntax-highlighted diff tool for Git
- **GitHub CLI (gh)** - Interact with GitHub from the command line
- **jq** - JSON processor and query tool
- **yq** - YAML processor (like jq for YAML)
- **lsd** - Modern colored `ls` command
- **ccat** - Syntax-highlighted `cat` command
- **starship** - Cross-shell prompt customization
- **tree** - Directory tree visualization
- **viddy** - Modern `watch` command replacement

### Package & Build Tools
- **uv** - Lightning-fast Python package installer and resolver (replacement for pip)
- **tailwindcss** - Utility-first CSS framework CLI

### Pre-configured Environment
- **Git configuration** - Global git config with sensible defaults and ignore patterns
- **Starship prompt** - Beautiful, customizable shell prompt
- **Bash enhancements** - Modular bashrc system with optimized ripgrep and less configurations
- **Non-root user** - Runs as `devuser` with standard UID/GID for better security and permission management

## Use Cases

### Local Python Development
- Develop Python applications without polluting your host machine
- Ensure your development environment matches production configurations
- Quickly onboard new team members with a consistent development setup

### Data Science & Analysis
- Work with Jupyter notebooks, pandas, and scientific Python libraries
- Leverage the fast file searching (ripgrep) and JSON processing (jq) tools for data exploration
- Use ripgrep for searching large datasets and logs

### DevOps & Infrastructure
- Integrate seamlessly with Docker and Kubernetes workflows
- Use GitHub CLI for automation and CI/CD integration
- Quickly process configuration files with yq and jq

### Web Development
- Develop Python web frameworks (FastAPI, Django, Flask)
- Build frontend assets with tailwindcss
- Use modern CLI tools for productive command-line workflows

### Scripting & Automation
- Write and test Python automation scripts
- Leverage the comprehensive CLI toolkit for complex shell scripting
- Use colorized output tools for better log readability

## Quick Start

### Prerequisites
- VS Code with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- Docker installed and running

### Usage
1. Clone or open this repository in VS Code
2. When prompted, select "Reopen in Container" or use the command palette (`Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. VS Code will build the image and connect to the container
4. Start developing with all tools available in the integrated terminal

### Custom Environment Variables
You can source environment variables from a `.env/devcontainer` file in your workspace. Simply create the file and it will be automatically sourced by the bash profile.

## Benefits

✨ **Consistency** - Same development environment across all machines and team members
🚀 **Productivity** - Pre-installed modern CLI tools reduce context switching
🔒 **Isolation** - Keep your host machine clean and organize projects in containers
⚡ **Performance** - Layer caching and mount optimization for fast iterative development
🛠️ **Flexibility** - Modular configuration system allows easy customization
