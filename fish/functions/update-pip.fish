function update-pip
        # pip2 upgrade
        echo 'Updating pip2 packages'
        echo 'Collecting packages'
        set -l pkgs (pip2 --disable-pip-version-check --no-python-version-warning freeze --no-color)

        echo 'Starting install'
        for pkg in (string split " " "$pkgs")
                set pkg (string split '==' "$pkg" -f1)
                sudo pip2 install -U $pkg --disable-pip-version-check --no-python-version-warning
        end

        echo "==========="

        # pip3 upgrade
        echo 'Updating pip3 packages'
        echo 'Collecting packages'
        set -l pkgs (pip3 --disable-pip-version-check --no-python-version-warning freeze --no-color)

        echo 'Starting install'
        for pkg in (string split " " "$pkgs")
                set pkg (string split '==' "$pkg" -f1)
                sudo pip3 install -U $pkg --disable-pip-version-check --no-python-version-warning
        end
end

