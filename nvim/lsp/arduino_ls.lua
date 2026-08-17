return {
    name = "arduino_ls",
    cmd = {
        "arduino-language-server",
        "-cli", "arduino-cli",
        "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
        "-clangd", "clangd",
        "-fqbn", "arduino:avr:uno",
    },
    filetypes = { "arduino" },
    root_markers = {
        "sketch.yaml",
        ".git",
    },
    settings = {},
}
