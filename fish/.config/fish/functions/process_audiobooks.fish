function process_audiobooks
  for f in *.aax
    # rename the file. Audible downloads append a _ep6 or _ep7 to the end of the title
    # I know I can update the variable here and use a single loop, but I don't care.
    mv $f (string replace -r '_ep[1-9].aax' '.aax' $f)
  end

  for f in *.aax
    # use ffmpeg to decode the files
    # this is the activation code for my audible files. it will only work with books i've purchased.
    ffmpeg -activation_bytes 2b92750b -i $f -c copy (string replace -r '.aax' '.m4b' $f)
  end

  # move all the files to a "finished" directory
  mkdir -p finished
  mv *.m4b ./finished/
end

