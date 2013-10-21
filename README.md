test-bw
=======

Script to test your bandwidth

# Note #

Complete modified from the original version! Now uses bash arrays and for-loop!

To change the URLs and their corresponding labels, edit the 2 arrays: `$labels[]` and `$urls[]`.

Make sure they are of the same number of items.

# Note 2 #

I included a special case for download an Ubuntu ISO. It is separate from the for-loop because I set it to download within a certain range only. Modify to use your own Ubuntu mirror as needed.

# Note 3 #

The default urls are based in the Philippines. Modify these as needed.
