local M = {}

M.setup = function()
    local db = require('dashboard')

    db.custom_header = {
        "            :h-                                  Nhy`               ",
        "           -mh.                           h.    `Ndho               ",
        "           hmh+                          oNm.   oNdhh               ",
        "          `Nmhd`                        /NNmd  /NNhhd               ",
        "          -NNhhy                      `hMNmmm`+NNdhhh               ",
        "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
        "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
        "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
        "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
        " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
        " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
        " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
        " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
        "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
        "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
        "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
        "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
        "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
        "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
        "       //+++//++++++////+++///::--                 .::::-------::   ",
        "       :/++++///////////++++//////.                -:/:----::../-   ",
        "       -/++++//++///+//////////////               .::::---:::-.+`   ",
        "       `////////////////////////////:.            --::-----...-/    ",
        "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
        "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
        "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
        "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
        "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
        "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
        "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
        "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
        "                        .-:mNdhh:.......--::::-`                    ",
        "                           yNh/..------..`                          ",
        "                                                                    ",
    }
    -- db.custom_header  -- type can be nil,table or function(must be return table in function)
    --                   -- if not config will use default banner
    -- db.custom_center  -- table type and in this table you can set icon,desc,shortcut,action keywords. desc must be exist and type is string
    --                   -- icon type is nil or string
    --                   -- icon_hl table type { fg ,bg} see `:h vim.api.nvim_set_hl` opts
    --                   -- shortcut type is nil or string also like icon
    --                   -- action type can be string or function or nil.
    --                   -- if you don't need any one of icon shortcut action ,you can ignore it.
    -- db.custom_footer  -- type can be nil,table or function(must be return table in function)
    -- db.preview_file_Path    -- string or function type that mean in function you can dynamic generate height width
    -- db.preview_file_height  -- number type
    -- db.preview_file_width   -- number type
    -- db.preview_command      -- string type (can be ueberzug which only work in linux)
    -- db.confirm_key          -- string type key that do confirm in center select
    -- db.hide_statusline = false
    -- db.hide_tabline         -- boolean default is true.it will hide tabline in dashboard buffer and auto open in other buffer
    -- db.session_directory    -- string type the directory to store the session file
    -- db.header_pad           -- number type default is 1
    -- db.center_pad           -- number type default is 1
    -- db.footer_pad           -- number type default is 1

    -- example of db.custom_center for new lua coder,the value of nil mean if you
    -- don't need this filed you can not write it
    --vim.keymap.set("n", "<leader>bb", "<cmd>Telescope<CR>", { buffer = 0, silent = true })
    -- vim.api.nvim_create_autocmd("BufLeave", {
    --     pattern = dashboard,
    --     callback = function()
    --         vim.schedule(function()
    --             vim.cmd [[ bd ]]
    --         end)
    --     end
    -- })

    db.custom_center = {
        { icon = '  ',
            desc = 'Git summary',
            action = 'bd | G' },
    }
    -- db.custom_center = {
    --   { icon = 'some icon' desc = 'some description here' } --correct if you don't action filed
    --   { desc = 'some description here' }                    --correct if you don't action and icon filed
    --   { desc = 'some description here' action = 'Telescope find files'} --correct if you don't icon filed
    -- }

    -- -- Highlight Group
    -- DashboardHeader DashboardCenter DashboardShortCut DashboardFooter

    -- -- Command

    -- DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
    -- SessionSave,SessionLoad
end

M.keys = function()

end

return M
