---NOTE: NvDash Headers
math.randomseed(os.time())

local headers = {
  default = {
    "           ▄ ▄                   ",
    "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
    "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
    "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
    "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
    "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
    "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
    "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
    "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    "                                 ",
  },
  neovim = {
    "                                                    ",
    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                    ",
  },
  nvchad = {
    "                            ",
    "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    "   ▄▀███▄     ▄██ █████▀    ",
    "   ██▄▀███▄   ███           ",
    "   ███  ▀███▄ ███           ",
    "   ███    ▀██ ███           ",
    "   ███      ▀ ███           ",
    "   ▀██ █████▄▀█▀▄██████▄    ",
    "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    "                            ",
    "     Powered By  eovim    ",
    "                            ",
  },
  luffy = {
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢟⣛⣛⣛⣉⣉⣉⣙⣛⣛⣛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢋⣥⣶⡿⠟⠅⡿⠿⠿⠾⠿⠿⠍⠛⠋⢿⣶⣦⣍⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠡⠾⢟⣋⣀⣠⣤⣴⣶⣶⣶⣾⣿⣷⣶⣶⣶⣬⣁⣉⣙⠻⠦⣉⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢟⣡⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣶⣦⣀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⢉⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⡾⠟⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠁⠀⠀⠀⠀⠀⠴⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣤⡞⡣⢐⣾⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⢠⣦⠀⠀⠀⠀⡀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢟⢳⡌⠻⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⣴⠟⡡⢪⢜⡯⣿⣿⢉⡭⢛⠟⠋⠀⠀⠀⣠⣾⠀⣿⣿⣆⠀⠀⠀⢱⣄⠀⠀⠀⠀⠀⠙⠿⣿⢿⡛⢿⡛⣿⢷⡘⡦⣦⢹⣦⠘⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣾⢋⣼⣼⡵⣡⣪⠟⢁⣤⠒⠁⠀⠀⠀⢀⣼⣿⣿⠀⣿⣿⣿⣦⠀⠀⠈⣿⣧⡀⠀⠀⠀⠀⠀⠈⠳⢝⢂⠋⢻⡁⡐⡐⣙⣦⡍⣷⡈⢿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⡟⢀⣿⣿⣿⣿⣿⡟⣱⠟⣠⣿⠁⠀⠀⠀⡄⢀⣾⣿⣿⣿⡄⣿⣿⣿⣿⣷⣄⠀⢹⣿⣿⡄⠀⢠⠀⠀⠀⠀⠀⠀⠁⠡⢴⣴⣾⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⡿⢠⣿⣿⣿⣿⣿⣿⠖⣧⣎⣾⠁⠀⠀⢀⡜⠠⠟⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠈⠛⣻⣭⣄⠀⣧⠀⠀⠀⠹⣷⠳⡄⠘⠟⢻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿",
    "⣿⣿⣿⣿⣿⡿⢠⡟⡸⠻⠛⠹⣿⡟⠸⣿⣿⠁⠀⠀⠀⣼⢃⣾⣿⣿⣿⣷⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣦⢹⡆⠀⠀⠀⠹⠓⠸⡄⠜⠇⠆⠉⣿⣿⣿⣿⣿⠈⣿⣿⣿",
    "⣿⣿⣿⣿⡿⠀⡿⢀⠁⠃⠇⡆⢻⢰⢰⡆⢁⡀⠀⠀⣰⣿⣿⣿⡿⠿⢿⣿⣿⣿⣿⣧⠹⣿⣿⣿⣿⣿⡿⠟⠛⠙⠛⢿⣿⠀⠀⠀⠀⠀⢄⠰⣴⣸⡘⣴⡌⣿⣧⣿⣿⠀⣿⣿⣿",
    "⣿⣿⣿⣿⠀⢸⠀⡇⡎⡆⡆⡇⡈⡈⠚⣠⣿⣿⠀⠀⣿⣿⡿⠃⣠⣤⣤⡀⢙⣿⣿⣟⠀⢻⣿⣿⣿⣿⢠⣶⣿⣷⣄⠘⣿⡆⠃⠀⢹⣿⣾⣧⡈⠁⠃⢸⢸⣷⡍⡿⣿⠀⣿⣿⣿",
    "⣿⣿⣿⣿⡀⢸⠀⡇⡇⡇⡇⣇⠁⣶⣾⣿⣿⣿⡆⢰⣿⣿⠃⣼⣿⣿⣿⣿⣿⣿⣿⣿⢀⡞⢿⣿⣿⣿⣏⠛⠟⠻⠟⠛⠛⢿⣼⢠⣼⣿⣿⣿⣧⠀⠆⠘⠌⡏⠇⣇⣿⠆⣿⣿⣿",
    "⣿⣿⣿⣿⡇⢸⡆⡇⡇⠁⡡⢸⠁⣹⣿⣿⣿⣿⣿⠘⠟⠉⠙⣻⣿⣿⣿⡿⠿⠿⠟⣛⣛⣛⣛⣛⣛⣛⣛⣛⠷⠼⠿⣶⣶⣀⠉⢰⣿⣿⣿⣿⡟⠀⡼⠠⠠⠠⡠⡸⢿⢠⣿⣿⣿",
    "⣿⣿⣿⣿⣷⠘⣧⢹⠘⠀⣁⣡⡁⣿⣿⣿⣿⣿⣿⡆⢴⣶⠻⠟⡋⢩⣵⣶⣶⣿⣿⣿⣿⠿⠿⠿⢿⣿⣿⣿⣿⣷⣄⣬⠙⣿⠂⢍⢿⣿⣿⣿⠏⣸⡷⠠⢁⠁⠁⢠⠁⣾⣿⣿⣿",
    "⣿⣿⣿⣿⣿⠀⢿⢠⠡⠁⡹⢠⡄⢸⣿⣿⣿⣿⣿⣏⠘⣿⡆⢼⣿⣿⣿⡿⠟⠉⠉⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠿⠿⡿⢠⣿⢠⣆⠼⠛⠉⣡⣈⠓⢰⣠⠋⠔⣱⢋⣼⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣧⠘⢄⢢⠁⡑⢦⡙⢸⣿⣿⣿⣿⡿⣿⡁⢹⣷⡘⠿⠟⠁⠀⢠⣂⣴⣿⣿⣶⣶⣾⣿⣦⣄⣀⠀⠀⠉⣡⣿⠃⠞⣁⣀⣴⣶⣎⠛⣷⣄⢱⣠⡾⢋⣾⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣶⡈⢾⣦⣹⣾⣷⡈⠻⣿⣿⣿⣿⣿⠟⡂⢿⣿⣆⡀⢰⡾⠿⠿⠿⣛⣛⣛⣛⣛⣛⣛⡻⠿⡧⢀⡴⠿⠿⠈⣾⣿⣿⣿⣿⣿⢣⢸⡏⠈⢋⣴⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣦⡙⠿⣿⣏⡱⠄⠻⣿⣷⢿⠽⣷⠙⠆⢻⣿⣷⣆⣀⠲⠿⣿⣿⣿⣿⣿⣿⣿⠿⠿⣃⣴⡞⢰⣶⠦⢐⣠⣿⣿⣿⣿⠏⠀⠈⣴⠀⣤⠙⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣬⡑⠿⡿⢷⣌⠻⣍⣶⠞⠗⡆⠀⠉⠻⠿⢿⣷⣶⣦⣭⣭⣭⣭⣭⣶⣶⣾⣟⠉⠰⢻⣿⣷⣿⣿⣿⡿⢿⣿⡂⠆⠀⢿⣦⠹⣃⣉⢿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡮⠭⠉⠗⣈⡑⠀⠈⠁⠄⢀⣠⡀⡐⠈⠉⠙⠛⠿⠿⠿⠟⠛⡉⠉⡀⠂⠀⠘⠿⠿⠿⢛⣥⣶⣦⣉⣙⢳⡿⢆⣹⠃⣿⣿⡄⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣋⣩⣴⣾⣶⣿⣿⣿⣾⣿⣿⣦⣀⡈⠀⣿⣷⣄⠀⠀⠀⢀⡆⠀⠀⡆⣰⢱⡠⢀⣉⣁⣤⣾⣿⣿⣿⣿⣿⣿⣮⡳⠿⣀⣀⠿⢛⣡⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣁⣊⣙⣋⣍⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣙⠻⣿⣷⣤⣀⣿⠃⡄⡠⡇⠃⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣵⣦⣩⣶⣦⡶⠞⢉⠈⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⠟⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣮⣙⠻⣿⣿⡆⢓⣥⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⠈⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠓⣨⣥⣶⣿⣿⣿⣿⡿⠋⠀⢠⣿⣿⣿⣿⣿⡿⢿⡿⢿⠿⣿⣿⣿⣿⣿⣿⣿⣷⠸⣿⣿⣿",
    "⣿⣿⣿⣿⠃⣼⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠛⠋⠛⠛⠿⡏⠳⢿⣦⢇⢹⠇⣸⣿⣿⣿⣿⠟⢛⣛⠁⠀⣴⣶⣿⣿⣿⠟⣡⠂⢀⣡⣞⡻⠿⣿⣿⣿⣿⣿⣩⠛⣿⠀⣿⣿⣿",
    "⣿⣿⣿⣿⡆⣿⡙⢿⡙⣟⠋⠃⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠊⠦⣠⣾⣿⣿⡟⠀⢀⣿⣿⣿⣿⠟⠫⠍⠛⠁⠒⠀⠀⠊⠥⠴⠅⠒⠁⢤⡴⢟⠋⣁⠙⠥⠔⢰⣿⣿⣿",
    "⣿⣿⣿⣿⣇⠻⡙⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⣶⣿⡟⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠛⠋⡀⣼⣿⣿⣿",
    "⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠿⡘⣿⠸⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢿⣿⣿",
    "⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⢠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣀⠀⠀⠀⣀⣠⣤⣄⡀⠀⣠⣤⣤⣴⣦⣤⣶⣶⣶⣤⣤⣤⣤⣤⣤⡄⢠⣴⡦⠀⠀⠀⠀⠀⠀⠈⢻⣿",
    "⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠘⣿⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣿⣿⣿⣿⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⣾⡟⣀⣠⣤⣤⣤⣀⡀⠀⠈⢿",
    "⣿⣿⡏⠀⠀⣠⣴⣾⣿⣿⣷⣌⢻⣿⢸⡏⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣸⡟⣰⣿⣿⣿⣿⣿⣿⣿⣿⣶⡌",
    "⣿⡏⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⡎⢿⣾⡇⣼⣿⣿⡿⠿⠟⠛⠛⠛⠋⠉⠙⠛⠀⠛⠛⠛⠛⠛⠛⠸⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠻⠿⣿⠇⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧",
    "⡟⢱⣿⡿⠿⠿⠿⠿⠿⠿⣿⣿⣷⠸⠈⠐⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠉⠈⠛⠻⢿⣿⣿⣿⡿⠿⠿⠿",
    "                                                                 ",
  },
}

return headers
