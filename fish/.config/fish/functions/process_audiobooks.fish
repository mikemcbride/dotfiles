function process_audiobooks
    # Rename files - Audible appends _ep6, _ep7, etc. to downloads.
    # Only strip the episode suffix, preserving any chapter info in the name.
    for f in *.aax
        set -l clean_name (string replace -r '_ep[0-9]+\.aax$' '.aax' $f)
        if test $clean_name != $f
            mv $f $clean_name
        end
    end

    # Convert to m4b using -c copy to preserve all streams, metadata, and chapters.
    for f in *.aax
        set -l output (string replace -r '\.aax$' '.m4b' $f)
        ffmpeg -activation_bytes 2b92750b -i $f -c copy $output
    end

    mkdir -p finished
    mv *.m4b ./finished/
end
