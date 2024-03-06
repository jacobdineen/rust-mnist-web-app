# Default flag values
SERVE=true

# Parse command line arguments
for arg in "$@"
do
    case $arg in
        --serve)
        SERVE=true
        shift # Remove --serve from processing
        ;;
        *)
        FEATURES="$arg" # Assume any other argument is a feature list
        ;;
    esac
done

# If --serve flag is set, start a local HTTP server
if [ "$SERVE" = true ] ; then
    if ! command -v python3 &> /dev/null
    then
        echo "python3 could not be found. Running server requires python3."
        exit
    fi

    echo "Running local python HTTP server on port 8083 ..."
    python3 -m http.server 8086
fi
