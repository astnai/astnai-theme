# ==============================================================================
# ASTNAI ZSH THEME
# minimal theme with only two colors
# ==============================================================================

# ------------------------------------------------------------------------------
# COLOR DEFINITIONS
# ------------------------------------------------------------------------------
# Prompt colors (zsh format)
local text_primary='%F{#fafafa}'
local text_secondary='%F{#737373}'
local reset='%f'

# ANSI colors (for functions - same hex values)
local ansi_text_secondary='\e[38;2;115;115;115m'
local ansi_reset='\e[0m'

# ------------------------------------------------------------------------------
# PROMPT CONFIGURATION
# ------------------------------------------------------------------------------
# Custom function to handle path display (removes ~ symbol)
prompt_path() {
    local current_path="${PWD/#$HOME/}"
    if [[ $current_path == "" ]]; then
        echo ""
    else
        echo "$current_path"
    fi
}

# Main prompt: astnai + path
PROMPT='${text_primary}astnai${text_primary}$(prompt_path)${reset} '

# No right prompt
RPROMPT=''

# ------------------------------------------------------------------------------
# CUSTOM LS FUNCTION
# ------------------------------------------------------------------------------
# Remove existing ls alias to avoid conflicts
unalias ls 2>/dev/null

# Enhanced ls: directories first with / prefix, responsive line wrapping
function ls() {
    local items=()
    local directories=()
    local files=()
    
    # Separate directories from files
    while IFS= read -r item; do
        if [[ -d "$item" ]]; then
            directories+=("/$item")
        else
            files+=("$item")
        fi
    done < <(command ls -1 "$@")
    
    # Combine: directories first, then files
    items=("${directories[@]}" "${files[@]}")
    
    # Responsive output with line wrapping
    local term_width=$(tput cols)
    local current_line_length=0
    local spacing="  "
    local first_item=true
    
    printf "${ansi_text_secondary}"
    for item in "${items[@]}"; do
        local item_length=${#item}
        local spacing_length=${#spacing}
        
        if [[ $first_item == true ]]; then
            # First item (no spacing needed)
            current_line_length=$item_length
            printf "%s" "$item"
            first_item=false
        elif [[ $((current_line_length + spacing_length + item_length)) -le $term_width ]]; then
            # Item fits in current line
            printf "%s%s" "$spacing" "$item"
            current_line_length=$((current_line_length + spacing_length + item_length))
        else
            # Item doesn't fit, start new line
            printf "\n%s" "$item"
            current_line_length=$item_length
        fi
    done
    printf "${ansi_reset}\n"
}

# ------------------------------------------------------------------------------
# GLOBAL OUTPUT COLOR
# ------------------------------------------------------------------------------
# Set default color for all command output
autoload -U colors && colors

# Apply text_secondary color to command output
precmd() {
    print -n "$ansi_text_secondary"
}

# Reset color after each command
preexec() {
    print -n "$ansi_reset"
}