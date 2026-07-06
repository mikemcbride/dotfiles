function pi --description 'Run pi with a supported Node version (>=22) via the fnm default alias'
    # pi requires Node >= 22.19. Projects may pin older Node versions via
    # .node-version/.tool-versions, so always run pi against fnm's default.
    fnm exec --using default command pi $argv
end
