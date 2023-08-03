require('neorg').setup {
    load = {
        ["core.defaults"] = {},

        ["core.concealer"] = { config = {
            icon_preset = "varied",
            folds = false,
        }},

        ["core.dirman"] = { config = {
            workspaces = {
                notes = "~/notes",
            },
            default_workspace = "notes",
        }},
    },
}
