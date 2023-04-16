local keymap = vim.keymap

keymap.set("i", [["]], [[""<LEFT>]])
keymap.set("i", "{", "{}<LEFT>")
keymap.set("i", "<", "<><LEFT>")
keymap.set("i", "(", "()<LEFT>")
keymap.set("i", [[']], [[''<LEFT>]])
keymap.set("i", "[", "[]<LEFT>")
keymap.set("i", "<D-s>", ":w")
