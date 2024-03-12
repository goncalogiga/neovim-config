-- This feature is not yet enabled by default: with it you can undo/redo
-- changes made in VM, and the regions will be restored as well. You have to
-- map the commands to make it work.
vim.g.VM_maps["Undo"] = 'u'
vim.g.VM_maps["Redo"] = '<C-r>'
