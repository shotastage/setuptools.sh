#!/usr/bin/env bash

#!/usr/bin/env bash

set -e


verify_script() {
    echo "🔑  Verifying script..."


    echo $1
    echo $2

    curl --quiet -O $2 >> /dev/null

    if [ ! "`gpg --verify $1.sig $1 | grep 'Good signature'`" ]; then
        echo "❌  Bad signature! "
        exit 1
    fi
}
