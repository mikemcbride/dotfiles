function claude
    set -l _anthropic_model $ANTHROPIC_MODEL
    set -e ANTHROPIC_MODEL

    if set -q CLAUDE_NO_SKIP_PERMISSIONS
        command claude $argv
        set -l _status $status
        set -gx ANTHROPIC_MODEL $_anthropic_model
        return $_status
    end

    switch $argv[1]
        case --help -h --version -v
            command claude $argv
        case '*'
            command claude --dangerously-skip-permissions $argv
    end

    set -l _status $status
    set -gx ANTHROPIC_MODEL $_anthropic_model
    return $_status
end
