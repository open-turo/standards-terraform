#! /bin/awk

BEGIN {
    in_required_providers = 0;
    brace_count = 0;
    version_prefix_regex = ".*version[[:space:]]+=[[:space:]]+";
    provider_prefix_regex = "[a-z_-]+[[:space:]]+=[[:space:]]+{";
    version_constraints_regex = "[!~><]+";
}

{
    if ($0 ~ /required_providers/) {
        in_required_providers = 1;
    }

    # If inside "required_providers" block, count braces
    if (in_required_providers) {
        brace_count += gsub(/{/, "{");
        brace_count -= gsub(/}/, "}");

        # If brace count returns to 0, exit the block
        if (brace_count == 0) {
            in_required_providers = 0;
            next;
        }

        if ($0 ~ provider_prefix_regex) {
            provider = $1;
        }

        # If the line doesn't contain a version, skip
        if (!($0 ~ version_prefix_regex)) {
            next;
        } else {
            # If the line contains a version, remove the prefix
            gsub(version_prefix_regex, "", $0);
            if ($0 ~ version_constraints_regex) {
                # remove trailing curly brace if any (happens when version is inlined)
                gsub(/}/, "", $0);
                error[++i] = "ERROR: '" provider "' version not in pinned format: " $0 " in file " FILENAME;
            }
        }
    }
}

END {
    if (length(error) > 0) {
        for (j = 1; j <= i; j++) {
            print error[j]
        }
        exit 1;
    }
}
