#!/usr/bin/env bash

#!/usr/bin/env bash

set -e


verify_script() {
    echo "🔑  Verifying script..."

    curl -o $2

    if [ ! "`gpg --verify $2 $1 | grep 'Good signature'`" ]; then
        echo "❌  Bad signature! "
        exit 1
    fi
}
