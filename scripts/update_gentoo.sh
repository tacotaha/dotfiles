#!/bin/bash

# 1. Sync the portage tree
emerge --sync

# 2. Upgrade the whole system 
emerge -avuDN --with-bdeps y --keep-going world

# 3. Make config changes
etc-update

# 4. Uninstall unused packages
emerge -av --depclean

# 5. Reverse dynamic lib dependencies
revdep-rebuild

# 6. Clean source code of old packages
eclean -d distfiles
