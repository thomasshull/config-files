

if test (set -q SDKMAN_INITIALIZED; echo $status) -eq 1
    echo "Initializating SDK..." (sdk version)
    set -gx SDKMAN_INITIALIZED 1
end

