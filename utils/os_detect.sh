#!/usr/bin/env bash

# Detect the operating system
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    else
        echo "unsupported"
    fi
}

# Get the appropriate package manager command
get_pkg_manager() {
    local os=$(detect_os)
    if [[ "$os" == "linux" ]]; then
        echo "sudo apt"
    elif [[ "$os" == "macos" ]]; then
        # Check if Homebrew is installed
        if command -v brew &>/dev/null; then
            echo "brew"
        else
            echo "homebrew_missing"
        fi
    else
        echo "unsupported"
    fi
}

# Install Homebrew if needed
install_homebrew() {
    if [[ "$(detect_os)" == "macos" ]] && ! command -v brew &>/dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for the current session
        if [[ -f /opt/homebrew/bin/brew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f /usr/local/bin/brew ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
        
        return 0
    fi
    return 1
}

# Install packages using the appropriate package manager
install_packages() {
    local os=$(detect_os)
    local pkg_manager=$(get_pkg_manager)
    
    if [[ "$pkg_manager" == "homebrew_missing" ]]; then
        install_homebrew
        pkg_manager="brew"
    fi
    
    if [[ "$pkg_manager" == "unsupported" ]]; then
        echo "Unsupported operating system: $os"
        return 1
    fi
    
    if [[ "$pkg_manager" == "sudo apt" ]]; then
        sudo apt update
        sudo apt install "$@" -y
    elif [[ "$pkg_manager" == "brew" ]]; then
        brew install "$@"
    fi
}
