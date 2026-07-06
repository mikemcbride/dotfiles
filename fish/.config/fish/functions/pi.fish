function pi --description 'Run pi with a supported Node version (>=22) via mise'
    # pi requires Node >= 22.19. Projects may pin older Node versions via
    # .tool-versions/.node-version, so always run pi against a modern Node.
    mise exec node@24 -- pi $argv
end
