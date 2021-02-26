function update-all
        # cargo upgrade
        echo 'Updating cargo packages'
        cargo install --list | \
                awk 'NR%2 == 1 {print $0}' | \
                cut -d' ' -f1 | \
                xargs -n 1 cargo install --force

        # pip2 upgrade
        echo 'Updating pip2 packages'
        pip2 --disable-pip-version-check --no-python-version-warning freeze --no-color | \
                sed -r 's/^([^=]*).*$/\1' | \
                xargs -n 1 pip2 install -U 

        # pip3 upgrade
        echo 'Updating pip3 packages'
        pip3 --disable-pip-version-check --no-python-version-warning freeze --no-color | \
                sed -r 's/^([^=]*).*$/\1' | \
                xargs -n 1 pip2 install -U 

        # upgrade neovim packages
        echo 'Updating Neovim packages'
        nvim +PlugUpgrade +PlugUpdate +PlugInstall +qall

        # upgrade npm packages
        echo 'Updating NPM packages'
        sudo npm -g update
end

