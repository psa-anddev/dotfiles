local wk = require("which-key")
wk.setup { }
wk.register(
    {
        c = {
            name = "comments",
            c = "whole line",
            u = "undo"
        }
    },
    { prefix = "g" })
