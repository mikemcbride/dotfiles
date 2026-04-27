function abook_combine
    if test (count $argv) -eq 0
        echo "Usage: abook_combine <output_name>"
        echo "Combines all .aax files in the current directory into a single .m4b, preserving chapters."
        return 1
    end

    set -l output_name (string replace -r '\.m4b$' '' $argv[1])

    # Check for .aax files (fish returns the glob pattern itself if nothing matches)
    set -l aax_files *.aax
    if not test -e $aax_files[1]
        echo "No .aax files found in current directory."
        return 1
    end

    set -l tmpdir (mktemp -d)
    set -l concat_file $tmpdir/concat.txt

    # Convert each .aax to a temp .m4b, stripping Audible episode suffixes.
    # -c copy preserves all streams and chapter markers within each file.
    echo "Converting individual files..."
    for f in (ls *.aax | sort)
        set -l clean_name (string replace -r '_ep[0-9]+\.aax$' '.m4b' $f | string replace -r '\.aax$' '.m4b')
        set -l temp_file $tmpdir/$clean_name
        echo "  -> $f"
        ffmpeg -loglevel error -activation_bytes 2b92750b -i $f -c copy $temp_file
        printf "file '%s'\n" $temp_file >> $concat_file
    end

    # Concatenate all temp files. The concat demuxer carries over chapter markers
    # from each segment, adjusting timestamps so they remain accurate in the output.
    echo "Combining into $output_name.m4b..."
    ffmpeg -loglevel error -f concat -safe 0 -i $concat_file -c copy "$output_name.m4b"

    rm -rf $tmpdir
    echo "Done! Output: $output_name.m4b"
end
