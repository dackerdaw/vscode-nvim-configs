
-- vscode and nvim only settings
if (vim.g.vscode) then
    -- global settings
    require "core"

    -- packer.nvim config

    -- ensure that packer is installed
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end

    -- configure plugins
    require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'
        
        use {
            'ggandor/leap.nvim',
            config = function()
                require("leap").add_default_mappings(true)
            end
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end
    )
else
    -- ordinary neovim
end